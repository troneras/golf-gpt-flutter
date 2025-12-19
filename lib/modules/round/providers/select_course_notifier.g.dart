// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_course_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectCourseNotifier)
const selectCourseProvider = SelectCourseNotifierProvider._();

final class SelectCourseNotifierProvider
    extends $NotifierProvider<SelectCourseNotifier, SelectCourseState> {
  const SelectCourseNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectCourseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectCourseNotifierHash();

  @$internal
  @override
  SelectCourseNotifier create() => SelectCourseNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SelectCourseState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SelectCourseState>(value),
    );
  }
}

String _$selectCourseNotifierHash() =>
    r'c102d0db82ac9b13ff3c9ad51b27bb3a1df2de9d';

abstract class _$SelectCourseNotifier extends $Notifier<SelectCourseState> {
  SelectCourseState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SelectCourseState, SelectCourseState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SelectCourseState, SelectCourseState>,
              SelectCourseState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
