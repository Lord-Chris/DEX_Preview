import 'dart:async';

import '../../../models/_models.dart';

abstract class IWebSocketService {
  Future<void> init(String symbol);
  String subscribeToSymbol(String symbol, String interval);
  void unsubscribeFromSymbol(int id, String symbol, String interval);
  Future<void> dispose();

  Stream<TickerData> get tickerDataStream;
  Stream<List<CandleData>> get candleDataStream;
}
