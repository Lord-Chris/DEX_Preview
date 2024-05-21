import '../../../core/app/_app.dart';
import '../../../models/_models.dart';
import '../../core_services/_core_services.dart';
import 'i_binance_service.dart';

class BinanceService extends IBinanceService {
  final _networkService = locator<INetworkService>();

  @override
  Future<List<String>> fetchSymbols() async {
    // const uri = 'https://eapi.binance.com/eapi/v1/index?underlying=BTCUSDT';
    const uri = 'https://eapi.binance.com/eapi/v1/ticker';
    final res = await _networkService.get(uri);
    return (res as List<dynamic>).map((e) => e['symbol'] as String).toList();
  }

  @override
  Future<List<CandleData>> fetchCandles(String symbol, String interval) async {
    final uri =
        'https://eapi.binance.com/eapi/v1/klines?symbol=$symbol&interval=$interval';
    final res = await _networkService.get(uri);

    return (res as List<dynamic>).map((e) {
      e['symbol'] = symbol;
      return CandleData.fromJson2(e);
    }).toList();
  }
}
