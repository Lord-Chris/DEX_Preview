class SymbolData {
  final String symbol;
  final double priceChange;
  final double priceChangePercent;
  final double lastPrice;
  final double lastQty;
  final double open;
  final double high;
  final double low;
  final double volume;
  final double amount;
  final double bidPrice;
  final double askPrice;
  final int openTime;
  final int closeTime;
  final int firstTradeId;
  final int tradeCount;
  final double strikePrice;
  final double exercisePrice;

  SymbolData({
    required this.symbol,
    required this.priceChange,
    required this.priceChangePercent,
    required this.lastPrice,
    required this.lastQty,
    required this.open,
    required this.high,
    required this.low,
    required this.volume,
    required this.amount,
    required this.bidPrice,
    required this.askPrice,
    required this.openTime,
    required this.closeTime,
    required this.firstTradeId,
    required this.tradeCount,
    required this.strikePrice,
    required this.exercisePrice,
  });

  factory SymbolData.fromJson(Map<String, dynamic> json) {
    return SymbolData(
      symbol: json['symbol'],
      priceChange: double.parse(json['priceChange']),
      priceChangePercent: double.parse(json['priceChangePercent']),
      lastPrice: double.parse(json['lastPrice']),
      lastQty: double.parse(json['lastQty']),
      open: double.parse(json['open']),
      high: double.parse(json['high']),
      low: double.parse(json['low']),
      volume: double.parse(json['volume']),
      amount: double.parse(json['amount']),
      bidPrice: double.parse(json['bidPrice']),
      askPrice: double.parse(json['askPrice']),
      openTime: json['openTime'],
      closeTime: json['closeTime'],
      firstTradeId: json['firstTradeId'],
      tradeCount: json['tradeCount'],
      strikePrice: double.parse(json['strikePrice']),
      exercisePrice: double.parse(json['exercisePrice']),
    );
  }
}
