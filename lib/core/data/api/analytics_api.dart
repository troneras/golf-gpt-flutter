import 'dart:io';

import 'package:apparence_kit/core/data/models/user.dart';
import 'package:apparence_kit/core/initializer/onstart_service.dart';
import 'package:apparence_kit/environnements.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

final analyticsApiProvider = Provider<AnalyticsApi>(
  (ref) => MixpanelAnalyticsApi.instance(),
);

abstract class AnalyticsApi implements OnStartService {
  /// Log an event to your analytics platform
  Future<void> logEvent(String name, Map<String, dynamic> params);

  /// Log a signout event to your analytics platform
  Future<void> logSignout();

  /// Identify a user to your analytics platform
  Future<void> identify(User user);

  /// Set user properties (profile data)
  Future<void> setUserProperties(Map<String, dynamic> properties);

  /// Increment a user property (e.g., rounds_played)
  Future<void> incrementUserProperty(String property, [int value = 1]);

  /// Register super properties (attached to every event)
  Future<void> registerSuperProperties(Map<String, dynamic> properties);

  /// Update a single super property
  Future<void> setSuperProperty(String key, dynamic value);
}

class MixpanelAnalyticsApi implements AnalyticsApi {
  final Environment environment;
  Mixpanel? mixpanel;
  String? _appVersion;
  String? _platform;

  MixpanelAnalyticsApi._({
    required this.environment,
  });

  static MixpanelAnalyticsApi? _instance;

  factory MixpanelAnalyticsApi.instance() {
    return _instance ??= MixpanelAnalyticsApi._(
      environment: Environment.fromEnv(),
    );
  }

  @override
  Future<void> init() async {
    if (environment.mixpanelToken == null ||
        environment.mixpanelToken!.isEmpty) {
      return;
    }
    try {
      mixpanel = await Mixpanel.init(
        environment.mixpanelToken!,
        trackAutomaticEvents: false,
      );
      await _initSuperProperties();
    } catch (e, s) {
      debugPrint('Error initializing Mixpanel: $e\n$s');
    }
  }

  Future<void> _initSuperProperties() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      _appVersion = packageInfo.version;
      _platform = Platform.isIOS ? 'ios' : 'android';

      final properties = <String, dynamic>{
        'platform': _platform,
        'app_version': _appVersion,
        'environment': environment.name,
      };

      // Add debug session ID to identify debug sessions in Mixpanel
      if (kDebugMode) {
        final sessionId = DateTime.now().millisecondsSinceEpoch % 10000;
        properties['debug_session'] = 'debug-$_platform-$sessionId';
      }

      await registerSuperProperties(properties);
    } catch (e) {
      debugPrint('Error setting super properties: $e');
    }
  }

  @override
  Future<void> logEvent(String name, Map<String, dynamic> params) async {
    final properties = {
      'source': 'app',
      ...params,
    };
    if (kDebugMode) {
      debugPrint('📊 [Analytics] Event: $name $properties');
    }
    mixpanel?.track(name, properties: properties);
  }

  @override
  Future<void> logSignout() async {
    if (kDebugMode) {
      debugPrint('📊 [Analytics] Event: logout');
    }
    mixpanel?.track('logout', properties: {'source': 'app'});
    await mixpanel?.flush();
    await mixpanel?.reset();
    if (kDebugMode) {
      debugPrint('📊 [Analytics] Reset completed');
    }
  }

  @override
  Future<void> identify(User user) async {
    final userId = user.idOrNull;
    if (userId == null) return;

    if (kDebugMode) {
      debugPrint('📊 [Analytics] Identify: $userId');
    }
    mixpanel?.identify(userId);

    // Set user properties
    if (user is AuthenticatedUserData) {
      final properties = <String, dynamic>{
        r'$email': user.email,
        'platform': _platform ?? (Platform.isIOS ? 'ios' : 'android'),
        'app_version': _appVersion,
        'gpt_connected': user.hasCompletedGptOauth,
        'is_beta': user.isBeta,
        'onboarded': user.onboarded,
      };

      if (user.name != null) {
        properties[r'$name'] = user.name;
      }

      if (user.creationDate != null) {
        properties[r'$created'] = user.creationDate!.toIso8601String();
      }

      await setUserProperties(properties);

      // Register super properties for troubleshooting (recommended by Mixpanel)
      await registerSuperProperties({
        'user_id': userId,
        'gpt_connected': user.hasCompletedGptOauth,
      });
    }
  }

  @override
  Future<void> setUserProperties(Map<String, dynamic> properties) async {
    if (kDebugMode) {
      debugPrint('📊 [Analytics] Set user properties: $properties');
    }
    for (final entry in properties.entries) {
      mixpanel?.getPeople().set(entry.key, entry.value);
    }
  }

  @override
  Future<void> incrementUserProperty(String property, [int value = 1]) async {
    mixpanel?.getPeople().increment(property, value.toDouble());
  }

  @override
  Future<void> registerSuperProperties(Map<String, dynamic> properties) async {
    mixpanel?.registerSuperProperties(properties);
  }

  @override
  Future<void> setSuperProperty(String key, dynamic value) async {
    mixpanel?.registerSuperProperties({key: value});
  }
}
