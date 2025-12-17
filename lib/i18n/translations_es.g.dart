///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEs = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsHomeEs home = TranslationsHomeEs.internal(_root);
	late final TranslationsRatePopupEs rate_popup = TranslationsRatePopupEs.internal(_root);
	late final TranslationsOnboardingEs onboarding = TranslationsOnboardingEs.internal(_root);
	late final TranslationsAuthEs auth = TranslationsAuthEs.internal(_root);
	late final TranslationsCommonEs common = TranslationsCommonEs.internal(_root);
}

// Path: home
class TranslationsHomeEs {
	TranslationsHomeEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'TalkCaddy'
	String get title => 'TalkCaddy';
}

// Path: rate_popup
class TranslationsRatePopupEs {
	TranslationsRatePopupEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Tienes 15 segundos para valorarnos?'
	String get title => 'Tienes 15 segundos para valorarnos?';

	/// es: 'Es rapido y nos ayuda mucho! Gracias!'
	String get description => 'Es rapido y nos ayuda mucho! Gracias!';

	/// es: 'Quiza luego'
	String get cancel_button => 'Quiza luego';

	/// es: 'Si, con gusto!'
	String get rate_button => 'Si, con gusto!';
}

// Path: onboarding
class TranslationsOnboardingEs {
	TranslationsOnboardingEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsOnboardingWelcomeEs welcome = TranslationsOnboardingWelcomeEs.internal(_root);
	late final TranslationsOnboardingAppPurposeEs app_purpose = TranslationsOnboardingAppPurposeEs.internal(_root);
	late final TranslationsOnboardingLocationPermissionEs location_permission = TranslationsOnboardingLocationPermissionEs.internal(_root);
	late final TranslationsOnboardingCompleteEs complete = TranslationsOnboardingCompleteEs.internal(_root);
	late final TranslationsOnboardingLoadingEs loading = TranslationsOnboardingLoadingEs.internal(_root);
}

// Path: auth
class TranslationsAuthEs {
	TranslationsAuthEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAuthSigninEs signin = TranslationsAuthSigninEs.internal(_root);
	late final TranslationsAuthSignupEs signup = TranslationsAuthSignupEs.internal(_root);
}

// Path: common
class TranslationsCommonEs {
	TranslationsCommonEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Continuar'
	String get kContinue => 'Continuar';

	/// es: 'Cancelar'
	String get cancel => 'Cancelar';

	/// es: 'Omitir'
	String get skip => 'Omitir';

	/// es: 'Error'
	String get error => 'Error';

	/// es: 'Exito'
	String get success => 'Exito';

	/// es: 'Cargando...'
	String get loading => 'Cargando...';

	/// es: 'o'
	String get or => 'o';
}

// Path: onboarding.welcome
class TranslationsOnboardingWelcomeEs {
	TranslationsOnboardingWelcomeEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Tu caddie por voz'
	String get title => 'Tu caddie por voz';

	/// es: 'Juega sin tarjeta, sin apuntar nada. Solo habla. Yo me encargo del resto.'
	String get subtitle => 'Juega sin tarjeta, sin apuntar nada.\nSolo habla. Yo me encargo del resto.';

	/// es: 'Continuar'
	String get action => 'Continuar';
}

// Path: onboarding.app_purpose
class TranslationsOnboardingAppPurposeEs {
	TranslationsOnboardingAppPurposeEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Para que sirve esta app?'
	String get title => 'Para que sirve esta app?';

	/// es: 'Permite a TalkCaddy seguirte en el campo'
	String get bullet_1 => 'Permite a TalkCaddy seguirte en el campo';

	/// es: 'Calcula distancias automaticamente'
	String get bullet_2 => 'Calcula distancias automaticamente';

	/// es: 'Sincroniza tu ronda y tus golpes'
	String get bullet_3 => 'Sincroniza tu ronda y tus golpes';

	/// es: 'No necesitas usar la app durante la ronda. Solo hablar con TalkCaddy.'
	String get key_message => 'No necesitas usar la app durante la ronda.\nSolo hablar con TalkCaddy.';

	/// es: 'Entendido'
	String get action => 'Entendido';
}

// Path: onboarding.location_permission
class TranslationsOnboardingLocationPermissionEs {
	TranslationsOnboardingLocationPermissionEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Necesitamos tu ubicacion'
	String get title => 'Necesitamos tu ubicacion';

	/// es: 'TalkCaddy usa el GPS para:'
	String get description => 'TalkCaddy usa el GPS para:';

	/// es: 'Detectar el hoyo'
	String get bullet_1 => 'Detectar el hoyo';

	/// es: 'Medir distancias'
	String get bullet_2 => 'Medir distancias';

	/// es: 'Registrar tus golpes'
	String get bullet_3 => 'Registrar tus golpes';

	/// es: 'No se usa fuera de la ronda.'
	String get reassurance => 'No se usa fuera de la ronda.';

	/// es: 'Permitir ubicacion'
	String get action => 'Permitir ubicacion';

	/// es: 'Ahora no'
	String get skip => 'Ahora no';
}

// Path: onboarding.complete
class TranslationsOnboardingCompleteEs {
	TranslationsOnboardingCompleteEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Todo listo'
	String get title => 'Todo listo';

	/// es: 'Vuelve al chat y di:'
	String get subtitle => 'Vuelve al chat y di:';

	/// es: '"TalkCaddy, empiezo una ronda"'
	String get command => '"TalkCaddy, empiezo una ronda"';

	/// es: 'Ir al chat'
	String get action => 'Ir al chat';
}

// Path: onboarding.loading
class TranslationsOnboardingLoadingEs {
	TranslationsOnboardingLoadingEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Preparando tu experiencia'
	String get title => 'Preparando tu experiencia';

	/// es: 'Espera unos segundos'
	String get subtitle => 'Espera unos segundos';
}

// Path: auth.signin
class TranslationsAuthSigninEs {
	TranslationsAuthSigninEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Conecta tu caddie'
	String get title => 'Conecta tu caddie';

	/// es: 'Tu cuenta sincroniza tu ronda y el GPS del campo.'
	String get subtitle => 'Tu cuenta sincroniza tu ronda y el GPS del campo.';

	/// es: 'Correo electronico'
	String get email_label => 'Correo electronico';

	/// es: 'tu@email.com'
	String get email_hint => 'tu@email.com';

	/// es: 'Contrasena'
	String get password_label => 'Contrasena';

	/// es: 'Contrasena'
	String get password_hint => 'Contrasena';

	/// es: 'Entrar'
	String get action => 'Entrar';

	/// es: 'Olvidaste tu contrasena?'
	String get forgot_password => 'Olvidaste tu contrasena?';

	/// es: 'No tienes cuenta?'
	String get no_account => 'No tienes cuenta?';

	/// es: 'Registrate'
	String get signup_link => 'Registrate';

	/// es: 'Error'
	String get error_title => 'Error';

	/// es: 'Email o contrasena incorrectos'
	String get error_message => 'Email o contrasena incorrectos';
}

// Path: auth.signup
class TranslationsAuthSignupEs {
	TranslationsAuthSignupEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Crear cuenta'
	String get title => 'Crear cuenta';

	/// es: 'Tu cuenta sincroniza tu ronda y el GPS del campo.'
	String get subtitle => 'Tu cuenta sincroniza tu ronda y el GPS del campo.';

	/// es: 'Correo electronico'
	String get email_label => 'Correo electronico';

	/// es: 'tu@email.com'
	String get email_hint => 'tu@email.com';

	/// es: 'Contrasena'
	String get password_label => 'Contrasena';

	/// es: 'Contrasena'
	String get password_hint => 'Contrasena';

	/// es: 'Registrarse'
	String get action => 'Registrarse';

	/// es: 'Ya tienes cuenta?'
	String get has_account => 'Ya tienes cuenta?';

	/// es: 'Inicia sesion'
	String get signin_link => 'Inicia sesion';
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'home.title' => 'TalkCaddy',
			'rate_popup.title' => 'Tienes 15 segundos para valorarnos?',
			'rate_popup.description' => 'Es rapido y nos ayuda mucho! Gracias!',
			'rate_popup.cancel_button' => 'Quiza luego',
			'rate_popup.rate_button' => 'Si, con gusto!',
			'onboarding.welcome.title' => 'Tu caddie por voz',
			'onboarding.welcome.subtitle' => 'Juega sin tarjeta, sin apuntar nada.\nSolo habla. Yo me encargo del resto.',
			'onboarding.welcome.action' => 'Continuar',
			'onboarding.app_purpose.title' => 'Para que sirve esta app?',
			'onboarding.app_purpose.bullet_1' => 'Permite a TalkCaddy seguirte en el campo',
			'onboarding.app_purpose.bullet_2' => 'Calcula distancias automaticamente',
			'onboarding.app_purpose.bullet_3' => 'Sincroniza tu ronda y tus golpes',
			'onboarding.app_purpose.key_message' => 'No necesitas usar la app durante la ronda.\nSolo hablar con TalkCaddy.',
			'onboarding.app_purpose.action' => 'Entendido',
			'onboarding.location_permission.title' => 'Necesitamos tu ubicacion',
			'onboarding.location_permission.description' => 'TalkCaddy usa el GPS para:',
			'onboarding.location_permission.bullet_1' => 'Detectar el hoyo',
			'onboarding.location_permission.bullet_2' => 'Medir distancias',
			'onboarding.location_permission.bullet_3' => 'Registrar tus golpes',
			'onboarding.location_permission.reassurance' => 'No se usa fuera de la ronda.',
			'onboarding.location_permission.action' => 'Permitir ubicacion',
			'onboarding.location_permission.skip' => 'Ahora no',
			'onboarding.complete.title' => 'Todo listo',
			'onboarding.complete.subtitle' => 'Vuelve al chat y di:',
			'onboarding.complete.command' => '"TalkCaddy, empiezo una ronda"',
			'onboarding.complete.action' => 'Ir al chat',
			'onboarding.loading.title' => 'Preparando tu experiencia',
			'onboarding.loading.subtitle' => 'Espera unos segundos',
			'auth.signin.title' => 'Conecta tu caddie',
			'auth.signin.subtitle' => 'Tu cuenta sincroniza tu ronda y el GPS del campo.',
			'auth.signin.email_label' => 'Correo electronico',
			'auth.signin.email_hint' => 'tu@email.com',
			'auth.signin.password_label' => 'Contrasena',
			'auth.signin.password_hint' => 'Contrasena',
			'auth.signin.action' => 'Entrar',
			'auth.signin.forgot_password' => 'Olvidaste tu contrasena?',
			'auth.signin.no_account' => 'No tienes cuenta?',
			'auth.signin.signup_link' => 'Registrate',
			'auth.signin.error_title' => 'Error',
			'auth.signin.error_message' => 'Email o contrasena incorrectos',
			'auth.signup.title' => 'Crear cuenta',
			'auth.signup.subtitle' => 'Tu cuenta sincroniza tu ronda y el GPS del campo.',
			'auth.signup.email_label' => 'Correo electronico',
			'auth.signup.email_hint' => 'tu@email.com',
			'auth.signup.password_label' => 'Contrasena',
			'auth.signup.password_hint' => 'Contrasena',
			'auth.signup.action' => 'Registrarse',
			'auth.signup.has_account' => 'Ya tienes cuenta?',
			'auth.signup.signin_link' => 'Inicia sesion',
			'common.kContinue' => 'Continuar',
			'common.cancel' => 'Cancelar',
			'common.skip' => 'Omitir',
			'common.error' => 'Error',
			'common.success' => 'Exito',
			'common.loading' => 'Cargando...',
			'common.or' => 'o',
			_ => null,
		};
	}
}
