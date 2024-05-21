import 'package:stacked/stacked.dart';

import '../../../core/_core.dart';
import '../../../core/app/_app.dart';

class HomeViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  String exchange = 'BTC/USDT';

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

  void openCreateOrderSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.createOrder,
      isScrollControlled: true,
    );
  }
}
