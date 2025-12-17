///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsEn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsHomeEn home = _TranslationsHomeEn._(_root);
	@override late final _TranslationsRatePopupEn rate_popup = _TranslationsRatePopupEn._(_root);
	@override late final _TranslationsOnboardingEn onboarding = _TranslationsOnboardingEn._(_root);
	@override late final _TranslationsAuthEn auth = _TranslationsAuthEn._(_root);
	@override late final _TranslationsCommonEn common = _TranslationsCommonEn._(_root);
}

// Path: home
class _TranslationsHomeEn extends TranslationsHomeEs {
	_TranslationsHomeEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'TalkCaddy';
}

// Path: rate_popup
class _TranslationsRatePopupEn extends TranslationsRatePopupEs {
	_TranslationsRatePopupEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Would you have 15 seconds to rate us?';
	@override String get description => 'It\'s fast and very helpful! Thanks!';
	@override String get cancel_button => 'Maybe later';
	@override String get rate_button => 'Yes, with pleasure!';
}

// Path: onboarding
class _TranslationsOnboardingEn extends TranslationsOnboardingEs {
	_TranslationsOnboardingEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsOnboardingWelcomeEn welcome = _TranslationsOnboardingWelcomeEn._(_root);
	@override late final _TranslationsOnboardingAppPurposeEn app_purpose = _TranslationsOnboardingAppPurposeEn._(_root);
	@override late final _TranslationsOnboardingLocationPermissionEn location_permission = _TranslationsOnboardingLocationPermissionEn._(_root);
	@override late final _TranslationsOnboardingCompleteEn complete = _TranslationsOnboardingCompleteEn._(_root);
	@override late final _TranslationsOnboardingLoadingEn loading = _TranslationsOnboardingLoadingEn._(_root);
}

// Path: auth
class _TranslationsAuthEn extends TranslationsAuthEs {
	_TranslationsAuthEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAuthSigninEn signin = _TranslationsAuthSigninEn._(_root);
	@override late final _TranslationsAuthSignupEn signup = _TranslationsAuthSignupEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonEs {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get kContinue => 'Continue';
	@override String get cancel => 'Cancel';
	@override String get skip => 'Skip';
	@override String get error => 'Error';
	@override String get success => 'Success';
	@override String get loading => 'Loading...';
	@override String get or => 'or';
}

// Path: onboarding.welcome
class _TranslationsOnboardingWelcomeEn extends TranslationsOnboardingWelcomeEs {
	_TranslationsOnboardingWelcomeEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Your voice caddie';
	@override String get subtitle => 'Play without a scorecard, without writing anything.\nJust talk. I\'ll take care of the rest.';
	@override String get action => 'Continue';
}

// Path: onboarding.app_purpose
class _TranslationsOnboardingAppPurposeEn extends TranslationsOnboardingAppPurposeEs {
	_TranslationsOnboardingAppPurposeEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'What is this app for?';
	@override String get bullet_1 => 'Allows TalkCaddy to follow you on the course';
	@override String get bullet_2 => 'Calculates distances automatically';
	@override String get bullet_3 => 'Syncs your round and your shots';
	@override String get key_message => 'You don\'t need to use the app during the round.\nJust talk to TalkCaddy.';
	@override String get action => 'Got it';
}

// Path: onboarding.location_permission
class _TranslationsOnboardingLocationPermissionEn extends TranslationsOnboardingLocationPermissionEs {
	_TranslationsOnboardingLocationPermissionEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'We need your location';
	@override String get description => 'TalkCaddy uses GPS to:';
	@override String get bullet_1 => 'Detect the hole';
	@override String get bullet_2 => 'Measure distances';
	@override String get bullet_3 => 'Record your shots';
	@override String get reassurance => 'Not used outside of the round.';
	@override String get action => 'Allow location';
	@override String get skip => 'Not now';
}

// Path: onboarding.complete
class _TranslationsOnboardingCompleteEn extends TranslationsOnboardingCompleteEs {
	_TranslationsOnboardingCompleteEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'All set';
	@override String get subtitle => 'Go back to the chat and say:';
	@override String get command => '"TalkCaddy, I\'m starting a round"';
	@override String get action => 'Go to chat';
}

// Path: onboarding.loading
class _TranslationsOnboardingLoadingEn extends TranslationsOnboardingLoadingEs {
	_TranslationsOnboardingLoadingEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Preparing your experience';
	@override String get subtitle => 'Wait a few seconds';
}

// Path: auth.signin
class _TranslationsAuthSigninEn extends TranslationsAuthSigninEs {
	_TranslationsAuthSigninEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Connect your caddie';
	@override String get subtitle => 'Your account syncs your round and course GPS.';
	@override String get email_label => 'Email';
	@override String get email_hint => 'you@email.com';
	@override String get password_label => 'Password';
	@override String get password_hint => 'Password';
	@override String get action => 'Sign in';
	@override String get forgot_password => 'Forgot your password?';
	@override String get no_account => 'Don\'t have an account?';
	@override String get signup_link => 'Sign up';
	@override String get error_title => 'Error';
	@override String get error_message => 'Wrong email or password';
}

// Path: auth.signup
class _TranslationsAuthSignupEn extends TranslationsAuthSignupEs {
	_TranslationsAuthSignupEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Create account';
	@override String get subtitle => 'Your account syncs your round and course GPS.';
	@override String get email_label => 'Email';
	@override String get email_hint => 'you@email.com';
	@override String get password_label => 'Password';
	@override String get password_hint => 'Password';
	@override String get action => 'Sign up';
	@override String get has_account => 'Already have an account?';
	@override String get signin_link => 'Sign in';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'home.title' => 'TalkCaddy',
			'rate_popup.title' => 'Would you have 15 seconds to rate us?',
			'rate_popup.description' => 'It\'s fast and very helpful! Thanks!',
			'rate_popup.cancel_button' => 'Maybe later',
			'rate_popup.rate_button' => 'Yes, with pleasure!',
			'onboarding.welcome.title' => 'Your voice caddie',
			'onboarding.welcome.subtitle' => 'Play without a scorecard, without writing anything.\nJust talk. I\'ll take care of the rest.',
			'onboarding.welcome.action' => 'Continue',
			'onboarding.app_purpose.title' => 'What is this app for?',
			'onboarding.app_purpose.bullet_1' => 'Allows TalkCaddy to follow you on the course',
			'onboarding.app_purpose.bullet_2' => 'Calculates distances automatically',
			'onboarding.app_purpose.bullet_3' => 'Syncs your round and your shots',
			'onboarding.app_purpose.key_message' => 'You don\'t need to use the app during the round.\nJust talk to TalkCaddy.',
			'onboarding.app_purpose.action' => 'Got it',
			'onboarding.location_permission.title' => 'We need your location',
			'onboarding.location_permission.description' => 'TalkCaddy uses GPS to:',
			'onboarding.location_permission.bullet_1' => 'Detect the hole',
			'onboarding.location_permission.bullet_2' => 'Measure distances',
			'onboarding.location_permission.bullet_3' => 'Record your shots',
			'onboarding.location_permission.reassurance' => 'Not used outside of the round.',
			'onboarding.location_permission.action' => 'Allow location',
			'onboarding.location_permission.skip' => 'Not now',
			'onboarding.complete.title' => 'All set',
			'onboarding.complete.subtitle' => 'Go back to the chat and say:',
			'onboarding.complete.command' => '"TalkCaddy, I\'m starting a round"',
			'onboarding.complete.action' => 'Go to chat',
			'onboarding.loading.title' => 'Preparing your experience',
			'onboarding.loading.subtitle' => 'Wait a few seconds',
			'auth.signin.title' => 'Connect your caddie',
			'auth.signin.subtitle' => 'Your account syncs your round and course GPS.',
			'auth.signin.email_label' => 'Email',
			'auth.signin.email_hint' => 'you@email.com',
			'auth.signin.password_label' => 'Password',
			'auth.signin.password_hint' => 'Password',
			'auth.signin.action' => 'Sign in',
			'auth.signin.forgot_password' => 'Forgot your password?',
			'auth.signin.no_account' => 'Don\'t have an account?',
			'auth.signin.signup_link' => 'Sign up',
			'auth.signin.error_title' => 'Error',
			'auth.signin.error_message' => 'Wrong email or password',
			'auth.signup.title' => 'Create account',
			'auth.signup.subtitle' => 'Your account syncs your round and course GPS.',
			'auth.signup.email_label' => 'Email',
			'auth.signup.email_hint' => 'you@email.com',
			'auth.signup.password_label' => 'Password',
			'auth.signup.password_hint' => 'Password',
			'auth.signup.action' => 'Sign up',
			'auth.signup.has_account' => 'Already have an account?',
			'auth.signup.signin_link' => 'Sign in',
			'common.kContinue' => 'Continue',
			'common.cancel' => 'Cancel',
			'common.skip' => 'Skip',
			'common.error' => 'Error',
			'common.success' => 'Success',
			'common.loading' => 'Loading...',
			'common.or' => 'or',
			_ => null,
		};
	}
}
