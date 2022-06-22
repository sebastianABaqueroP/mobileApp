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

  // Log Login
  Future<void> logLogin() {
    return _analytics.logLogin(loginMethod: 'no-email');
  }

  // Log for User Properties
  Future<void> setUserProperties({
    required String userId,
    required String userRole,
  }) async {
    await _analytics.setUserId(id: userId);
    await _analytics.setUserProperty(
      name: 'user_role',
      value: userRole,
    );
  }

  Future<void> logLogoutPressed({
    bool isBasketEmpy = true,
  }) async {
    return _analytics.logEvent(
      name: 'logout_pressed',
      parameters: {'is_basket_empy': isBasketEmpy},
    );
  }
}
