// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rounds_page_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RoundsPageNotifier)
const roundsPageProvider = RoundsPageNotifierProvider._();

final class RoundsPageNotifierProvider
    extends $AsyncNotifierProvider<RoundsPageNotifier, RoundsPageState> {
  const RoundsPageNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roundsPageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roundsPageNotifierHash();

  @$internal
  @override
  RoundsPageNotifier create() => RoundsPageNotifier();
}

String _$roundsPageNotifierHash() =>
    r'9e7c1a99dc65ddf8449fc3017ff6baedf6793c19';

abstract class _$RoundsPageNotifier extends $AsyncNotifier<RoundsPageState> {
  FutureOr<RoundsPageState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<RoundsPageState>, RoundsPageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RoundsPageState>, RoundsPageState>,
              AsyncValue<RoundsPageState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
