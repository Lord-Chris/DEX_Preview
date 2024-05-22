class OrderbookData {
  final int lastUpdateId;
  final List<OrderItemData> bids;
  final List<OrderItemData> asks;

  OrderbookData({
    required this.lastUpdateId,
    required this.bids,
    required this.asks,
  });

  factory OrderbookData.fromJson(Map<String, dynamic> json) {
    return OrderbookData(
      lastUpdateId: json['lastUpdateId'],
      bids: (json['bids'] as List)
          .map((e) => OrderItemData.fromJson(
              (e as List).map((e) => e.toString()).toList()))
          .toList(),
      asks: (json['asks'] as List)
          .map((e) => OrderItemData.fromJson(
              (e as List).map((e) => e.toString()).toList()))
          .toList(),
    );
  }
}

class OrderItemData {
  final String price;
  final String quantity;

  OrderItemData({
    required this.price,
    required this.quantity,
  });

  factory OrderItemData.fromJson(List<String> json) {
    return OrderItemData(
      price: json[0],
      quantity: json[1],
    );
  }

  String get total =>
      (double.parse(price) * double.parse(quantity)).toStringAsFixed(2);
  String get formattedPrice => double.parse(price).toStringAsFixed(2);

  double get ratio => (double.parse(total) / double.parse(price));
  double get ratioPercent => ratio * 100;
}
