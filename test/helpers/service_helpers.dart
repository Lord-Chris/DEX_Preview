import 'package:dao_preview/core/app/_app.dart';
import 'package:dao_preview/services/api_services/_api_services.dart';
import 'package:dao_preview/services/core_services/_core_services.dart';
import 'package:mocktail/mocktail.dart';

/// Stacked services mock
class MockBottomSheetService extends Mock implements BottomSheetService {}

class MockNavigationService extends Mock implements NavigationService {}

class MockSnackbarService extends Mock implements SnackbarService {}

/// GigMile services mock

class MockNetworkService extends Mock implements INetworkService {}

class MockWebSocketService extends Mock implements IWebSocketService {}

class MockBinanceService extends Mock implements IBinanceService {}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}

BottomSheetService getAndRegisterBottomSheetService() {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();
  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

NavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

SnackbarService getAndRegisterSnackbarService() {
  _removeRegistrationIfExists<SnackbarService>();
  final service = MockSnackbarService();
  locator.registerSingleton<SnackbarService>(service);
  return service;
}

INetworkService getAndRegisterNetworkService() {
  _removeRegistrationIfExists<INetworkService>();
  final service = MockNetworkService();
  locator.registerSingleton<INetworkService>(service);
  return service;
}

IWebSocketService getAndRegisterWebSocketService() {
  _removeRegistrationIfExists<IWebSocketService>();
  final service = MockWebSocketService();
  locator.registerSingleton<IWebSocketService>(service);
  return service;
}

IBinanceService getAndRegisterBinanceService() {
  _removeRegistrationIfExists<IBinanceService>();
  final service = MockBinanceService();
  locator.registerSingleton<IBinanceService>(service);
  return service;
}

void registerServices() {
  getAndRegisterBottomSheetService();
  getAndRegisterNavigationService();
  getAndRegisterSnackbarService();
  getAndRegisterNetworkService();
  getAndRegisterWebSocketService();
  getAndRegisterBinanceService();
}

void unregisterServices() {
  locator.unregister<BottomSheetService>();
  locator.unregister<NavigationService>();
  locator.unregister<SnackbarService>();
  locator.unregister<INetworkService>();
  locator.unregister<IWebSocketService>();
  locator.unregister<IBinanceService>();
}
