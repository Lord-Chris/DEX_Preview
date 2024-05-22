final mockTickerData = {
  'e': '24hrTicker', // Event type
  'E': 1672515782136, // Event time
  's': 'BNBBTC', // Symbol
  'p': '0.0015', // Price change
  'P': '250.00', // Price change percent
  'w': '0.0018', // Weighted average price
  'x':
      '0.0009', // First trade(F)-1 price (first trade before the 24hr rolling window)
  'c': '0.0025', // Last price
  'Q': '10', // Last quantity
  'b': '0.0024', // Best bid price
  'B': '10', // Best bid quantity
  'a': '0.0026', // Best ask price
  'A': '100', // Best ask quantity
  'o': '0.0010', // Open price
  'h': '0.0025', // High price
  'l': '0.0010', // Low price
  'v': '10000', // Total traded base asset volume
  'q': '18', // Total traded quote asset volume
  'O': 0, // Statistics open time
  'C': 86400000, // Statistics close time
  'F': 0, // First trade ID
  'L': 18150, // Last trade Id
  'n': 18151 // Total number of trades
};

class TickerData {
  final String eventType;
  final int eventTime;
  final String symbol;
  final double priceChange;
  final double priceChangePercent;
  final double weightedAveragePrice;
  final double firstTradePrice;
  final double lastPrice;
  final double lastQuantity;
  final double bestBidPrice;
  final double bestBidQuantity;
  final double bestAskPrice;
  final double bestAskQuantity;
  final double openPrice;
  final double highPrice;
  final double lowPrice;
  final double totalTradedBaseAssetVolume;
  final double totalTradedQuoteAssetVolume;
  final int statisticsOpenTime;
  final int statisticsCloseTime;
  final int firstTradeId;
  final int lastTradeId;
  final int totalNumberOfTrades;

  TickerData({
    required this.eventType,
    required this.eventTime,
    required this.symbol,
    required this.priceChange,
    required this.priceChangePercent,
    required this.weightedAveragePrice,
    required this.firstTradePrice,
    required this.lastPrice,
    required this.lastQuantity,
    required this.bestBidPrice,
    required this.bestBidQuantity,
    required this.bestAskPrice,
    required this.bestAskQuantity,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.totalTradedBaseAssetVolume,
    required this.totalTradedQuoteAssetVolume,
    required this.statisticsOpenTime,
    required this.statisticsCloseTime,
    required this.firstTradeId,
    required this.lastTradeId,
    required this.totalNumberOfTrades,
  });

  factory TickerData.fromJson(Map<String, dynamic> json) {
    return TickerData(
      eventType: json['e'],
      eventTime: json['E'],
      symbol: json['s'],
      priceChange: double.parse(json['p']),
      priceChangePercent: double.parse(json['P']),
      weightedAveragePrice: double.parse(json['w']),
      firstTradePrice: double.parse(json['x']),
      lastPrice: double.parse(json['c']),
      lastQuantity: double.parse(json['Q']),
      bestBidPrice: double.parse(json['b']),
      bestBidQuantity: double.parse(json['B']),
      bestAskPrice: double.parse(json['a']),
      bestAskQuantity: double.parse(json['A']),
      openPrice: double.parse(json['o']),
      highPrice: double.parse(json['h']),
      lowPrice: double.parse(json['l']),
      totalTradedBaseAssetVolume: double.parse(json['v']),
      totalTradedQuoteAssetVolume: double.parse(json['q']),
      statisticsOpenTime: json['O'],
      statisticsCloseTime: json['C'],
      firstTradeId: json['F'],
      lastTradeId: json['L'],
      totalNumberOfTrades: json['n'],
    );
  }
}
