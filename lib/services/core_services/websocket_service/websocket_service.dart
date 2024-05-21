import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_client/web_socket_client.dart';

import '../../../core/_core.dart';
import '../../../core/app/_app.dart';
import '../../../models/_models.dart';
import 'i_websocket_service.dart';

class WebSocketService extends IWebSocketService {
  static const _channel = 'wss://nbstream.binance.com/eoptions/stream';
  final _log = getLogger('WebSocketService');

  StreamSubscription<ConnectionState>? _connectionStateSS;
  StreamSubscription<dynamic>? _messageSS;

  final StreamController<TickerData> _tickerDataSC =
      StreamController<TickerData>.broadcast();
  final StreamController<CandleData> _candleDataSC =
      StreamController<CandleData>.broadcast();

  WebSocket? _socket;
  WebSocketChannel? _socketChannel;

  @override
  Future<void> init(String symbol) async {
    try {
      final wsUrl = Uri.parse(_channel);
      // _socket = WebSocket(wsUrl);
      _socketChannel = WebSocketChannel.connect(wsUrl);

      _connectionStateSS = _socket?.connection.listen((event) {
        _log.d(event);
      });

      await _socketChannel?.ready;

      _messageSS = _socket?.messages.listen((message) {
        try {
          _log.w(message);
          message = jsonDecode(message);
          if (message?['data']?['e'] == 'kline') {
            _candleDataSC.add(CandleData.fromJson(message['data']));
          }
          if (message?['data']?['e'] == '24hrTicker') {
            _tickerDataSC.add(TickerData.fromJson(message['data']));
          }
        } catch (e) {
          _log.e('Socket Error: $e');
        }
      });

      _messageSS ??= _socketChannel?.stream.listen((message) {
        try {
          _log.w(message);
          message = jsonDecode(message);
          if (message?['data']?['e'] == 'kline') {
            _candleDataSC.add(CandleData.fromJson(message['data']));
          }
          if (message?['data']?['e'] == '24hrTicker') {
            _tickerDataSC.add(TickerData.fromJson(message['data']));
          }
        } catch (e) {
          _log.e('Socket Channel Error: $e');
        }
      });
    } on Exception catch (e) {
      _log.e(e);
      throw CoreFailure(data: e);
    }
  }

  @override
  int subscribeToSymbol(String symbol, String interval) {
    final id = IdUtils.generateId();
    _socket?.send(jsonEncode({
      'method': 'SUBSCRIBE',
      'params': ['$symbol@index', '$symbol@kline_$interval'],
      'id': id,
    }));
    _socketChannel?.sink.add(jsonEncode({
      'method': 'SUBSCRIBE',
      'params': ['$symbol@ticker', '$symbol@kline_$interval'],
      'id': 1,
    }));
    return id;
  }

  @override
  void unsubscribeFromSymbol(int id, String symbol, String interval) {
    _socket?.send({
      'method': 'UNSUBSCRIBE',
      'params': ['$symbol@ticker', '$symbol@kline_$interval'],
      'id': id,
    });
    _socketChannel?.sink.add({
      'method': 'UNSUBSCRIBE',
      'params': ['$symbol@ticker', '$symbol@kline_$interval'],
      'id': 1,
    });
  }

  @override
  Future<void> dispose() async {
    _socket?.close();
    _socketChannel?.sink.close();
    _connectionStateSS?.cancel();
    _messageSS?.cancel();
  }

  @override
  Stream<TickerData> get tickerDataStream => _tickerDataSC.stream;
  @override
  Stream<CandleData> get candleDataStream => _candleDataSC.stream;
}
