// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_round_check_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider that checks for any active round.
/// Returns the active round if one exists, null otherwise.

@ProviderFor(activeRoundCheck)
const activeRoundCheckProvider = ActiveRoundCheckProvider._();

/// Provider that checks for any active round.
/// Returns the active round if one exists, null otherwise.

final class ActiveRoundCheckProvider
    extends $FunctionalProvider<AsyncValue<Round?>, Round?, FutureOr<Round?>>
    with $FutureModifier<Round?>, $FutureProvider<Round?> {
  /// Provider that checks for any active round.
  /// Returns the active round if one exists, null otherwise.
  const ActiveRoundCheckProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeRoundCheckProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeRoundCheckHash();

  @$internal
  @override
  $FutureProviderElement<Round?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Round?> create(Ref ref) {
    return activeRoundCheck(ref);
  }
}

String _$activeRoundCheckHash() => r'89d162dff40133d2532d90faf8aa56a4929a3cdc';
