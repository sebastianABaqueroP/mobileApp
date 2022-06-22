// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  // Singleton setup: prevents multiple instances of this class
  factory AnalyticsService() => _service;

  AnalyticsService._();

  static final AnalyticsService _service = AnalyticsService._();

  static FirebaseAnalytics get instance => _service._analytics;

  static FirebaseAnalyticsObserver get observer =>
      FirebaseAnalyticsObserver(analytics: _service._analytics);
}
