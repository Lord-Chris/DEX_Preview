import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/_core.dart';
import '../../../core/app/_app.dart';
import '../../../models/_models.dart';
import '../../../services/api_services/_api_services.dart';
import '../../../services/core_services/_core_services.dart';

class HomeViewModel extends MultipleStreamViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _webSsocketService = locator<IWebSocketService>();
  final _binanceService = locator<IBinanceService>();
  final _log = getLogger('HomeViewModel');

  String _symbol = 'BTCUSDT';
  ChartIntervalEnum _interval = ChartIntervalEnum.oneSecond;
  MainViewEnum mainView = MainViewEnum.charts;
  List<CandleData> _candles = [];
  ValueNotifier<TickerData?> tickerData = ValueNotifier(null);
  OrdersViewEnum ordersView = OrdersViewEnum.openOrders;
  int arrangement = 0;
  OrderbookData? orderbookData;
  String _depth = '5';

  void setInterval(ChartIntervalEnum value) {
    _unsubscribeFromSymbol();
    _interval = value;
    _candles.clear();
    notifyListeners();
    fetchCandles();
    _subscribeToSymbol();
  }

  void setMainView(MainViewEnum value) {
    mainView = value;
    notifyListeners();
  }

  void setOrdersView(OrdersViewEnum value) {
    ordersView = value;
    notifyListeners();
  }

  void setArrangement(int index) {
    arrangement = index;
    notifyListeners();
  }

  void setDepth(String value) {
    _unsubscribeFromSymbol();
    _depth = value;
    notifyListeners();
    _subscribeToSymbol();
  }

  Future<void> init() async {
    try {
      setBusy(true);
      await _webSsocketService.init();
      await fetchCandles();
      _subscribeToSymbol();
    } on IFailure catch (e) {
      _log.e(e);
    } finally {
      setBusy(false);
    }
  }

  Future<void> fetchSymbols() async {
    try {
      final symbols = await _binanceService.fetchSymbols();
      if (symbols.isEmpty) return;
      _symbol = (symbols.firstWhereOrNull((e) => e.symbol.startsWith('BTC')) ??
              symbols.first)
          .symbol;
      notifyListeners();
    } on IFailure catch (e) {
      _log.e(e);
    }
  }

  Future<void> fetchCandles() async {
    try {
      final candles =
          await _binanceService.fetchCandles(_symbol, _interval.value);
      _candles = [..._candles, ...candles.reversed];
      notifyListeners();
    } on IFailure catch (e) {
      _log.e(e);
    }
  }

  void _subscribeToSymbol() {
    _webSsocketService.subscribeToSymbol(_symbol, _interval.value, _depth);
  }

  void _unsubscribeFromSymbol() {
    _webSsocketService.unsubscribeFromSymbol(_symbol, _interval.value, _depth);
  }

  void openCreateOrderSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.createOrder,
      isScrollControlled: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _webSsocketService.dispose();
  }

  @override
  void onData(String key, data) {
    if (key == 'candleDataStream') {
      _candles.insertAll(0, data);
    }
    if (key == 'tickerDataStream') {
      tickerData.value = data;
    }
    if (key == 'orderbookDataStream') {
      orderbookData = data;
    }
  }

  @override
  Map<String, StreamData> get streamsMap => {
        'tickerDataStream':
            StreamData<TickerData>(_webSsocketService.tickerDataStream),
        'candleDataStream':
            StreamData<List<CandleData>>(_webSsocketService.candleDataStream),
        'orderbookDataStream':
            StreamData<OrderbookData>(_webSsocketService.orderbookDataStream),
      };

  String get symbol => _symbol;
  List<CandleData> get candles => _candles;
  ChartIntervalEnum get interval => _interval;
  String get depth => _depth;
}
