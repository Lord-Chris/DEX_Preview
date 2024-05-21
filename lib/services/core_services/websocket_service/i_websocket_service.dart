import 'dart:async';

import '../../../models/_models.dart';

abstract class IWebSocketService {
  Future<void> init(String symbol);
  void subscribeToSymbol(String symbol);
  void unsubscribeFromSymbol(int id, String symbol);
  Future<void> dispose();

  Stream<TickerData> get tickerDataStream;
  Stream<CandleData> get candleDataStream;
}