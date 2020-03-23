import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:logging/logging.dart';

class AppTheme {
  static Color whitish = Color(0xFFF2F2F7);
  static Color white = Colors.white;
}

class Utils {
  static void setUp() {
    Logger logger = Logger.root;
    logger.onRecord.listen((event) {
    FirebaseAnalytics().logEvent(name: event.level.name,parameters: {
      '' : '',
      'Logger' : event.loggerName,
      'Message': event.message,
      'Time': event.time.toIso8601String(),
    });

      print(
          '${event.time}: ${event.level}: ${event.loggerName} -> ${event.message}');
    });
    SyncfusionLicense.registerLicense(
      'NT8mJyc2IWhia31ifWN9YGVoYmF8YGJ8ampqanNiYmlmamlmanMDHmgxNicnNzwmNBM0PjI6P30wPD4=',
    );
  }
}
