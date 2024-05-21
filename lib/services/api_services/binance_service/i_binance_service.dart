import '../../../models/_models.dart';

abstract class IBinanceService {
  Future<List<SymbolData>> fetchSymbols();
  Future<List<CandleData>> fetchCandles(String symbol, String interval);
}
