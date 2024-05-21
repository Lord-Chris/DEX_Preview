import 'package:stacked/stacked.dart';

class CreateOrderSheetViewModel extends BaseViewModel {
  String orderType = 'Buy';
  void setOrdertype(String value) {
    orderType = value;
    notifyListeners();
  }
}
