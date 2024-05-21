import 'dart:async';
import 'dart:convert';

import 'package:web_socket_client/web_socket_client.dart';

import '../../../core/_core.dart';
import '../../../core/app/_app.dart';
import '../../../models/_models.dart';
import 'i_websocket_service.dart';

class WebSocketService extends IWebSocketService {
  static const _channel = 'wss://nbstream.binance.com/eoptions/stream?streams=';
  final _log = getLogger('WebSocketService');

  StreamSubscription<ConnectionState>? _connectionStateSS;
  StreamSubscription<dynamic>? _messageSS;

  final StreamController<TickerData> _tickerDataSC =
      StreamController<TickerData>.broadcast();
  final StreamController<CandleData> _candleDataSC =
      StreamController<CandleData>.broadcast();

  WebSocket? _socket;

  @override
  Future<void> init(String symbol) async {
    try {
      final wsUrl = Uri.parse('$_channel$symbol@ticker/$symbol@kline_1h');
      _socket = WebSocket(wsUrl);

      _connectionStateSS = _socket?.connection.listen((event) {
        _log.d(event);
      });

      subscribeToSymbol(symbol);

      _messageSS = _socket?.messages.listen((message) {
        try {
          _log.w(message);
          message = jsonDecode(message);
          if (message['data']['e'] == 'kline') {
            _candleDataSC.add(CandleData.fromJson(message['data']));
          } else {
            _tickerDataSC.add(TickerData.fromJson(message['data']));
          }
        } catch (e) {
          _log.e(e);
        }
      });
    } on Exception catch (e) {
      throw CoreFailure(data: e);
    }
  }

  @override
  int subscribeToSymbol(String symbol) {
    final id = IdUtils.generateId();
    _socket?.send({
      'method': 'SUBSCRIBE',
      'params': ['$symbol@ticker', '$symbol@kline_1h'],
      'id': id,
    });
    return id;
  }

  @override
  void unsubscribeFromSymbol(int id, String symbol) {
    _socket?.send({
      'method': 'UNSUBSCRIBE',
      'params': ['$symbol@ticker', '$symbol@depth'],
      'id': id,
    });
  }

  @override
  Future<void> dispose() async {
    _connectionStateSS?.cancel();
    _messageSS?.cancel();
    _socket?.close();
  }

  @override
  Stream<TickerData> get tickerDataStream => _tickerDataSC.stream;
  @override
  Stream<CandleData> get candleDataStream => _candleDataSC.stream;
}
