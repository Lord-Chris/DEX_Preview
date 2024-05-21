// {
//   "id": "b137468a-fb20-4c06-bd6b-625148eec958",
//   "status": 200,
//   "result": [
//     [
//       1655971200000,      // Kline open time
//       "0.01086000",       // Open price
//       "0.01086600",       // High price
//       "0.01083600",       // Low price
//       "0.01083800",       // Close price
//       "2290.53800000",    // Volume
//       1655974799999,      // Kline close time
//       "24.85074442",      // Quote asset volume
//       2283,               // Number of trades
//       "1171.64000000",    // Taker buy base asset volume
//       "12.71225884",      // Taker buy quote asset volume
//       "0"                 // Unused field, ignore
//     ]
//   ],
//   "rateLimits": [
//     {
//       "rateLimitType": "REQUEST_WEIGHT",
//       "interval": "MINUTE",
//       "intervalNum": 1,
//       "limit": 6000,
//       "count": 2
//     }
//   ]
// }
import 'package:candlesticks/candlesticks.dart';

class CandleData {
  final int openTime;
  final double open;
  final double high;
  final double low;
  final double close;
  final double volume;
  final int closeTime;
  final double quoteAssetVolume;
  final int numberOfTrades;
  final double takerBuyBaseAssetVolume;
  final double takerBuyQuoteAssetVolume;

  CandleData({
    required this.openTime,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
    required this.closeTime,
    required this.quoteAssetVolume,
    required this.numberOfTrades,
    required this.takerBuyBaseAssetVolume,
    required this.takerBuyQuoteAssetVolume,
  });

  factory CandleData.fromJson(List<dynamic> json) {
    return CandleData(
      openTime: json[0],
      open: double.parse(json[1]),
      high: double.parse(json[2]),
      low: double.parse(json[3]),
      close: double.parse(json[4]),
      volume: double.parse(json[5]),
      closeTime: json[6],
      quoteAssetVolume: double.parse(json[7]),
      numberOfTrades: json[8],
      takerBuyBaseAssetVolume: double.parse(json[9]),
      takerBuyQuoteAssetVolume: double.parse(json[10]),
    );
  }

  Candle toCandle() {
    return Candle(
      date: DateTime.fromMillisecondsSinceEpoch(openTime),
      open: open,
      high: high,
      low: low,
      close: close,
      volume: volume,
    );
  }
}
