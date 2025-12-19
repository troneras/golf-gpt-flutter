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
	@override late final _TranslationsBottomMenuEn bottom_menu = _TranslationsBottomMenuEn._(_root);
	@override late final _TranslationsRoundsEn rounds = _TranslationsRoundsEn._(_root);
	@override late final _TranslationsSettingsEn settings = _TranslationsSettingsEn._(_root);
	@override late final _TranslationsSelectCourseEn select_course = _TranslationsSelectCourseEn._(_root);
	@override late final _TranslationsBrowseCoursesEn browse_courses = _TranslationsBrowseCoursesEn._(_root);
	@override late final _TranslationsRoundInProgressEn round_in_progress = _TranslationsRoundInProgressEn._(_root);
	@override late final _TranslationsRoundSummaryEn round_summary = _TranslationsRoundSummaryEn._(_root);
	@override late final _TranslationsScoreNamesEn score_names = _TranslationsScoreNamesEn._(_root);
	@override late final _TranslationsActiveRoundEn active_round = _TranslationsActiveRoundEn._(_root);
	@override late final _TranslationsFeedbackEn feedback = _TranslationsFeedbackEn._(_root);
}

// Path: home
class _TranslationsHomeEn extends TranslationsHomeEs {
	_TranslationsHomeEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'TalkCaddy';
	@override String get title_ready => 'is ready';
	@override String get start_round => 'Start round';
	@override String get gps_hint => 'Enable GPS and start talking to your caddie';
	@override String get say_things_like => 'Say things like:';
	@override String get example_1 => '"Tee shot with driver"';
	@override String get example_2 => '"Two putts"';
	@override String get example_3 => '"Made bogey"';
	@override String get location_required_title => 'Location required';
	@override String get location_required_message => 'TalkCaddy needs access to your location to calculate distances and record your shots during the round.';
	@override String get location_required_action => 'Open settings';
	@override String get play_without_gps => 'Play without GPS';
	@override String get no_gps_warning => 'Without GPS you won\'t be able to see distances or record your shot locations.';
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
	@override String get or_sign_in_with => 'Or sign in with';
	@override String get sign_in_with_google => 'Sign in with Google';
	@override late final _TranslationsAuthSigninEn signin = _TranslationsAuthSigninEn._(_root);
	@override late final _TranslationsAuthSignupEn signup = _TranslationsAuthSignupEn._(_root);
	@override late final _TranslationsAuthEmailVerificationEn email_verification = _TranslationsAuthEmailVerificationEn._(_root);
	@override late final _TranslationsAuthRecoverPasswordEn recover_password = _TranslationsAuthRecoverPasswordEn._(_root);
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
	@override String get retry => 'Retry';
}

// Path: bottom_menu
class _TranslationsBottomMenuEn extends TranslationsBottomMenuEs {
	_TranslationsBottomMenuEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get home => 'Home';
	@override String get rounds => 'Rounds';
	@override String get settings => 'Settings';
}

// Path: rounds
class _TranslationsRoundsEn extends TranslationsRoundsEs {
	_TranslationsRoundsEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'My rounds';
	@override String get empty => 'You don\'t have any rounds yet';
	@override String get empty_hint => 'Start a round to see your history here';
	@override String get error_loading => 'Error loading rounds';
	@override String get total_strokes => 'strokes';
	@override String get holes_played => 'holes';
	@override String get duration => 'duration';
	@override String get detail_title => 'Round details';
	@override String get result => 'Result';
}

// Path: settings
class _TranslationsSettingsEn extends TranslationsSettingsEs {
	_TranslationsSettingsEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Settings';
	@override late final _TranslationsSettingsLocationPermissionEn location_permission = _TranslationsSettingsLocationPermissionEn._(_root);
}

// Path: select_course
class _TranslationsSelectCourseEn extends TranslationsSelectCourseEs {
	_TranslationsSelectCourseEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Select the course';
	@override String get loading => 'Searching for nearby course...';
	@override String get closest_course => 'Closest course';
	@override String get select_other_course => 'Select another course';
	@override String get tees_section => 'Tee boxes';
	@override String get settings_section => 'Settings';
	@override String get gps_tracking => 'GPS Tracking';
	@override String get gps_tracking_description => 'Measure distances to green and hazards';
	@override String get no_course_found => 'No courses found nearby';
	@override String get no_course_found_hint => 'Make sure you\'re at a golf course or try again';
	@override String get error_title => 'Error searching course';
	@override String get retry => 'Retry';
}

// Path: browse_courses
class _TranslationsBrowseCoursesEn extends TranslationsBrowseCoursesEs {
	_TranslationsBrowseCoursesEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Select another course';
	@override String get tab_nearby => 'Nearby';
	@override String get tab_recent => 'Recent';
	@override String get tab_search => 'Search';
	@override String get search_placeholder => 'City or course name';
	@override String get search_min_chars => 'Type at least 3 characters';
	@override String get no_results => 'No courses found';
	@override String get empty_nearby => 'No nearby courses';
	@override String get empty_recent => 'No recent courses';
	@override String get empty_recent_hint => 'Courses you play will appear here';
	@override String get login_required => 'Sign in to see your recent courses';
	@override String get login_action => 'Sign in';
	@override String get error_loading => 'Error loading courses';
	@override String get retry => 'Retry';
}

// Path: round_in_progress
class _TranslationsRoundInProgressEn extends TranslationsRoundInProgressEs {
	_TranslationsRoundInProgressEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Round in progress';
	@override String get strokes => 'Strokes';
	@override String get vs_par => 'vs Par';
	@override String get holes => 'Holes';
	@override String get hole => 'Hole';
	@override String get yards => 'Yds';
	@override String get par => 'Par';
	@override String get score => 'Score';
	@override String get out => 'OUT';
	@override String get kIn => 'IN';
	@override String get total => 'TOT';
	@override String get putts => 'Putts';
	@override String get penalties => 'Penalties';
	@override String get save => 'Save';
	@override String get finish_round => 'Finish Round';
	@override String get exit_title => 'Leave the round?';
	@override String get exit_message => 'Your progress will be saved and you can continue later.';
	@override String get exit_action => 'Leave';
	@override String get finish_title => 'Finish round?';
	@override String get finish_message => 'Once finished, you won\'t be able to edit the results.';
	@override String get finish_action => 'Finish';
	@override String get notes_label => 'Notes (optional)';
	@override String get notes_hint => 'Add notes about the round...';
	@override String get gps_enabled => 'GPS enabled';
	@override String get gps_disabled => 'GPS disabled';
	@override String get error_saving => 'Error saving';
	@override String get retry => 'Retry';
	@override String get back => 'Back';
}

// Path: round_summary
class _TranslationsRoundSummaryEn extends TranslationsRoundSummaryEs {
	_TranslationsRoundSummaryEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Round finished!';
	@override String get subtitle => 'Here\'s your summary';
	@override String get total_strokes => 'total strokes';
	@override String get putts => 'Putts';
	@override String get duration => 'Duration';
	@override String get fairways => 'Fairways';
	@override String get gir => 'GIR';
	@override String get back_home => 'Back to home';
	@override String get view_details => 'View details';
}

// Path: score_names
class _TranslationsScoreNamesEn extends TranslationsScoreNamesEs {
	_TranslationsScoreNamesEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get hole_in_one => 'Hole in One!';
	@override String get albatross => 'Albatross';
	@override String get eagle => 'Eagle';
	@override String get birdie => 'Birdie';
	@override String get par => 'Par';
	@override String get bogey => 'Bogey';
	@override String get double_bogey => 'Double Bogey';
	@override String get triple_bogey => 'Triple Bogey';
}

// Path: active_round
class _TranslationsActiveRoundEn extends TranslationsActiveRoundEs {
	_TranslationsActiveRoundEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'You have a round in progress';
	@override String message({required Object courseName}) => 'You left an unfinished round at ${courseName}.';
	@override String holes_played({required Object count}) => '${count} of 18 holes played';
	@override String get resume => 'Resume round';
	@override String get finish => 'Finish round';
}

// Path: feedback
class _TranslationsFeedbackEn extends TranslationsFeedbackEs {
	_TranslationsFeedbackEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Send feedback';
	@override String get subtitle => 'Your feedback helps us improve TalkCaddy';
	@override String get category_label => 'Category';
	@override String get category_general => 'General';
	@override String get category_support => 'Support';
	@override String get category_feedback => 'Feedback';
	@override String get category_bug_report => 'Bug report';
	@override String get category_feature_request => 'Feature request';
	@override String get subject_label => 'Subject';
	@override String get subject_hint => 'Briefly describe your message';
	@override String get subject_required => 'Subject is required';
	@override String get message_label => 'Message';
	@override String get message_hint => 'Tell us more details...';
	@override String get message_required => 'Message is required';
	@override String get submit => 'Send';
	@override String get error_title => 'Error';
	@override String get error_message => 'Could not send your message. Please try again.';
	@override String get success_title => 'Message sent';
	@override String get success_message => 'Thank you for your feedback. We will respond shortly.';
	@override String get back => 'Go back';
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
	@override String get action => 'Continue';
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
	@override String get error_title => 'Error';
	@override String get error_message => 'This email already exists or is invalid';
}

// Path: auth.email_verification
class _TranslationsAuthEmailVerificationEn extends TranslationsAuthEmailVerificationEs {
	_TranslationsAuthEmailVerificationEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Verify email';
	@override String get code_sent_title => 'Verification code';
	@override String get subtitle => 'We sent a 6-digit code to {email}';
	@override String get verify_button => 'Verify';
	@override String get resend_code => 'Resend code';
	@override String get success => 'Email verified';
	@override String get error_invalid => 'Invalid or expired code';
}

// Path: auth.recover_password
class _TranslationsAuthRecoverPasswordEn extends TranslationsAuthRecoverPasswordEs {
	_TranslationsAuthRecoverPasswordEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recover password';
	@override String get email_title => 'Forgot your password?';
	@override String get email_subtitle => 'Enter your email and we\'ll send you a verification code';
	@override String get email_label => 'Email';
	@override String get send_code_button => 'Send code';
	@override String get code_title => 'Enter the code';
	@override String get code_subtitle => 'We sent a 6-digit code to {email}';
	@override String get new_password_label => 'New password';
	@override String get confirm_password_label => 'Confirm password';
	@override String get password_required => 'Password is required';
	@override String get password_min_length => 'Password must be at least 8 characters';
	@override String get passwords_not_match => 'Passwords do not match';
	@override String get reset_button => 'Change password';
	@override String get back_to_email => 'Go back to enter email';
	@override String get success_title => 'Password changed';
	@override String get success_subtitle => 'Your password has been updated. Sign in with your new password.';
	@override String get back_to_signin => 'Go to sign in';
}

// Path: settings.location_permission
class _TranslationsSettingsLocationPermissionEn extends TranslationsSettingsLocationPermissionEs {
	_TranslationsSettingsLocationPermissionEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Location permission';
	@override String get granted => 'Allowed';
	@override String get denied => 'Denied';
	@override String get open_settings => 'Open settings';
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
			'home.title_ready' => 'is ready',
			'home.start_round' => 'Start round',
			'home.gps_hint' => 'Enable GPS and start talking to your caddie',
			'home.say_things_like' => 'Say things like:',
			'home.example_1' => '"Tee shot with driver"',
			'home.example_2' => '"Two putts"',
			'home.example_3' => '"Made bogey"',
			'home.location_required_title' => 'Location required',
			'home.location_required_message' => 'TalkCaddy needs access to your location to calculate distances and record your shots during the round.',
			'home.location_required_action' => 'Open settings',
			'home.play_without_gps' => 'Play without GPS',
			'home.no_gps_warning' => 'Without GPS you won\'t be able to see distances or record your shot locations.',
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
			'onboarding.complete.action' => 'Continue',
			'onboarding.loading.title' => 'Preparing your experience',
			'onboarding.loading.subtitle' => 'Wait a few seconds',
			'auth.or_sign_in_with' => 'Or sign in with',
			'auth.sign_in_with_google' => 'Sign in with Google',
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
			'auth.signup.error_title' => 'Error',
			'auth.signup.error_message' => 'This email already exists or is invalid',
			'auth.email_verification.title' => 'Verify email',
			'auth.email_verification.code_sent_title' => 'Verification code',
			'auth.email_verification.subtitle' => 'We sent a 6-digit code to {email}',
			'auth.email_verification.verify_button' => 'Verify',
			'auth.email_verification.resend_code' => 'Resend code',
			'auth.email_verification.success' => 'Email verified',
			'auth.email_verification.error_invalid' => 'Invalid or expired code',
			'auth.recover_password.title' => 'Recover password',
			'auth.recover_password.email_title' => 'Forgot your password?',
			'auth.recover_password.email_subtitle' => 'Enter your email and we\'ll send you a verification code',
			'auth.recover_password.email_label' => 'Email',
			'auth.recover_password.send_code_button' => 'Send code',
			'auth.recover_password.code_title' => 'Enter the code',
			'auth.recover_password.code_subtitle' => 'We sent a 6-digit code to {email}',
			'auth.recover_password.new_password_label' => 'New password',
			'auth.recover_password.confirm_password_label' => 'Confirm password',
			'auth.recover_password.password_required' => 'Password is required',
			'auth.recover_password.password_min_length' => 'Password must be at least 8 characters',
			'auth.recover_password.passwords_not_match' => 'Passwords do not match',
			'auth.recover_password.reset_button' => 'Change password',
			'auth.recover_password.back_to_email' => 'Go back to enter email',
			'auth.recover_password.success_title' => 'Password changed',
			'auth.recover_password.success_subtitle' => 'Your password has been updated. Sign in with your new password.',
			'auth.recover_password.back_to_signin' => 'Go to sign in',
			'common.kContinue' => 'Continue',
			'common.cancel' => 'Cancel',
			'common.skip' => 'Skip',
			'common.error' => 'Error',
			'common.success' => 'Success',
			'common.loading' => 'Loading...',
			'common.or' => 'or',
			'common.retry' => 'Retry',
			'bottom_menu.home' => 'Home',
			'bottom_menu.rounds' => 'Rounds',
			'bottom_menu.settings' => 'Settings',
			'rounds.title' => 'My rounds',
			'rounds.empty' => 'You don\'t have any rounds yet',
			'rounds.empty_hint' => 'Start a round to see your history here',
			'rounds.error_loading' => 'Error loading rounds',
			'rounds.total_strokes' => 'strokes',
			'rounds.holes_played' => 'holes',
			'rounds.duration' => 'duration',
			'rounds.detail_title' => 'Round details',
			'rounds.result' => 'Result',
			'settings.title' => 'Settings',
			'settings.location_permission.title' => 'Location permission',
			'settings.location_permission.granted' => 'Allowed',
			'settings.location_permission.denied' => 'Denied',
			'settings.location_permission.open_settings' => 'Open settings',
			'select_course.title' => 'Select the course',
			'select_course.loading' => 'Searching for nearby course...',
			'select_course.closest_course' => 'Closest course',
			'select_course.select_other_course' => 'Select another course',
			'select_course.tees_section' => 'Tee boxes',
			'select_course.settings_section' => 'Settings',
			'select_course.gps_tracking' => 'GPS Tracking',
			'select_course.gps_tracking_description' => 'Measure distances to green and hazards',
			'select_course.no_course_found' => 'No courses found nearby',
			'select_course.no_course_found_hint' => 'Make sure you\'re at a golf course or try again',
			'select_course.error_title' => 'Error searching course',
			'select_course.retry' => 'Retry',
			'browse_courses.title' => 'Select another course',
			'browse_courses.tab_nearby' => 'Nearby',
			'browse_courses.tab_recent' => 'Recent',
			'browse_courses.tab_search' => 'Search',
			'browse_courses.search_placeholder' => 'City or course name',
			'browse_courses.search_min_chars' => 'Type at least 3 characters',
			'browse_courses.no_results' => 'No courses found',
			'browse_courses.empty_nearby' => 'No nearby courses',
			'browse_courses.empty_recent' => 'No recent courses',
			'browse_courses.empty_recent_hint' => 'Courses you play will appear here',
			'browse_courses.login_required' => 'Sign in to see your recent courses',
			'browse_courses.login_action' => 'Sign in',
			'browse_courses.error_loading' => 'Error loading courses',
			'browse_courses.retry' => 'Retry',
			'round_in_progress.title' => 'Round in progress',
			'round_in_progress.strokes' => 'Strokes',
			'round_in_progress.vs_par' => 'vs Par',
			'round_in_progress.holes' => 'Holes',
			'round_in_progress.hole' => 'Hole',
			'round_in_progress.yards' => 'Yds',
			'round_in_progress.par' => 'Par',
			'round_in_progress.score' => 'Score',
			'round_in_progress.out' => 'OUT',
			'round_in_progress.kIn' => 'IN',
			'round_in_progress.total' => 'TOT',
			'round_in_progress.putts' => 'Putts',
			'round_in_progress.penalties' => 'Penalties',
			'round_in_progress.save' => 'Save',
			'round_in_progress.finish_round' => 'Finish Round',
			'round_in_progress.exit_title' => 'Leave the round?',
			'round_in_progress.exit_message' => 'Your progress will be saved and you can continue later.',
			'round_in_progress.exit_action' => 'Leave',
			'round_in_progress.finish_title' => 'Finish round?',
			'round_in_progress.finish_message' => 'Once finished, you won\'t be able to edit the results.',
			'round_in_progress.finish_action' => 'Finish',
			'round_in_progress.notes_label' => 'Notes (optional)',
			'round_in_progress.notes_hint' => 'Add notes about the round...',
			'round_in_progress.gps_enabled' => 'GPS enabled',
			'round_in_progress.gps_disabled' => 'GPS disabled',
			'round_in_progress.error_saving' => 'Error saving',
			'round_in_progress.retry' => 'Retry',
			'round_in_progress.back' => 'Back',
			'round_summary.title' => 'Round finished!',
			'round_summary.subtitle' => 'Here\'s your summary',
			'round_summary.total_strokes' => 'total strokes',
			'round_summary.putts' => 'Putts',
			'round_summary.duration' => 'Duration',
			'round_summary.fairways' => 'Fairways',
			'round_summary.gir' => 'GIR',
			'round_summary.back_home' => 'Back to home',
			'round_summary.view_details' => 'View details',
			'score_names.hole_in_one' => 'Hole in One!',
			'score_names.albatross' => 'Albatross',
			'score_names.eagle' => 'Eagle',
			'score_names.birdie' => 'Birdie',
			'score_names.par' => 'Par',
			'score_names.bogey' => 'Bogey',
			'score_names.double_bogey' => 'Double Bogey',
			'score_names.triple_bogey' => 'Triple Bogey',
			'active_round.title' => 'You have a round in progress',
			'active_round.message' => ({required Object courseName}) => 'You left an unfinished round at ${courseName}.',
			'active_round.holes_played' => ({required Object count}) => '${count} of 18 holes played',
			'active_round.resume' => 'Resume round',
			'active_round.finish' => 'Finish round',
			'feedback.title' => 'Send feedback',
			'feedback.subtitle' => 'Your feedback helps us improve TalkCaddy',
			'feedback.category_label' => 'Category',
			'feedback.category_general' => 'General',
			'feedback.category_support' => 'Support',
			'feedback.category_feedback' => 'Feedback',
			'feedback.category_bug_report' => 'Bug report',
			'feedback.category_feature_request' => 'Feature request',
			'feedback.subject_label' => 'Subject',
			'feedback.subject_hint' => 'Briefly describe your message',
			'feedback.subject_required' => 'Subject is required',
			'feedback.message_label' => 'Message',
			'feedback.message_hint' => 'Tell us more details...',
			'feedback.message_required' => 'Message is required',
			'feedback.submit' => 'Send',
			'feedback.error_title' => 'Error',
			'feedback.error_message' => 'Could not send your message. Please try again.',
			'feedback.success_title' => 'Message sent',
			'feedback.success_message' => 'Thank you for your feedback. We will respond shortly.',
			'feedback.back' => 'Go back',
			_ => null,
		};
	}
}
