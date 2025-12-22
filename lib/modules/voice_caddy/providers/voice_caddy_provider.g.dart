// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_caddy_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VoiceCaddyNotifier)
const voiceCaddyProvider = VoiceCaddyNotifierProvider._();

final class VoiceCaddyNotifierProvider
    extends $NotifierProvider<VoiceCaddyNotifier, VoiceCaddyState> {
  const VoiceCaddyNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'voiceCaddyProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$voiceCaddyNotifierHash();

  @$internal
  @override
  VoiceCaddyNotifier create() => VoiceCaddyNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VoiceCaddyState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VoiceCaddyState>(value),
    );
  }
}

String _$voiceCaddyNotifierHash() =>
    r'4239054c36d17fb1414432025e65ef1d694b2247';

abstract class _$VoiceCaddyNotifier extends $Notifier<VoiceCaddyState> {
  VoiceCaddyState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<VoiceCaddyState, VoiceCaddyState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<VoiceCaddyState, VoiceCaddyState>,
              VoiceCaddyState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
