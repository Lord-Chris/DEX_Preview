import 'dart:async';

import '../../../models/_models.dart';

abstract class IWebSocketService {
  Future<void> init();
  String subscribeToSymbol(String symbol, String interval, String depth);
  void unsubscribeFromSymbol(String symbol, String interval, String depth);
  Future<void> dispose();

  Stream<TickerData> get tickerDataStream;
  Stream<List<CandleData>> get candleDataStream;
  Stream<OrderbookData> get orderbookDataStream;
}
