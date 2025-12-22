// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browse_courses_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BrowseCoursesNotifier)
const browseCoursesProvider = BrowseCoursesNotifierProvider._();

final class BrowseCoursesNotifierProvider
    extends $NotifierProvider<BrowseCoursesNotifier, BrowseCoursesState> {
  const BrowseCoursesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'browseCoursesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$browseCoursesNotifierHash();

  @$internal
  @override
  BrowseCoursesNotifier create() => BrowseCoursesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BrowseCoursesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BrowseCoursesState>(value),
    );
  }
}

String _$browseCoursesNotifierHash() =>
    r'02bf266d7a0f112b2c6f3885b57b4f737a31fc85';

abstract class _$BrowseCoursesNotifier extends $Notifier<BrowseCoursesState> {
  BrowseCoursesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BrowseCoursesState, BrowseCoursesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BrowseCoursesState, BrowseCoursesState>,
              BrowseCoursesState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
