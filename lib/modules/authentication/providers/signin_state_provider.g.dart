// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SigninStateNotifier)
const signinStateProvider = SigninStateNotifierProvider._();

final class SigninStateNotifierProvider
    extends $NotifierProvider<SigninStateNotifier, SigninState> {
  const SigninStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signinStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signinStateNotifierHash();

  @$internal
  @override
  SigninStateNotifier create() => SigninStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SigninState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SigninState>(value),
    );
  }
}

String _$signinStateNotifierHash() =>
    r'669c29e6ed6b6ec8fd747ad83226ef748a07764f';

abstract class _$SigninStateNotifier extends $Notifier<SigninState> {
  SigninState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SigninState, SigninState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SigninState, SigninState>,
              SigninState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
