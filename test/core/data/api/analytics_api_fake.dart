import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/data/models/user.dart';

class AnalyticsApiFake implements AnalyticsApi {
  String? currentUserId;
  final List<AnalyticsEvent> events = [];
  final Map<String, dynamic> userProperties = {};
  final Map<String, dynamic> superProperties = {};

  @override
  Future<void> identify(User user) {
    currentUserId = user.idOrNull;
    return Future.value();
  }

  @override
  Future<void> init() async {}

  @override
  Future<void> logEvent(String name, Map<String, dynamic> params) {
    events.add(AnalyticsEvent(name: name, params: params));
    return Future.value();
  }

  @override
  Future<void> logSignout() {
    events.add(AnalyticsEvent(name: 'logout', params: {}));
    currentUserId = null;
    return Future.value();
  }

  @override
  Future<void> setUserProperties(Map<String, dynamic> properties) {
    userProperties.addAll(properties);
    return Future.value();
  }

  @override
  Future<void> incrementUserProperty(String property, [int value = 1]) {
    final current = userProperties[property] as int? ?? 0;
    userProperties[property] = current + value;
    return Future.value();
  }

  @override
  Future<void> registerSuperProperties(Map<String, dynamic> properties) {
    superProperties.addAll(properties);
    return Future.value();
  }

  @override
  Future<void> setSuperProperty(String key, dynamic value) {
    superProperties[key] = value;
    return Future.value();
  }

  void reset() {
    events.clear();
    userProperties.clear();
    superProperties.clear();
    currentUserId = null;
  }
}

class AnalyticsEvent {
  final String name;
  final Map<String, dynamic> params;

  AnalyticsEvent({required this.name, required this.params});
}
