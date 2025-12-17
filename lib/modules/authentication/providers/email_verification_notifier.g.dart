// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verification_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EmailVerificationNotifier)
const emailVerificationProvider = EmailVerificationNotifierProvider._();

final class EmailVerificationNotifierProvider
    extends
        $NotifierProvider<EmailVerificationNotifier, EmailVerificationState> {
  const EmailVerificationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'emailVerificationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$emailVerificationNotifierHash();

  @$internal
  @override
  EmailVerificationNotifier create() => EmailVerificationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmailVerificationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmailVerificationState>(value),
    );
  }
}

String _$emailVerificationNotifierHash() =>
    r'ddfbb5d8d5ff6b76e75ba5daac442d36e384df66';

abstract class _$EmailVerificationNotifier
    extends $Notifier<EmailVerificationState> {
  EmailVerificationState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<EmailVerificationState, EmailVerificationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EmailVerificationState, EmailVerificationState>,
              EmailVerificationState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
