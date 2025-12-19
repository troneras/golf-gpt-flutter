// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag_page_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BagPageNotifier)
const bagPageProvider = BagPageNotifierProvider._();

final class BagPageNotifierProvider
    extends $AsyncNotifierProvider<BagPageNotifier, BagPageState> {
  const BagPageNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bagPageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bagPageNotifierHash();

  @$internal
  @override
  BagPageNotifier create() => BagPageNotifier();
}

String _$bagPageNotifierHash() => r'f9106c5e4d1240e5e872154429ff1c392fc04376';

abstract class _$BagPageNotifier extends $AsyncNotifier<BagPageState> {
  FutureOr<BagPageState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<BagPageState>, BagPageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<BagPageState>, BagPageState>,
              AsyncValue<BagPageState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
