import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../ui/views/home_view/home_view.dart';

/// Run "flutter pub run build_runner build --delete-conflicting-outputs"
/// Run "flutter pub run build_runner watch --delete-conflicting-outputs"
@StackedApp(
  routes: [
    /// Startup
    AdaptiveRoute(page: HomeView, initial: true),
    // AdaptiveRoute(page: OnboardingView),
  ],
  logger: StackedLogger(),
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BottomSheetService),

    /// Core Services
    // LazySingleton(classType: CrashlyticsService, asType: ICrashlyticsService),
    // LazySingleton(classType: NetworkService, asType: INetworkService),
    // LazySingleton(classType: WebSocketService, asType: IWebSocketService),

    /// API Services
    // LazySingleton(classType: UserService, asType: IUserService),
  ],
)
class App {}
