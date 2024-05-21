// import 'dart:async';

// import 'package:logger/logger.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

// /// An [Integration] which listens to all messages of the
// /// [logger](https://pub.dev/packages/logger) package.
// class LoggerIntegration implements Integration<SentryOptions> {
//   /// Creates the [LoggerIntegration].
//   ///
//   /// All log events equal or higher than [minBreadcrumbLevel] are recorded as a
//   /// [Breadcrumb].
//   LoggerIntegration();

//   late Hub _hub;
//   static const _validLogs = [Level.error, Level.debug];

//   @override
//   void call(Hub hub, SentryOptions options) {
//     _hub = hub;
//     options.sdk.addPackage(options.sdk.name, options.sdk.version);
//     options.sdk.addIntegration('LoggerIntegration');
//     Logger.addLogListener(_onLog);
//   }

//   @override
//   Future<void> close() async {
//     Logger.removeLogListener((_) {});
//   }

//   bool _isLoggable(Level logLevel) {
//     if (logLevel == Level.off) {
//       return false;
//     }
//     return _validLogs.contains(logLevel);
//   }

//   Future<void> _onLog(LogEvent record) async {
//     if (_isLoggable(record.level)) {
//       await _hub.addBreadcrumb(
//         record.toBreadcrumb(),
//       );
//     }
//   }
// }

// // ignore_for_file: public_member_api_docs

// extension LogRecordX on LogEvent {
//   Breadcrumb toBreadcrumb() {
//     return Breadcrumb(
//       type: 'default',
//       timestamp: time.toUtc(),
//       level: level.toSentryLevel(),
//       message: message.toString(),
//       data: <String, Object>{
//         // if (object != null) 'LogRecord.object': object!,
//         if (error != null) 'LogRecord.error': error!,
//         if (stackTrace != null) 'LogRecord.stackTrace': stackTrace!,
//         // 'LogRecord.loggerName': loggerName,
//         // 'LogRecord.sequenceNumber': sequenceNumber,
//       },
//     );
//   }
// }

// extension LogLevelX on Level {
//   SentryLevel? toSentryLevel() {
//     return <Level, SentryLevel?>{
//       Level.trace: SentryLevel.debug,
//       Level.debug: SentryLevel.debug,
//       Level.info: SentryLevel.info,
//       Level.warning: SentryLevel.warning,
//       Level.error: SentryLevel.error,
//       Level.fatal: SentryLevel.fatal,
//       Level.off: null,
//     }[this];
//   }
// }
