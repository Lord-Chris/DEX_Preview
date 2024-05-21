import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/status.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../core/_core.dart';
import '../../../core/app/_app.dart';
import '../../../models/_models.dart';
import 'i_websocket_service.dart';

class WebSocketService extends IWebSocketService {
  static const _channel = 'wss://ws-api.binance.com:443/ws-api/v3';
  final _log = getLogger('WebSocketService');

  StreamSubscription<dynamic>? _tickerSS;
  StreamSubscription<dynamic>? _klinesSS;

  final StreamController<TickerData> _tickerDataSC =
      StreamController<TickerData>.broadcast();
  final StreamController<List<CandleData>> _candleDataSC =
      StreamController<List<CandleData>>.broadcast();

  WebSocketChannel? _tickerSocket;
  WebSocketChannel? _klinesSocket;

  @override
  Future<void> init(String symbol) async {
    try {
      final wsUrl = Uri.parse(_channel);
      _tickerSocket = WebSocketChannel.connect(wsUrl);
      _klinesSocket = WebSocketChannel.connect(wsUrl);

      await _tickerSocket?.ready;
      await _klinesSocket?.ready;

      _tickerSS = _tickerSocket?.stream.listen((message) {
        try {
          _log.w(message);
          message = jsonDecode(message);
          _tickerDataSC.add(TickerData.fromJson(message['result']));
        } catch (e) {
          _log.e('Ticker SS Error: $e');
        }
      });

      _klinesSS = _klinesSocket?.stream.listen((message) {
        try {
          _log.w('Instance of KLINESSS');
          message = jsonDecode(message);
          _candleDataSC.add((message?['result'] as List)
              .map((e) => CandleData.fromJson(e))
              .toList());
        } catch (e) {
          _log.e('Klines SS Error: $e');
        }
      });
    } on Exception catch (e) {
      _log.e(e);
      throw CoreFailure(data: e);
    }
  }

  @override
  String subscribeToSymbol(String symbol, String interval) {
    final id = IdUtils.generateId();
    _tickerSocket?.sink.add(jsonEncode({
      'id': id,
      'method': 'ticker.24hr',
      'params': {'symbol': symbol}
    }));
    _klinesSocket?.sink.add(jsonEncode({
      'id': id,
      'method': 'uiKlines',
      'params': {
        'symbol': symbol,
        'interval': interval,
      }
    }));
    return id;
  }

  @override
  void unsubscribeFromSymbol(int id, String symbol, String interval) {
    _tickerSocket?.sink.add({
      'method': 'UNSUBSCRIBE',
      'params': ['$symbol@ticker', '$symbol@kline_$interval'],
      'id': id,
    });
    _klinesSocket?.sink.add({
      'method': 'UNSUBSCRIBE',
      'params': ['$symbol@ticker', '$symbol@kline_$interval'],
      'id': 1,
    });
  }

  @override
  Future<void> dispose() async {
    _tickerSocket?.sink.close(normalClosure);
    _klinesSocket?.sink.close(normalClosure);
    _tickerSS?.cancel();
    _klinesSS?.cancel();
  }

  @override
  Stream<TickerData> get tickerDataStream => _tickerDataSC.stream;
  @override
  Stream<List<CandleData>> get candleDataStream => _candleDataSC.stream;
}
