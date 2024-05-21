import 'package:flutter/foundation.dart';

import '../../../core/app/_app.dart';

abstract class ICrashlyticsService {
  Future<void> initialize();

  void setUser([String? userId]);

  Future<void> catchError(error, {StackTrace? stackTrace, String? message});

  Future<void> catchMessage(
    String message, {
    Map<String, dynamic> extraData = const {},
    StackTrace? stackTrace,
  });
}

class DebugCrashlyticsService implements ICrashlyticsService {
  final PlatformDispatcher _platformDispatcher;

  DebugCrashlyticsService([
    PlatformDispatcher? platformDispatcher,
  ]) : _platformDispatcher = platformDispatcher ?? PlatformDispatcher.instance;

  final _log = getLogger('DebugCrashlyticsService');

  /// Initialize the error catcher
  @override
  Future<void> initialize() async {
    FlutterError.onError = (details) =>
        FlutterError.dumpErrorToConsole(details, forceReport: true);
    _platformDispatcher.onError = (error, stack) => false;
    _log.d('Crashlytics service initialized');
  }

  @override
  void setUser([String? userId]) {}

  @override
  Future<void> catchError(error,
      {StackTrace? stackTrace, String? message}) async {
    FlutterError.dumpErrorToConsole(
      FlutterErrorDetails(exception: error, stack: stackTrace),
      forceReport: true,
    );
  }

  @override
  Future<void> catchMessage(String message,
      {Map<String, dynamic> extraData = const {},
      StackTrace? stackTrace}) async {
    return Future.value();
  }
}
