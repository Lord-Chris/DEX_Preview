import '../../../models/_models.dart';

/// Interface for the Binance service.
abstract class IBinanceService {
  /// Fetches a list of symbol data.
  ///
  /// Returns a [Future] that resolves to a list of [SymbolData].
  Future<List<SymbolData>> fetchSymbols();

  /// Fetches a list of candle data for a specific symbol and interval.
  ///
  /// - [symbol]: The symbol for which to fetch the candle data.
  /// - [interval]: The interval for the candle data (e.g., "1m", "1h", "1d").
  ///
  /// Returns a [Future] that resolves to a list of [CandleData].
  Future<List<CandleData>> fetchCandles(String symbol, String interval);
}
