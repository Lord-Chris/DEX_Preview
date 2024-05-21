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
  String get symbol => '${_symbol.split('-').first}/USDT';

  List<CandleData> candles = [];

  MainViewEnum mainView = MainViewEnum.charts;
  void setMainView(MainViewEnum value) {
    mainView = value;
    notifyListeners();
  }

  OrdersViewEnum ordersView = OrdersViewEnum.openOrders;
  void setOrdersView(OrdersViewEnum value) {
    ordersView = value;
    notifyListeners();
  }

  Future<void> init() async {
    try {
      setBusy(true);
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
        // symbols.firstWhereOrNull((e) => e.startsWith('BTC')) ??
        symbols.first;
    notifyListeners();
  }

  Future<void> fetchCandles() async {
    final candles = await _binanceService.fetchCandles(_symbol, '1h');
    this.candles = [...this.candles, ...candles];
    notifyListeners();
  }

  Future<void> subscribeToSymbol() async {
    await _webSsocketService.init(_symbol);
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
  }

  @override
  Map<String, StreamData> get streamsMap => {
        'tickerDataStream': StreamData(_webSsocketService.tickerDataStream),
        'candleDataStream': StreamData(_webSsocketService.candleDataStream),
      };
}
