// // import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/foundation.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

// import '../../../core/app/_app.dart';
// import '../../../models/_models.dart';
// import 'i_crashlytics_service.dart';
// import 'logger_integration.dart';

// class CrashlyticsService extends ICrashlyticsService {
//   final SentryClient _client;
//   // final FirebaseCrashlytics _crashlytics;
//   final PlatformDispatcher _platformDispatcher;

//   CrashlyticsService([
//     SentryClient? client,
//     // FirebaseCrashlytics? crashlytics,
//     PlatformDispatcher? platformDispatcher,
//   ])  : _client = client ?? SentryClient(_sentryOptions),
//         // _crashlytics = crashlytics ?? FirebaseCrashlytics.instance,
//         _platformDispatcher = platformDispatcher ?? PlatformDispatcher.instance;

//   final _log = getLogger('CrashlyticsService');

//   static SentryFlutterOptions get _sentryOptions {
//     final options = SentryFlutterOptions();
//     options.dsn = 'EnvData.sentryDsn';
//     options.environment = FlavorConfig.shared.flavor.name;
//     options.tracesSampleRate = 1.0;
//     options.addIntegration(LoggerIntegration());
//     options.enablePrintBreadcrumbs = true;
//     options.attachScreenshot = true;
//     options.enableAutoPerformanceTracing = true;
//     options.anrEnabled = true;
//     options.enableAutoNativeBreadcrumbs = true;
//     options.enableNativeCrashHandling = true;
//     options.enableNdkScopeSync = true;
//     options.reportSilentFlutterErrors = true;
//     options.appHangTimeoutInterval = const Duration(seconds: 4);
//     return options;
//   }

//   /// Initialize the error catcher
//   @override
//   Future<void> initialize() async {
//     try {
//       FlutterError.onError = (details) async {
//         // await _crashlytics.recordFlutterFatalError(details);
//         await _client.captureException(details.exception,
//             stackTrace: details.stack);
//       };

//       _platformDispatcher.onError = (error, stack) {
//         // _crashlytics.recordError(error, stack, fatal: true);
//         _client.captureException(error, stackTrace: stack);
//         return true;
//       };

//       await SentryFlutter.init((options) => _sentryOptions);

//       Sentry.bindClient(_client);

//       _log.d('Crashlytics service initialized');
//     } catch (e, s) {
//       _log.e(e);
//       catchError(e, stackTrace: s);
//     }
//   }

//   /// Sets user data [email] so it can be known from the console
//   ///
//   /// When [email] is null, the user is deleted from sentry console
//   @override
//   void setUser([String? userId]) {
//     try {
//       if (userId == null) {
//         /// Clear user
//         // _crashlytics.setUserIdentifier('');
//         Sentry.configureScope((scope) => scope.setUser(null));
//       } else {
//         /// Store user details
//         // _crashlytics.setUserIdentifier(userId);
//         Sentry.configureScope(
//           (scope) => scope.setUser(SentryUser(id: userId)),
//         );
//       }
//     } catch (e, s) {
//       catchError(e, stackTrace: s);
//     }
//   }

//   /// Method to catch errors.
//   ///
//   /// It takes in the error, the stacktrace and optionally a message.
//   @override
//   Future<void> catchError(error,
//       {StackTrace? stackTrace, String? message}) async {
//     try {
//       final program = LoggerStackTrace.from(StackTrace.current);
//       // await _crashlytics.recordError(error, stackTrace);
//       await Sentry.captureEvent(
//         SentryEvent(
//           eventId: SentryId.newId(),
//           level: SentryLevel.error,
//           throwable: error,
//           message: message != null ? SentryMessage(message) : null,
//           contexts: Contexts.fromJson({
//             'Debug Info': program.toDebugInfo(),
//           }),
//         ),
//         stackTrace: stackTrace,
//       );
//       _log.d('Failure Caught');
//     } catch (e) {
//       // await _crashlytics.recordError(error, stackTrace);
//     }
//   }

//   /// Method to catch messages.
//   /// Messages in this project refers to data logged to the console that
//   /// are not fatal
//   ///
//   /// It takes in a message, optionally extra data and the stacktrace.
//   @override
//   Future<void> catchMessage(
//     String message, {
//     Map<String, dynamic> extraData = const {},
//     StackTrace? stackTrace,
//   }) async {
//     final program = LoggerStackTrace.from(StackTrace.current);
//     await Sentry.captureEvent(
//       SentryEvent(
//         eventId: SentryId.newId(),
//         level: SentryLevel.info,
//         message: SentryMessage(message),
//         contexts: Contexts.fromJson({
//           'Debug Info': program.toDebugInfo(),
//           'Extras': extraData,
//         }),
//       ),
//       stackTrace: stackTrace,
//     );
//     _log.i('Message Caught');
//   }
// }

// class LoggerStackTrace {
//   const LoggerStackTrace._({
//     required this.functionName,
//     required this.callerFunctionName,
//     required this.fileName,
//     required this.lineNumber,
//     required this.columnNumber,
//   });

//   factory LoggerStackTrace.from(StackTrace trace) {
//     final frames = trace.toString().split('\n');
//     final functionName = _getFunctionNameFromFrame(frames[0]);
//     final callerFunctionName = _getFunctionNameFromFrame(frames[1]);
//     final fileInfo = _getFileInfoFromFrame(frames[1]);
//     Sentry.addBreadcrumb(Breadcrumb(message: fileInfo.toString()));
//     return LoggerStackTrace._(
//       functionName: functionName,
//       callerFunctionName: callerFunctionName,
//       fileName: fileInfo[0],
//       lineNumber: int.parse(fileInfo[1].replaceFirst(')', '')),
//       columnNumber: int.parse(fileInfo.last.replaceFirst(')', '')),
//     );
//   }

//   Map<String, dynamic> toDebugInfo() {
//     return {
//       'callerFunctionName': callerFunctionName,
//       'fileName': fileName,
//       'lineNumber': lineNumber,
//     };
//   }

//   final String functionName;
//   final String callerFunctionName;
//   final String fileName;
//   final int lineNumber;
//   final int columnNumber;

//   static List<String> _getFileInfoFromFrame(String trace) {
//     final indexOfFileName = trace.indexOf(RegExp('[A-Za-z_-]+.dart'));
//     final fileInfo = trace.substring(indexOfFileName);

//     return fileInfo.split(':');
//   }

//   static String _getFunctionNameFromFrame(String trace) {
//     final indexOfWhiteSpace = trace.indexOf(' ');
//     final subStr = trace.substring(indexOfWhiteSpace);
//     final indexOfFunction = subStr.indexOf(RegExp('[A-Za-z0-9]'));

//     return subStr
//         .substring(indexOfFunction)
//         .substring(0, subStr.substring(indexOfFunction).indexOf(' '));
//   }

//   @override
//   String toString() {
//     return 'LoggerStackTrace('
//         'functionName: $functionName, '
//         'callerFunctionName: $callerFunctionName, '
//         'fileName: $fileName, '
//         'lineNumber: $lineNumber, '
//         'columnNumber: $columnNumber)';
//   }
// }
