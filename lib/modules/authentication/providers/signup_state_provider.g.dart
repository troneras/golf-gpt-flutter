// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SignupStateNotifier)
const signupStateProvider = SignupStateNotifierProvider._();

final class SignupStateNotifierProvider
    extends $NotifierProvider<SignupStateNotifier, SignupState> {
  const SignupStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signupStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signupStateNotifierHash();

  @$internal
  @override
  SignupStateNotifier create() => SignupStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignupState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignupState>(value),
    );
  }
}

String _$signupStateNotifierHash() =>
    r'4c43c6427b7f2bca23ccce9161293e289864b808';

abstract class _$SignupStateNotifier extends $Notifier<SignupState> {
  SignupState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SignupState, SignupState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SignupState, SignupState>,
              SignupState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
