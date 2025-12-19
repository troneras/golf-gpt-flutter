// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gps_tracking_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Riverpod notifier that wraps the GPS tracking service.
///
/// This notifier provides:
/// - Reactive state for UI components
/// - Clean API for starting/stopping GPS tracking
/// - Integration point for the round lifecycle

@ProviderFor(GpsTrackingNotifier)
const gpsTrackingProvider = GpsTrackingNotifierProvider._();

/// Riverpod notifier that wraps the GPS tracking service.
///
/// This notifier provides:
/// - Reactive state for UI components
/// - Clean API for starting/stopping GPS tracking
/// - Integration point for the round lifecycle
final class GpsTrackingNotifierProvider
    extends $NotifierProvider<GpsTrackingNotifier, GpsTrackingStatus> {
  /// Riverpod notifier that wraps the GPS tracking service.
  ///
  /// This notifier provides:
  /// - Reactive state for UI components
  /// - Clean API for starting/stopping GPS tracking
  /// - Integration point for the round lifecycle
  const GpsTrackingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gpsTrackingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gpsTrackingNotifierHash();

  @$internal
  @override
  GpsTrackingNotifier create() => GpsTrackingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GpsTrackingStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GpsTrackingStatus>(value),
    );
  }
}

String _$gpsTrackingNotifierHash() =>
    r'9686635c615cd51c04777b3dea4c3f8d48c757bf';

/// Riverpod notifier that wraps the GPS tracking service.
///
/// This notifier provides:
/// - Reactive state for UI components
/// - Clean API for starting/stopping GPS tracking
/// - Integration point for the round lifecycle

abstract class _$GpsTrackingNotifier extends $Notifier<GpsTrackingStatus> {
  GpsTrackingStatus build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GpsTrackingStatus, GpsTrackingStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GpsTrackingStatus, GpsTrackingStatus>,
              GpsTrackingStatus,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
