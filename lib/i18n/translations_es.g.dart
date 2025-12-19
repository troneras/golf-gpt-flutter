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
	late final TranslationsBottomMenuEs bottom_menu = TranslationsBottomMenuEs.internal(_root);
	late final TranslationsRoundsEs rounds = TranslationsRoundsEs.internal(_root);
	late final TranslationsSettingsEs settings = TranslationsSettingsEs.internal(_root);
	late final TranslationsSelectCourseEs select_course = TranslationsSelectCourseEs.internal(_root);
	late final TranslationsBrowseCoursesEs browse_courses = TranslationsBrowseCoursesEs.internal(_root);
	late final TranslationsRoundInProgressEs round_in_progress = TranslationsRoundInProgressEs.internal(_root);
	late final TranslationsRoundSummaryEs round_summary = TranslationsRoundSummaryEs.internal(_root);
	late final TranslationsScoreNamesEs score_names = TranslationsScoreNamesEs.internal(_root);
	late final TranslationsActiveRoundEs active_round = TranslationsActiveRoundEs.internal(_root);
	late final TranslationsFeedbackEs feedback = TranslationsFeedbackEs.internal(_root);
	late final TranslationsGpsEs gps = TranslationsGpsEs.internal(_root);
}

// Path: home
class TranslationsHomeEs {
	TranslationsHomeEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'TalkCaddy'
	String get title => 'TalkCaddy';

	/// es: 'esta listo'
	String get title_ready => 'esta listo';

	/// es: 'Iniciar ronda'
	String get start_round => 'Iniciar ronda';

	/// es: 'Activa el GPS y empieza a hablar con tu caddie'
	String get gps_hint => 'Activa el GPS y empieza a hablar con tu caddie';

	/// es: 'Di cosas como:'
	String get say_things_like => 'Di cosas como:';

	/// es: '"Salida con driver"'
	String get example_1 => '"Salida con driver"';

	/// es: '"Dos putts"'
	String get example_2 => '"Dos putts"';

	/// es: '"Hecho bogey"'
	String get example_3 => '"Hecho bogey"';

	/// es: 'Ubicacion requerida'
	String get location_required_title => 'Ubicacion requerida';

	/// es: 'TalkCaddy necesita acceso a tu ubicacion para calcular distancias y registrar tus golpes durante la ronda.'
	String get location_required_message => 'TalkCaddy necesita acceso a tu ubicacion para calcular distancias y registrar tus golpes durante la ronda.';

	/// es: 'Abrir ajustes'
	String get location_required_action => 'Abrir ajustes';

	/// es: 'Jugar sin GPS'
	String get play_without_gps => 'Jugar sin GPS';

	/// es: 'Sin GPS no podras ver distancias ni registrar la ubicacion de tus golpes.'
	String get no_gps_warning => 'Sin GPS no podras ver distancias ni registrar la ubicacion de tus golpes.';
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

	/// es: 'O inicia sesion con'
	String get or_sign_in_with => 'O inicia sesion con';

	/// es: 'Iniciar sesion con Google'
	String get sign_in_with_google => 'Iniciar sesion con Google';

	late final TranslationsAuthSigninEs signin = TranslationsAuthSigninEs.internal(_root);
	late final TranslationsAuthSignupEs signup = TranslationsAuthSignupEs.internal(_root);
	late final TranslationsAuthEmailVerificationEs email_verification = TranslationsAuthEmailVerificationEs.internal(_root);
	late final TranslationsAuthRecoverPasswordEs recover_password = TranslationsAuthRecoverPasswordEs.internal(_root);
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

	/// es: 'Reintentar'
	String get retry => 'Reintentar';
}

// Path: bottom_menu
class TranslationsBottomMenuEs {
	TranslationsBottomMenuEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Inicio'
	String get home => 'Inicio';

	/// es: 'Rondas'
	String get rounds => 'Rondas';

	/// es: 'Ajustes'
	String get settings => 'Ajustes';
}

// Path: rounds
class TranslationsRoundsEs {
	TranslationsRoundsEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Mis rondas'
	String get title => 'Mis rondas';

	/// es: 'Aun no tienes rondas registradas'
	String get empty => 'Aun no tienes rondas registradas';

	/// es: 'Inicia una ronda para ver tu historial aqui'
	String get empty_hint => 'Inicia una ronda para ver tu historial aqui';

	/// es: 'Error al cargar las rondas'
	String get error_loading => 'Error al cargar las rondas';

	/// es: 'golpes'
	String get total_strokes => 'golpes';

	/// es: 'hoyos'
	String get holes_played => 'hoyos';

	/// es: 'duracion'
	String get duration => 'duracion';

	/// es: 'Detalle de ronda'
	String get detail_title => 'Detalle de ronda';

	/// es: 'Resultado'
	String get result => 'Resultado';
}

// Path: settings
class TranslationsSettingsEs {
	TranslationsSettingsEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Ajustes'
	String get title => 'Ajustes';

	late final TranslationsSettingsLocationPermissionEs location_permission = TranslationsSettingsLocationPermissionEs.internal(_root);
}

// Path: select_course
class TranslationsSelectCourseEs {
	TranslationsSelectCourseEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Selecciona el campo'
	String get title => 'Selecciona el campo';

	/// es: 'Buscando campo cercano...'
	String get loading => 'Buscando campo cercano...';

	/// es: 'Campo mas cercano'
	String get closest_course => 'Campo mas cercano';

	/// es: 'Seleccionar otro campo'
	String get select_other_course => 'Seleccionar otro campo';

	/// es: 'Tees de salida'
	String get tees_section => 'Tees de salida';

	/// es: 'Ajustes'
	String get settings_section => 'Ajustes';

	/// es: 'Seguimiento GPS'
	String get gps_tracking => 'Seguimiento GPS';

	/// es: 'Mide distancias al green y obstaculos'
	String get gps_tracking_description => 'Mide distancias al green y obstaculos';

	/// es: 'No encontramos campos cerca'
	String get no_course_found => 'No encontramos campos cerca';

	/// es: 'Asegurate de estar en un campo de golf o intenta de nuevo'
	String get no_course_found_hint => 'Asegurate de estar en un campo de golf o intenta de nuevo';

	/// es: 'Error al buscar campo'
	String get error_title => 'Error al buscar campo';

	/// es: 'Reintentar'
	String get retry => 'Reintentar';
}

// Path: browse_courses
class TranslationsBrowseCoursesEs {
	TranslationsBrowseCoursesEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Seleccionar otro campo'
	String get title => 'Seleccionar otro campo';

	/// es: 'Cercanos'
	String get tab_nearby => 'Cercanos';

	/// es: 'Recientes'
	String get tab_recent => 'Recientes';

	/// es: 'Buscar'
	String get tab_search => 'Buscar';

	/// es: 'Ciudad o nombre del campo'
	String get search_placeholder => 'Ciudad o nombre del campo';

	/// es: 'Escribe al menos 3 caracteres'
	String get search_min_chars => 'Escribe al menos 3 caracteres';

	/// es: 'No se encontraron campos'
	String get no_results => 'No se encontraron campos';

	/// es: 'No hay campos cercanos'
	String get empty_nearby => 'No hay campos cercanos';

	/// es: 'No tienes campos recientes'
	String get empty_recent => 'No tienes campos recientes';

	/// es: 'Los campos donde juegues apareceran aqui'
	String get empty_recent_hint => 'Los campos donde juegues apareceran aqui';

	/// es: 'Inicia sesion para ver tus campos recientes'
	String get login_required => 'Inicia sesion para ver tus campos recientes';

	/// es: 'Iniciar sesion'
	String get login_action => 'Iniciar sesion';

	/// es: 'Error al cargar campos'
	String get error_loading => 'Error al cargar campos';

	/// es: 'Reintentar'
	String get retry => 'Reintentar';
}

// Path: round_in_progress
class TranslationsRoundInProgressEs {
	TranslationsRoundInProgressEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Ronda en curso'
	String get title => 'Ronda en curso';

	/// es: 'Golpes'
	String get strokes => 'Golpes';

	/// es: 'vs Par'
	String get vs_par => 'vs Par';

	/// es: 'Hoyos'
	String get holes => 'Hoyos';

	/// es: 'Hoyo'
	String get hole => 'Hoyo';

	/// es: 'Yds'
	String get yards => 'Yds';

	/// es: 'Par'
	String get par => 'Par';

	/// es: 'Score'
	String get score => 'Score';

	/// es: 'OUT'
	String get out => 'OUT';

	/// es: 'IN'
	String get kIn => 'IN';

	/// es: 'TOT'
	String get total => 'TOT';

	/// es: 'Putts'
	String get putts => 'Putts';

	/// es: 'Penaltis'
	String get penalties => 'Penaltis';

	/// es: 'Guardar'
	String get save => 'Guardar';

	/// es: 'Finalizar Ronda'
	String get finish_round => 'Finalizar Ronda';

	/// es: 'Salir de la ronda?'
	String get exit_title => 'Salir de la ronda?';

	/// es: 'Tu progreso se guardara y podras continuar mas tarde.'
	String get exit_message => 'Tu progreso se guardara y podras continuar mas tarde.';

	/// es: 'Salir'
	String get exit_action => 'Salir';

	/// es: 'Finalizar ronda?'
	String get finish_title => 'Finalizar ronda?';

	/// es: 'Una vez finalizada, no podras editar los resultados.'
	String get finish_message => 'Una vez finalizada, no podras editar los resultados.';

	/// es: 'Finalizar'
	String get finish_action => 'Finalizar';

	/// es: 'Notas (opcional)'
	String get notes_label => 'Notas (opcional)';

	/// es: 'Agrega notas sobre la ronda...'
	String get notes_hint => 'Agrega notas sobre la ronda...';

	/// es: 'GPS activado'
	String get gps_enabled => 'GPS activado';

	/// es: 'GPS desactivado'
	String get gps_disabled => 'GPS desactivado';

	/// es: 'Error al guardar'
	String get error_saving => 'Error al guardar';

	/// es: 'Reintentar'
	String get retry => 'Reintentar';

	/// es: 'Volver'
	String get back => 'Volver';
}

// Path: round_summary
class TranslationsRoundSummaryEs {
	TranslationsRoundSummaryEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Ronda finalizada!'
	String get title => 'Ronda finalizada!';

	/// es: 'Aqui esta tu resumen'
	String get subtitle => 'Aqui esta tu resumen';

	/// es: 'golpes totales'
	String get total_strokes => 'golpes totales';

	/// es: 'Putts'
	String get putts => 'Putts';

	/// es: 'Duracion'
	String get duration => 'Duracion';

	/// es: 'Fairways'
	String get fairways => 'Fairways';

	/// es: 'GIR'
	String get gir => 'GIR';

	/// es: 'Volver al inicio'
	String get back_home => 'Volver al inicio';

	/// es: 'Ver detalles'
	String get view_details => 'Ver detalles';
}

// Path: score_names
class TranslationsScoreNamesEs {
	TranslationsScoreNamesEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Hole in One!'
	String get hole_in_one => 'Hole in One!';

	/// es: 'Albatros'
	String get albatross => 'Albatros';

	/// es: 'Eagle'
	String get eagle => 'Eagle';

	/// es: 'Birdie'
	String get birdie => 'Birdie';

	/// es: 'Par'
	String get par => 'Par';

	/// es: 'Bogey'
	String get bogey => 'Bogey';

	/// es: 'Doble Bogey'
	String get double_bogey => 'Doble Bogey';

	/// es: 'Triple Bogey'
	String get triple_bogey => 'Triple Bogey';
}

// Path: active_round
class TranslationsActiveRoundEs {
	TranslationsActiveRoundEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Tienes una ronda en curso'
	String get title => 'Tienes una ronda en curso';

	/// es: 'Dejaste una ronda sin terminar en $courseName.'
	String message({required Object courseName}) => 'Dejaste una ronda sin terminar en ${courseName}.';

	/// es: '$count de 18 hoyos jugados'
	String holes_played({required Object count}) => '${count} de 18 hoyos jugados';

	/// es: 'Continuar ronda'
	String get resume => 'Continuar ronda';

	/// es: 'Finalizar ronda'
	String get finish => 'Finalizar ronda';
}

// Path: feedback
class TranslationsFeedbackEs {
	TranslationsFeedbackEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Enviar comentarios'
	String get title => 'Enviar comentarios';

	/// es: 'Tus comentarios nos ayudan a mejorar TalkCaddy'
	String get subtitle => 'Tus comentarios nos ayudan a mejorar TalkCaddy';

	/// es: 'Categoria'
	String get category_label => 'Categoria';

	/// es: 'General'
	String get category_general => 'General';

	/// es: 'Soporte'
	String get category_support => 'Soporte';

	/// es: 'Comentarios'
	String get category_feedback => 'Comentarios';

	/// es: 'Reportar error'
	String get category_bug_report => 'Reportar error';

	/// es: 'Solicitar funcion'
	String get category_feature_request => 'Solicitar funcion';

	/// es: 'Asunto'
	String get subject_label => 'Asunto';

	/// es: 'Describe brevemente tu mensaje'
	String get subject_hint => 'Describe brevemente tu mensaje';

	/// es: 'El asunto es requerido'
	String get subject_required => 'El asunto es requerido';

	/// es: 'Mensaje'
	String get message_label => 'Mensaje';

	/// es: 'Cuentanos mas detalles...'
	String get message_hint => 'Cuentanos mas detalles...';

	/// es: 'El mensaje es requerido'
	String get message_required => 'El mensaje es requerido';

	/// es: 'Enviar'
	String get submit => 'Enviar';

	/// es: 'Error'
	String get error_title => 'Error';

	/// es: 'No se pudo enviar tu mensaje. Intenta de nuevo.'
	String get error_message => 'No se pudo enviar tu mensaje. Intenta de nuevo.';

	/// es: 'Mensaje enviado'
	String get success_title => 'Mensaje enviado';

	/// es: 'Gracias por tus comentarios. Te responderemos pronto.'
	String get success_message => 'Gracias por tus comentarios. Te responderemos pronto.';

	/// es: 'Volver'
	String get back => 'Volver';
}

// Path: gps
class TranslationsGpsEs {
	TranslationsGpsEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsGpsTrackingEs tracking = TranslationsGpsTrackingEs.internal(_root);
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

	/// es: 'Continuar'
	String get action => 'Continuar';
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

	/// es: 'Error'
	String get error_title => 'Error';

	/// es: 'Este correo ya existe o es invalido'
	String get error_message => 'Este correo ya existe o es invalido';
}

// Path: auth.email_verification
class TranslationsAuthEmailVerificationEs {
	TranslationsAuthEmailVerificationEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Verificar correo'
	String get title => 'Verificar correo';

	/// es: 'Codigo de verificacion'
	String get code_sent_title => 'Codigo de verificacion';

	/// es: 'Hemos enviado un codigo de 6 digitos a {email}'
	String get subtitle => 'Hemos enviado un codigo de 6 digitos a {email}';

	/// es: 'Verificar'
	String get verify_button => 'Verificar';

	/// es: 'Reenviar codigo'
	String get resend_code => 'Reenviar codigo';

	/// es: 'Correo verificado'
	String get success => 'Correo verificado';

	/// es: 'Codigo invalido o expirado'
	String get error_invalid => 'Codigo invalido o expirado';
}

// Path: auth.recover_password
class TranslationsAuthRecoverPasswordEs {
	TranslationsAuthRecoverPasswordEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Recuperar contrasena'
	String get title => 'Recuperar contrasena';

	/// es: 'Olvidaste tu contrasena?'
	String get email_title => 'Olvidaste tu contrasena?';

	/// es: 'Ingresa tu correo y te enviaremos un codigo de verificacion'
	String get email_subtitle => 'Ingresa tu correo y te enviaremos un codigo de verificacion';

	/// es: 'Correo electronico'
	String get email_label => 'Correo electronico';

	/// es: 'Enviar codigo'
	String get send_code_button => 'Enviar codigo';

	/// es: 'Ingresa el codigo'
	String get code_title => 'Ingresa el codigo';

	/// es: 'Enviamos un codigo de 6 digitos a {email}'
	String get code_subtitle => 'Enviamos un codigo de 6 digitos a {email}';

	/// es: 'Nueva contrasena'
	String get new_password_label => 'Nueva contrasena';

	/// es: 'Confirmar contrasena'
	String get confirm_password_label => 'Confirmar contrasena';

	/// es: 'La contrasena es requerida'
	String get password_required => 'La contrasena es requerida';

	/// es: 'La contrasena debe tener al menos 8 caracteres'
	String get password_min_length => 'La contrasena debe tener al menos 8 caracteres';

	/// es: 'Las contrasenas no coinciden'
	String get passwords_not_match => 'Las contrasenas no coinciden';

	/// es: 'Cambiar contrasena'
	String get reset_button => 'Cambiar contrasena';

	/// es: 'Volver a ingresar correo'
	String get back_to_email => 'Volver a ingresar correo';

	/// es: 'Contrasena cambiada'
	String get success_title => 'Contrasena cambiada';

	/// es: 'Tu contrasena ha sido actualizada. Inicia sesion con tu nueva contrasena.'
	String get success_subtitle => 'Tu contrasena ha sido actualizada. Inicia sesion con tu nueva contrasena.';

	/// es: 'Ir a iniciar sesion'
	String get back_to_signin => 'Ir a iniciar sesion';
}

// Path: settings.location_permission
class TranslationsSettingsLocationPermissionEs {
	TranslationsSettingsLocationPermissionEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Permiso de ubicacion'
	String get title => 'Permiso de ubicacion';

	/// es: 'Permitido'
	String get granted => 'Permitido';

	/// es: 'Denegado'
	String get denied => 'Denegado';

	/// es: 'Abrir ajustes'
	String get open_settings => 'Abrir ajustes';
}

// Path: gps.tracking
class TranslationsGpsTrackingEs {
	TranslationsGpsTrackingEs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// es: 'Ronda en progreso'
	String get notification_title => 'Ronda en progreso';

	/// es: 'TalkCaddy esta rastreando tu recorrido'
	String get notification_text => 'TalkCaddy esta rastreando tu recorrido';

	/// es: 'Ubicacion en segundo plano'
	String get permission_title => 'Ubicacion en segundo plano';

	/// es: 'Para rastrear tu recorrido mientras usas otras apps, TalkCaddy necesita acceso a tu ubicacion en segundo plano.'
	String get permission_message => 'Para rastrear tu recorrido mientras usas otras apps, TalkCaddy necesita acceso a tu ubicacion en segundo plano.';

	/// es: 'Sin acceso a ubicacion en segundo plano, el GPS solo funcionara mientras la app este abierta.'
	String get permission_denied => 'Sin acceso a ubicacion en segundo plano, el GPS solo funcionara mientras la app este abierta.';

	/// es: 'Rastreo GPS iniciado'
	String get started => 'Rastreo GPS iniciado';

	/// es: 'Rastreo GPS detenido'
	String get stopped => 'Rastreo GPS detenido';

	/// es: 'Error de GPS'
	String get error => 'Error de GPS';
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
			'home.title_ready' => 'esta listo',
			'home.start_round' => 'Iniciar ronda',
			'home.gps_hint' => 'Activa el GPS y empieza a hablar con tu caddie',
			'home.say_things_like' => 'Di cosas como:',
			'home.example_1' => '"Salida con driver"',
			'home.example_2' => '"Dos putts"',
			'home.example_3' => '"Hecho bogey"',
			'home.location_required_title' => 'Ubicacion requerida',
			'home.location_required_message' => 'TalkCaddy necesita acceso a tu ubicacion para calcular distancias y registrar tus golpes durante la ronda.',
			'home.location_required_action' => 'Abrir ajustes',
			'home.play_without_gps' => 'Jugar sin GPS',
			'home.no_gps_warning' => 'Sin GPS no podras ver distancias ni registrar la ubicacion de tus golpes.',
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
			'onboarding.complete.action' => 'Continuar',
			'onboarding.loading.title' => 'Preparando tu experiencia',
			'onboarding.loading.subtitle' => 'Espera unos segundos',
			'auth.or_sign_in_with' => 'O inicia sesion con',
			'auth.sign_in_with_google' => 'Iniciar sesion con Google',
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
			'auth.signup.error_title' => 'Error',
			'auth.signup.error_message' => 'Este correo ya existe o es invalido',
			'auth.email_verification.title' => 'Verificar correo',
			'auth.email_verification.code_sent_title' => 'Codigo de verificacion',
			'auth.email_verification.subtitle' => 'Hemos enviado un codigo de 6 digitos a {email}',
			'auth.email_verification.verify_button' => 'Verificar',
			'auth.email_verification.resend_code' => 'Reenviar codigo',
			'auth.email_verification.success' => 'Correo verificado',
			'auth.email_verification.error_invalid' => 'Codigo invalido o expirado',
			'auth.recover_password.title' => 'Recuperar contrasena',
			'auth.recover_password.email_title' => 'Olvidaste tu contrasena?',
			'auth.recover_password.email_subtitle' => 'Ingresa tu correo y te enviaremos un codigo de verificacion',
			'auth.recover_password.email_label' => 'Correo electronico',
			'auth.recover_password.send_code_button' => 'Enviar codigo',
			'auth.recover_password.code_title' => 'Ingresa el codigo',
			'auth.recover_password.code_subtitle' => 'Enviamos un codigo de 6 digitos a {email}',
			'auth.recover_password.new_password_label' => 'Nueva contrasena',
			'auth.recover_password.confirm_password_label' => 'Confirmar contrasena',
			'auth.recover_password.password_required' => 'La contrasena es requerida',
			'auth.recover_password.password_min_length' => 'La contrasena debe tener al menos 8 caracteres',
			'auth.recover_password.passwords_not_match' => 'Las contrasenas no coinciden',
			'auth.recover_password.reset_button' => 'Cambiar contrasena',
			'auth.recover_password.back_to_email' => 'Volver a ingresar correo',
			'auth.recover_password.success_title' => 'Contrasena cambiada',
			'auth.recover_password.success_subtitle' => 'Tu contrasena ha sido actualizada. Inicia sesion con tu nueva contrasena.',
			'auth.recover_password.back_to_signin' => 'Ir a iniciar sesion',
			'common.kContinue' => 'Continuar',
			'common.cancel' => 'Cancelar',
			'common.skip' => 'Omitir',
			'common.error' => 'Error',
			'common.success' => 'Exito',
			'common.loading' => 'Cargando...',
			'common.or' => 'o',
			'common.retry' => 'Reintentar',
			'bottom_menu.home' => 'Inicio',
			'bottom_menu.rounds' => 'Rondas',
			'bottom_menu.settings' => 'Ajustes',
			'rounds.title' => 'Mis rondas',
			'rounds.empty' => 'Aun no tienes rondas registradas',
			'rounds.empty_hint' => 'Inicia una ronda para ver tu historial aqui',
			'rounds.error_loading' => 'Error al cargar las rondas',
			'rounds.total_strokes' => 'golpes',
			'rounds.holes_played' => 'hoyos',
			'rounds.duration' => 'duracion',
			'rounds.detail_title' => 'Detalle de ronda',
			'rounds.result' => 'Resultado',
			'settings.title' => 'Ajustes',
			'settings.location_permission.title' => 'Permiso de ubicacion',
			'settings.location_permission.granted' => 'Permitido',
			'settings.location_permission.denied' => 'Denegado',
			'settings.location_permission.open_settings' => 'Abrir ajustes',
			'select_course.title' => 'Selecciona el campo',
			'select_course.loading' => 'Buscando campo cercano...',
			'select_course.closest_course' => 'Campo mas cercano',
			'select_course.select_other_course' => 'Seleccionar otro campo',
			'select_course.tees_section' => 'Tees de salida',
			'select_course.settings_section' => 'Ajustes',
			'select_course.gps_tracking' => 'Seguimiento GPS',
			'select_course.gps_tracking_description' => 'Mide distancias al green y obstaculos',
			'select_course.no_course_found' => 'No encontramos campos cerca',
			'select_course.no_course_found_hint' => 'Asegurate de estar en un campo de golf o intenta de nuevo',
			'select_course.error_title' => 'Error al buscar campo',
			'select_course.retry' => 'Reintentar',
			'browse_courses.title' => 'Seleccionar otro campo',
			'browse_courses.tab_nearby' => 'Cercanos',
			'browse_courses.tab_recent' => 'Recientes',
			'browse_courses.tab_search' => 'Buscar',
			'browse_courses.search_placeholder' => 'Ciudad o nombre del campo',
			'browse_courses.search_min_chars' => 'Escribe al menos 3 caracteres',
			'browse_courses.no_results' => 'No se encontraron campos',
			'browse_courses.empty_nearby' => 'No hay campos cercanos',
			'browse_courses.empty_recent' => 'No tienes campos recientes',
			'browse_courses.empty_recent_hint' => 'Los campos donde juegues apareceran aqui',
			'browse_courses.login_required' => 'Inicia sesion para ver tus campos recientes',
			'browse_courses.login_action' => 'Iniciar sesion',
			'browse_courses.error_loading' => 'Error al cargar campos',
			'browse_courses.retry' => 'Reintentar',
			'round_in_progress.title' => 'Ronda en curso',
			'round_in_progress.strokes' => 'Golpes',
			'round_in_progress.vs_par' => 'vs Par',
			'round_in_progress.holes' => 'Hoyos',
			'round_in_progress.hole' => 'Hoyo',
			'round_in_progress.yards' => 'Yds',
			'round_in_progress.par' => 'Par',
			'round_in_progress.score' => 'Score',
			'round_in_progress.out' => 'OUT',
			'round_in_progress.kIn' => 'IN',
			'round_in_progress.total' => 'TOT',
			'round_in_progress.putts' => 'Putts',
			'round_in_progress.penalties' => 'Penaltis',
			'round_in_progress.save' => 'Guardar',
			'round_in_progress.finish_round' => 'Finalizar Ronda',
			'round_in_progress.exit_title' => 'Salir de la ronda?',
			'round_in_progress.exit_message' => 'Tu progreso se guardara y podras continuar mas tarde.',
			'round_in_progress.exit_action' => 'Salir',
			'round_in_progress.finish_title' => 'Finalizar ronda?',
			'round_in_progress.finish_message' => 'Una vez finalizada, no podras editar los resultados.',
			'round_in_progress.finish_action' => 'Finalizar',
			'round_in_progress.notes_label' => 'Notas (opcional)',
			'round_in_progress.notes_hint' => 'Agrega notas sobre la ronda...',
			'round_in_progress.gps_enabled' => 'GPS activado',
			'round_in_progress.gps_disabled' => 'GPS desactivado',
			'round_in_progress.error_saving' => 'Error al guardar',
			'round_in_progress.retry' => 'Reintentar',
			'round_in_progress.back' => 'Volver',
			'round_summary.title' => 'Ronda finalizada!',
			'round_summary.subtitle' => 'Aqui esta tu resumen',
			'round_summary.total_strokes' => 'golpes totales',
			'round_summary.putts' => 'Putts',
			'round_summary.duration' => 'Duracion',
			'round_summary.fairways' => 'Fairways',
			'round_summary.gir' => 'GIR',
			'round_summary.back_home' => 'Volver al inicio',
			'round_summary.view_details' => 'Ver detalles',
			'score_names.hole_in_one' => 'Hole in One!',
			'score_names.albatross' => 'Albatros',
			'score_names.eagle' => 'Eagle',
			'score_names.birdie' => 'Birdie',
			'score_names.par' => 'Par',
			'score_names.bogey' => 'Bogey',
			'score_names.double_bogey' => 'Doble Bogey',
			'score_names.triple_bogey' => 'Triple Bogey',
			'active_round.title' => 'Tienes una ronda en curso',
			'active_round.message' => ({required Object courseName}) => 'Dejaste una ronda sin terminar en ${courseName}.',
			'active_round.holes_played' => ({required Object count}) => '${count} de 18 hoyos jugados',
			'active_round.resume' => 'Continuar ronda',
			'active_round.finish' => 'Finalizar ronda',
			'feedback.title' => 'Enviar comentarios',
			'feedback.subtitle' => 'Tus comentarios nos ayudan a mejorar TalkCaddy',
			'feedback.category_label' => 'Categoria',
			'feedback.category_general' => 'General',
			'feedback.category_support' => 'Soporte',
			'feedback.category_feedback' => 'Comentarios',
			'feedback.category_bug_report' => 'Reportar error',
			'feedback.category_feature_request' => 'Solicitar funcion',
			'feedback.subject_label' => 'Asunto',
			'feedback.subject_hint' => 'Describe brevemente tu mensaje',
			'feedback.subject_required' => 'El asunto es requerido',
			'feedback.message_label' => 'Mensaje',
			'feedback.message_hint' => 'Cuentanos mas detalles...',
			'feedback.message_required' => 'El mensaje es requerido',
			'feedback.submit' => 'Enviar',
			'feedback.error_title' => 'Error',
			'feedback.error_message' => 'No se pudo enviar tu mensaje. Intenta de nuevo.',
			'feedback.success_title' => 'Mensaje enviado',
			'feedback.success_message' => 'Gracias por tus comentarios. Te responderemos pronto.',
			'feedback.back' => 'Volver',
			'gps.tracking.notification_title' => 'Ronda en progreso',
			'gps.tracking.notification_text' => 'TalkCaddy esta rastreando tu recorrido',
			'gps.tracking.permission_title' => 'Ubicacion en segundo plano',
			'gps.tracking.permission_message' => 'Para rastrear tu recorrido mientras usas otras apps, TalkCaddy necesita acceso a tu ubicacion en segundo plano.',
			'gps.tracking.permission_denied' => 'Sin acceso a ubicacion en segundo plano, el GPS solo funcionara mientras la app este abierta.',
			'gps.tracking.started' => 'Rastreo GPS iniciado',
			'gps.tracking.stopped' => 'Rastreo GPS detenido',
			'gps.tracking.error' => 'Error de GPS',
			_ => null,
		};
	}
}
