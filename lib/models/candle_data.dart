import 'package:candlesticks/candlesticks.dart';

class CandleData {
  String eventType;
  int eventTime;
  String tradingSymbol;
  KlineData klineData;

  CandleData({
    required this.eventType,
    required this.eventTime,
    required this.tradingSymbol,
    required this.klineData,
  });

  factory CandleData.fromJson(Map<String, dynamic> json) {
    return CandleData(
      eventType: json['e'],
      eventTime: json['E'],
      tradingSymbol: json['s'],
      klineData: KlineData.fromJson(json['k']),
    );
  }

  Candle toCandle() {
    return Candle(
      date: DateTime.fromMillisecondsSinceEpoch(klineData.endTime),
      high: klineData.high,
      low: klineData.low,
      open: klineData.open,
      close: klineData.close,
      volume: klineData.volume,
    );
  }

  factory CandleData.fromJson2(Map<String, dynamic> json) {
    return CandleData(
      eventType: 'kline',
      eventTime: json['closeTime'],
      tradingSymbol: json['symbol'],
      klineData: KlineData.fromJson2(json),
    );
  }
}

class KlineData {
  int startTime;
  int endTime;
  String tradingSymbol;
  String candlePeriod;
  int firstTradeId;
  int lastTradeId;
  double open;
  double close;
  double high;
  double low;
  double volume;
  int numberOfTrades;
  bool isCompleted;
  double completedTradeAmount;
  double takerCompletedTradeVolume;
  double takerTradeAmount;

  KlineData({
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

  factory KlineData.fromJson(Map<String, dynamic> json) {
    return KlineData(
      startTime: json['t'],
      endTime: json['T'],
      tradingSymbol: json['s'],
      candlePeriod: json['i'],
      firstTradeId: int.parse(json['F']),
      lastTradeId: int.parse(json['L']),
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

  factory KlineData.fromJson2(Map<String, dynamic> json) {
    return KlineData(
      startTime: json['openTime'],
      endTime: json['closeTime'],
      tradingSymbol: json['symbol'],
      candlePeriod: json['interval'],
      firstTradeId: 0,
      lastTradeId: 0,
      open: double.parse(json['open']),
      close: double.parse(json['close']),
      high: double.parse(json['high']),
      low: double.parse(json['low']),
      volume: double.parse(json['volume']),
      numberOfTrades: json['tradeCount'],
      isCompleted: true,
      completedTradeAmount: double.parse(json['amount']),
      takerCompletedTradeVolume: double.parse(json['takerVolume']),
      takerTradeAmount: double.parse(json['takerAmount']),
    );
  }
}
