class TickerData {
  final String symbol;
  final double priceChange;
  final double priceChangePercent;
  final double weightedAvgPrice;
  final double prevClosePrice;
  final double lastPrice;
  final double lastQty;
  final double bidPrice;
  final double bidQty;
  final double askPrice;
  final double askQty;
  final double openPrice;
  final double highPrice;
  final double lowPrice;
  final double volume;
  final double quoteVolume;
  final int openTime;
  final int closeTime;
  final int firstId;
  final int lastId;
  final int count;

  TickerData({
    required this.symbol,
    required this.priceChange,
    required this.priceChangePercent,
    required this.weightedAvgPrice,
    required this.prevClosePrice,
    required this.lastPrice,
    required this.lastQty,
    required this.bidPrice,
    required this.bidQty,
    required this.askPrice,
    required this.askQty,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.volume,
    required this.quoteVolume,
    required this.openTime,
    required this.closeTime,
    required this.firstId,
    required this.lastId,
    required this.count,
  });

  factory TickerData.fromJson(Map<String, dynamic> json) {
    return TickerData(
      symbol: json['symbol'],
      priceChange: double.parse(json['priceChange']),
      priceChangePercent: double.parse(json['priceChangePercent']),
      weightedAvgPrice: double.parse(json['weightedAvgPrice']),
      prevClosePrice: double.parse(json['prevClosePrice']),
      lastPrice: double.parse(json['lastPrice']),
      lastQty: double.parse(json['lastQty']),
      bidPrice: double.parse(json['bidPrice']),
      bidQty: double.parse(json['bidQty']),
      askPrice: double.parse(json['askPrice']),
      askQty: double.parse(json['askQty']),
      openPrice: double.parse(json['openPrice']),
      highPrice: double.parse(json['highPrice']),
      lowPrice: double.parse(json['lowPrice']),
      volume: double.parse(json['volume']),
      quoteVolume: double.parse(json['quoteVolume']),
      openTime: json['openTime'],
      closeTime: json['closeTime'],
      firstId: json['firstId'],
      lastId: json['lastId'],
      count: json['count'],
    );
  }
}
