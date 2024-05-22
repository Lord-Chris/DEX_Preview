import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/api_services/_api_services.dart';
import '../../services/core_services/_core_services.dart';
import '../../ui/shared/bottomsheets/create_order_sheet/create_order_sheet.dart';
import '../../ui/views/home_view/home_view.dart';

/// Run "flutter pub run build_runner build --delete-conflicting-outputs"
/// Run "flutter pub run build_runner watch --delete-conflicting-outputs"
@StackedApp(
  routes: [
    /// Startup
    AdaptiveRoute(page: HomeView, initial: true),
  ],
  logger: StackedLogger(),
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BottomSheetService),

    /// Core Services
    LazySingleton(classType: WebSocketService, asType: IWebSocketService),
    LazySingleton(classType: NetworkService, asType: INetworkService),
    // LazySingleton(classType: WebSocketService, asType: IWebSocketService),

    /// API Services
    LazySingleton(classType: BinanceService, asType: IBinanceService),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: CreateOrderSheet),
  ],
)
class App {}
