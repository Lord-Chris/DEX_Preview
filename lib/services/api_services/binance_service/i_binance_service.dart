import '../../../models/_models.dart';

abstract class IBinanceService {
  Future<List<String>> fetchSymbols();
  Future<List<CandleData>> fetchCandles(String symbol, String interval);
}
