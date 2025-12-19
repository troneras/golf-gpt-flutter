// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FeedbackStateNotifier)
const feedbackStateProvider = FeedbackStateNotifierProvider._();

final class FeedbackStateNotifierProvider
    extends $NotifierProvider<FeedbackStateNotifier, FeedbackState> {
  const FeedbackStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedbackStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedbackStateNotifierHash();

  @$internal
  @override
  FeedbackStateNotifier create() => FeedbackStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FeedbackState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FeedbackState>(value),
    );
  }
}

String _$feedbackStateNotifierHash() =>
    r'4b4d86f52d2bf050b83f19bbef664b4fb61cb128';

abstract class _$FeedbackStateNotifier extends $Notifier<FeedbackState> {
  FeedbackState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<FeedbackState, FeedbackState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FeedbackState, FeedbackState>,
              FeedbackState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
