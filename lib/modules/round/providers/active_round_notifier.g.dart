// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_round_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for managing the active round state.
/// keepAlive: true ensures the state persists across navigation.

@ProviderFor(ActiveRoundNotifier)
const activeRoundProvider = ActiveRoundNotifierProvider._();

/// Provider for managing the active round state.
/// keepAlive: true ensures the state persists across navigation.
final class ActiveRoundNotifierProvider
    extends $NotifierProvider<ActiveRoundNotifier, ActiveRoundState> {
  /// Provider for managing the active round state.
  /// keepAlive: true ensures the state persists across navigation.
  const ActiveRoundNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeRoundProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeRoundNotifierHash();

  @$internal
  @override
  ActiveRoundNotifier create() => ActiveRoundNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ActiveRoundState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ActiveRoundState>(value),
    );
  }
}

String _$activeRoundNotifierHash() =>
    r'ba282245c91eeb83afff8a3dd8d78f7945951905';

/// Provider for managing the active round state.
/// keepAlive: true ensures the state persists across navigation.

abstract class _$ActiveRoundNotifier extends $Notifier<ActiveRoundState> {
  ActiveRoundState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ActiveRoundState, ActiveRoundState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ActiveRoundState, ActiveRoundState>,
              ActiveRoundState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
