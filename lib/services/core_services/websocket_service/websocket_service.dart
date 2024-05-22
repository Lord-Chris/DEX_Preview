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

  StreamSubscription<dynamic>? _klinesSS;

  final StreamController<TickerData> _tickerDataSC =
      StreamController<TickerData>.broadcast();
  final StreamController<List<CandleData>> _candleDataSC =
      StreamController<List<CandleData>>.broadcast();
  final StreamController<OrderbookData> _orderbookDataSC =
      StreamController<OrderbookData>.broadcast();

  WebSocketChannel? _klinesSocket;
  String? _id;

  @override
  Future<void> init() async {
    try {
      final wsUrl = Uri.parse(_channel);
      _klinesSocket = WebSocketChannel.connect(wsUrl);

      await _klinesSocket?.ready;

      _klinesSS = _klinesSocket?.stream.listen((message) {
        try {
          _log.w('Instance of Message: $message');
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
    } on Exception catch (e) {
      _log.e(e);
      throw CoreFailure(data: e);
    }
  }

  @override
  String subscribeToSymbol(
    String symbol,
    String interval,
    String depth,
  ) {
    _id = IdUtils.generateId();
    symbol = symbol.toLowerCase();

    _klinesSocket?.sink.add(
      jsonEncode({
        'method': 'SUBSCRIBE',
        'params': [
          '$symbol@ticker',
          '$symbol@kline_$interval',
          '$symbol@depth$depth',
        ],
        'id': IdUtils.generateId(),
      }),
    );

    return _id!;
  }

  @override
  Future<void> unsubscribeFromSymbol(
    String symbol,
    String interval,
    String depth,
  ) async {
    try {
      if (_id == null) return;
      symbol = symbol.toLowerCase();
      _klinesSocket?.sink.add({
        'method': 'UNSUBSCRIBE',
        'params': [
          '$symbol@ticker',
          '$symbol@kline_$interval',
          '$symbol@depth$depth',
        ],
        'id': _id,
      });

      await init();
    } catch (e) {
      _log.e(e);
      throw CoreFailure(data: e);
    }
  }

  @override
  Future<void> dispose() async {
    _klinesSocket?.sink.close(normalClosure);
    _klinesSS?.cancel();
  }

  @override
  Stream<TickerData> get tickerDataStream => _tickerDataSC.stream;
  @override
  Stream<List<CandleData>> get candleDataStream => _candleDataSC.stream;
  @override
  Stream<OrderbookData> get orderbookDataStream => _orderbookDataSC.stream;
}
