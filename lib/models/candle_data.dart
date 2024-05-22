import 'package:candlesticks/candlesticks.dart';

final mockCandleData = <String, dynamic>{
  'stream': 'btcusdt@kline_1s',
  'data': {
    'e': 'kline',
    'E': 1716368409005,
    's': 'BTCUSDT',
    'k': {
      't': 1716368408000,
      'T': 1716368408999,
      's': 'BTCUSDT',
      'i': '1s',
      'f': 3609227777,
      'L': 3609227780,
      'o': '70030.00000000',
      'c': '70030.00000000',
      'h': '70030.00000000',
      'l': '70029.99000000',
      'v': '0.73628000',
      'n': 4,
      'x': true,
      'q': '51561.68831840',
      'V': '0.72812000',
      'Q': '50990.24360000',
      'B': '0'
    }
  }
};

class CandleData {
  final int startTime;
  final int endTime;
  final String tradingSymbol;
  final String candlePeriod;
  final int firstTradeId;
  final int lastTradeId;
  final double open;
  final double close;
  final double high;
  final double low;
  final double volume;
  final int numberOfTrades;
  final bool isCompleted;
  final double completedTradeAmount;
  final double takerCompletedTradeVolume;
  final double takerTradeAmount;

  CandleData({
    required this.startTime,
    required this.endTime,
    required this.tradingSymbol,
    required this.candlePeriod,
    required this.firstTradeId,
    required this.lastTradeId,
    required this.open,
    required this.close,
    required this.high,
    required this.low,
    required this.volume,
    required this.numberOfTrades,
    required this.isCompleted,
    required this.completedTradeAmount,
    required this.takerCompletedTradeVolume,
    required this.takerTradeAmount,
  });

  factory CandleData.fromJson(Map<String, dynamic> json) {
    return CandleData(
      startTime: json['t'],
      endTime: json['T'],
      tradingSymbol: json['s'],
      candlePeriod: json['i'],
      firstTradeId: json['f'],
      lastTradeId: json['L'],
      open: double.parse(json['o']),
      close: double.parse(json['c']),
      high: double.parse(json['h']),
      low: double.parse(json['l']),
      volume: double.parse(json['v']),
      numberOfTrades: json['n'],
      isCompleted: json['x'],
      completedTradeAmount: double.parse(json['q']),
      takerCompletedTradeVolume: double.parse(json['V']),
      takerTradeAmount: double.parse(json['Q']),
    );
  }

  factory CandleData.fromBinanceJson(
    List<dynamic> json,
    String interval,
    String symbol,
  ) {
    return CandleData(
      startTime: json[0],
      endTime: json[6],
      open: double.parse(json[1]),
      high: double.parse(json[2]),
      low: double.parse(json[3]),
      close: double.parse(json[4]),
      volume: double.parse(json[5]),
      numberOfTrades: json[8],
      isCompleted: true,
      completedTradeAmount: double.parse(json[7]),
      takerCompletedTradeVolume: double.parse(json[9]),
      takerTradeAmount: double.parse(json[10]),
      candlePeriod: interval,
      tradingSymbol: symbol,
      firstTradeId: 0,
      lastTradeId: 0,
    );
  }

  Candle toCandle() {
    return Candle(
      date: DateTime.fromMillisecondsSinceEpoch(startTime),
      open: open,
      high: high,
      low: low,
      close: close,
      volume: volume,
    );
  }
}
