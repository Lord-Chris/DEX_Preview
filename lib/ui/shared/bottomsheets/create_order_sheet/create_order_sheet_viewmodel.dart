import 'package:stacked/stacked.dart';

class CreateOrderSheetViewModel extends BaseViewModel {
  String orderType = 'Buy';
  String type = 'Limit';

  void setOrdertype(String value) {
    orderType = value;
    notifyListeners();
  }

  void setType(String type) {
    this.type = type;
    notifyListeners();
  }
}
