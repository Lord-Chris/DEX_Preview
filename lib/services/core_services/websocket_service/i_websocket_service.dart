import 'dart:async';

import '../../../models/_models.dart';

/// An interface for a WebSocket service.
abstract class IWebSocketService {
  /// Initializes the WebSocket service.
  Future<void> init();

  /// Subscribes to a symbol with the specified interval and depth.
  ///
  /// Returns the subscription ID.
  String subscribeToSymbol(String symbol, String interval, String depth);

  /// Unsubscribes from a symbol with the specified interval and depth.
  void unsubscribeFromSymbol(String symbol, String interval, String depth);

  /// Disposes the WebSocket service.
  Future<void> dispose();

  /// A stream of ticker data.
  Stream<TickerData> get tickerDataStream;

  /// A stream of candle data.
  Stream<List<CandleData>> get candleDataStream;

  /// A stream of orderbook data.
  Stream<OrderbookData> get orderbookDataStream;
}
