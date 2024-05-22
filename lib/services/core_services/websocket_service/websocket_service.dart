import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/status.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../core/_core.dart';
import '../../../core/app/_app.dart';
import '../../../models/_models.dart';
import 'i_websocket_service.dart';

class WebSocketService extends IWebSocketService {
  static const _channel = 'wss://stream.binance.com:443/stream';
  final _log = getLogger('WebSocketService');

  StreamSubscription<dynamic>? _tickerSS;
  StreamSubscription<dynamic>? _klinesSS;
  StreamSubscription<dynamic>? _orderbookSS;

  final StreamController<TickerData> _tickerDataSC =
      StreamController<TickerData>.broadcast();
  final StreamController<List<CandleData>> _candleDataSC =
      StreamController<List<CandleData>>.broadcast();
  final StreamController<OrderbookData> _orderbookDataSC =
      StreamController<OrderbookData>.broadcast();

  WebSocketChannel? _tickerSocket;
  WebSocketChannel? _klinesSocket;
  WebSocketChannel? _orderbookSocket;

  @override
  Future<void> init(String symbol) async {
    try {
      final wsUrl = Uri.parse(_channel);
      // _tickerSocket = WebSocketChannel.connect(wsUrl);
      _klinesSocket = WebSocketChannel.connect(wsUrl);
      // _orderbookSocket = WebSocketChannel.connect(wsUrl);

      await _tickerSocket?.ready;
      await _klinesSocket?.ready;
      await _orderbookSocket?.ready;

      _tickerSS = _tickerSocket?.stream.listen((message) {
        try {
          _log.w('Instance of TICKERSS: $message');
          message = jsonDecode(message);
          if (message['data']?['e'] == '24hrTicker') {
            _tickerDataSC.add(TickerData.fromJson(message['data']));
          }
        } catch (e) {
          _log.e('Ticker SS Error: $e');
        }
      });

      _klinesSS = _klinesSocket?.stream.listen((message) {
        try {
          _log.w('Instance of KLINESSS: $message');
          message = jsonDecode(message);
          if (message['data']?['e'] == '24hrTicker') {
            _tickerDataSC.add(TickerData.fromJson(message['data']));
          }
          if (message['data']?['e'] == 'kline') {
            _candleDataSC.add([CandleData.fromJson(message['data']?['k'])]);
          }
          if (message['data']?['bids'] != null) {
            _orderbookDataSC.add(OrderbookData.fromJson(message['data']));
          }
        } catch (e) {
          _log.e('Klines SS Error: $e');
        }
      });

      _orderbookSS = _orderbookSocket?.stream.listen((message) {
        try {
          _log.w('Instance of ORDERBOOKSS: $message');
          message = jsonDecode(message);
          if (message['data']?['bids'] != null) {
            _orderbookDataSC.add(OrderbookData.fromJson(message['data']));
          }
        } catch (e) {
          _log.e('Orderbook SS Error: $e');
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
    symbol = symbol.toLowerCase();
    _tickerSocket?.sink.add(
      jsonEncode({
        'method': 'SUBSCRIBE',
        'params': [
          '$symbol@ticker',
        ],
        'id': 1,
      }),
    );
    _klinesSocket?.sink.add(
      jsonEncode({
        'method': 'SUBSCRIBE',
        'params': [
          '$symbol@ticker',
          '$symbol@kline_$interval',
          '$symbol@depth10',
        ],
        'id': 1,
      }),
    );
    _orderbookSocket?.sink.add(jsonEncode({
      'method': 'SUBSCRIBE',
      'params': [
        '$symbol@ticker',
        '$symbol@depth10',
      ],
      'id': 1,
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
    _orderbookSocket?.sink.close(normalClosure);
    _tickerSS?.cancel();
    _klinesSS?.cancel();
    _orderbookSS?.cancel();
  }

  @override
  Stream<TickerData> get tickerDataStream => _tickerDataSC.stream;
  @override
  Stream<List<CandleData>> get candleDataStream => _candleDataSC.stream;
  @override
  Stream<OrderbookData> get orderbookDataStream => _orderbookDataSC.stream;
}
