import '../../../core/app/_app.dart';
import '../../../models/_models.dart';
import '../../core_services/_core_services.dart';
import 'i_binance_service.dart';

/// A service class that interacts with the Binance API to fetch symbol and candle data.
class BinanceService extends IBinanceService {
  static const _baseUrl = 'https://api.binance.com/api/v3';
  final _networkService = locator<INetworkService>();

  /// Fetches a list of symbol data from the Binance API.
  ///
  /// Returns a list of [SymbolData] objects.
  @override
  Future<List<SymbolData>> fetchSymbols() async {
    const uri = '$_baseUrl/ticker';
    final res = await _networkService.get(uri);
    return (res as List<dynamic>).map((e) => SymbolData.fromJson(e)).toList();
  }

  /// Fetches a list of candle data for a specific symbol and interval from the Binance API.
  ///
  /// - [symbol]: The symbol for which to fetch the candle data.
  /// - [interval]: The interval of the candle data (e.g., '1m', '1h', '1d').
  ///
  /// Returns a list of [CandleData] objects.
  @override
  Future<List<CandleData>> fetchCandles(String symbol, String interval) async {
    final uri = '$_baseUrl/klines?symbol=$symbol&interval=$interval';
    final res = await _networkService.get(uri);

    return (res as List<dynamic>)
        .map((e) => CandleData.fromBinanceJson(e, interval, symbol))
        .toList();
  }
}
