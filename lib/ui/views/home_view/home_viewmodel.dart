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

  String _symbol = '';
  String _interval = '1h';
  MainViewEnum mainView = MainViewEnum.charts;
  List<CandleData> candles = [];
  ValueNotifier<TickerData?> tickerData = ValueNotifier(null);
  OrdersViewEnum ordersView = OrdersViewEnum.openOrders;

  void setInterval(String value) {
    _interval = value;
    notifyListeners();
    candles.clear();
    fetchCandles();
  }

  void setMainView(MainViewEnum value) {
    mainView = value;
    notifyListeners();
  }

  void setOrdersView(OrdersViewEnum value) {
    ordersView = value;
    notifyListeners();
  }

  Future<void> init() async {
    try {
      setBusy(true);
      await _webSsocketService.init(_symbol);
      await fetchSymbols();
      await fetchCandles();
      subscribeToSymbol();
    } on IFailure catch (e) {
      _log.e(e);
    } finally {
      setBusy(false);
    }
  }

  Future<void> fetchSymbols() async {
    final symbols = await _binanceService.fetchSymbols();
    if (symbols.isEmpty) return;
    _symbol =
        symbols.firstWhereOrNull((e) => e.startsWith('BTC')) ?? symbols.first;
    notifyListeners();
  }

  Future<void> fetchCandles() async {
    final candles = await _binanceService.fetchCandles(_symbol, _interval);
    this.candles = [...this.candles, ...candles];
    notifyListeners();
  }

  Future<void> subscribeToSymbol() async {
    _webSsocketService.subscribeToSymbol(_symbol, _interval);
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
    super.onData(key, data);
    if (key == 'candleDataStream') {
      candles.add(data);
    }
    if (key == 'tickerDataStream') {
      tickerData.value = data;
    }
  }

  @override
  Map<String, StreamData> get streamsMap => {
        'tickerDataStream':
            StreamData<TickerData>(_webSsocketService.tickerDataStream),
        'candleDataStream':
            StreamData<CandleData>(_webSsocketService.candleDataStream),
      };

  String get symbol => '${_symbol.split('-').first}/USDT';
}
