// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recover_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecoverState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecoverState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RecoverState()';
}


}

/// @nodoc
class $RecoverStateCopyWith<$Res>  {
$RecoverStateCopyWith(RecoverState _, $Res Function(RecoverState) __);
}


/// Adds pattern-matching-related methods to [RecoverState].
extension RecoverStatePatterns on RecoverState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( RecoverStateData value)?  $default,{TResult Function( RecoverStateSending value)?  sending,TResult Function( RecoverStateCodeEntry value)?  codeEntry,TResult Function( RecoverStateSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RecoverStateData() when $default != null:
return $default(_that);case RecoverStateSending() when sending != null:
return sending(_that);case RecoverStateCodeEntry() when codeEntry != null:
return codeEntry(_that);case RecoverStateSuccess() when success != null:
return success(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( RecoverStateData value)  $default,{required TResult Function( RecoverStateSending value)  sending,required TResult Function( RecoverStateCodeEntry value)  codeEntry,required TResult Function( RecoverStateSuccess value)  success,}){
final _that = this;
switch (_that) {
case RecoverStateData():
return $default(_that);case RecoverStateSending():
return sending(_that);case RecoverStateCodeEntry():
return codeEntry(_that);case RecoverStateSuccess():
return success(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( RecoverStateData value)?  $default,{TResult? Function( RecoverStateSending value)?  sending,TResult? Function( RecoverStateCodeEntry value)?  codeEntry,TResult? Function( RecoverStateSuccess value)?  success,}){
final _that = this;
switch (_that) {
case RecoverStateData() when $default != null:
return $default(_that);case RecoverStateSending() when sending != null:
return sending(_that);case RecoverStateCodeEntry() when codeEntry != null:
return codeEntry(_that);case RecoverStateSuccess() when success != null:
return success(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Email email,  String? error)?  $default,{TResult Function( Email email)?  sending,TResult Function( Email email,  String code,  String password,  String passwordConfirmation,  bool isLoading,  String? error)?  codeEntry,TResult Function()?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RecoverStateData() when $default != null:
return $default(_that.email,_that.error);case RecoverStateSending() when sending != null:
return sending(_that.email);case RecoverStateCodeEntry() when codeEntry != null:
return codeEntry(_that.email,_that.code,_that.password,_that.passwordConfirmation,_that.isLoading,_that.error);case RecoverStateSuccess() when success != null:
return success();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Email email,  String? error)  $default,{required TResult Function( Email email)  sending,required TResult Function( Email email,  String code,  String password,  String passwordConfirmation,  bool isLoading,  String? error)  codeEntry,required TResult Function()  success,}) {final _that = this;
switch (_that) {
case RecoverStateData():
return $default(_that.email,_that.error);case RecoverStateSending():
return sending(_that.email);case RecoverStateCodeEntry():
return codeEntry(_that.email,_that.code,_that.password,_that.passwordConfirmation,_that.isLoading,_that.error);case RecoverStateSuccess():
return success();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Email email,  String? error)?  $default,{TResult? Function( Email email)?  sending,TResult? Function( Email email,  String code,  String password,  String passwordConfirmation,  bool isLoading,  String? error)?  codeEntry,TResult? Function()?  success,}) {final _that = this;
switch (_that) {
case RecoverStateData() when $default != null:
return $default(_that.email,_that.error);case RecoverStateSending() when sending != null:
return sending(_that.email);case RecoverStateCodeEntry() when codeEntry != null:
return codeEntry(_that.email,_that.code,_that.password,_that.passwordConfirmation,_that.isLoading,_that.error);case RecoverStateSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class RecoverStateData extends RecoverState {
  const RecoverStateData({required this.email, this.error}): super._();
  

 final  Email email;
 final  String? error;

/// Create a copy of RecoverState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecoverStateDataCopyWith<RecoverStateData> get copyWith => _$RecoverStateDataCopyWithImpl<RecoverStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecoverStateData&&(identical(other.email, email) || other.email == email)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,email,error);

@override
String toString() {
  return 'RecoverState(email: $email, error: $error)';
}


}

/// @nodoc
abstract mixin class $RecoverStateDataCopyWith<$Res> implements $RecoverStateCopyWith<$Res> {
  factory $RecoverStateDataCopyWith(RecoverStateData value, $Res Function(RecoverStateData) _then) = _$RecoverStateDataCopyWithImpl;
@useResult
$Res call({
 Email email, String? error
});




}
/// @nodoc
class _$RecoverStateDataCopyWithImpl<$Res>
    implements $RecoverStateDataCopyWith<$Res> {
  _$RecoverStateDataCopyWithImpl(this._self, this._then);

  final RecoverStateData _self;
  final $Res Function(RecoverStateData) _then;

/// Create a copy of RecoverState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? error = freezed,}) {
  return _then(RecoverStateData(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Email,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class RecoverStateSending extends RecoverState {
  const RecoverStateSending({required this.email}): super._();
  

 final  Email email;

/// Create a copy of RecoverState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecoverStateSendingCopyWith<RecoverStateSending> get copyWith => _$RecoverStateSendingCopyWithImpl<RecoverStateSending>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecoverStateSending&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'RecoverState.sending(email: $email)';
}


}

/// @nodoc
abstract mixin class $RecoverStateSendingCopyWith<$Res> implements $RecoverStateCopyWith<$Res> {
  factory $RecoverStateSendingCopyWith(RecoverStateSending value, $Res Function(RecoverStateSending) _then) = _$RecoverStateSendingCopyWithImpl;
@useResult
$Res call({
 Email email
});




}
/// @nodoc
class _$RecoverStateSendingCopyWithImpl<$Res>
    implements $RecoverStateSendingCopyWith<$Res> {
  _$RecoverStateSendingCopyWithImpl(this._self, this._then);

  final RecoverStateSending _self;
  final $Res Function(RecoverStateSending) _then;

/// Create a copy of RecoverState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(RecoverStateSending(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Email,
  ));
}


}

/// @nodoc


class RecoverStateCodeEntry extends RecoverState {
  const RecoverStateCodeEntry({required this.email, this.code = '', this.password = '', this.passwordConfirmation = '', this.isLoading = false, this.error}): super._();
  

 final  Email email;
@JsonKey() final  String code;
@JsonKey() final  String password;
@JsonKey() final  String passwordConfirmation;
@JsonKey() final  bool isLoading;
 final  String? error;

/// Create a copy of RecoverState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecoverStateCodeEntryCopyWith<RecoverStateCodeEntry> get copyWith => _$RecoverStateCodeEntryCopyWithImpl<RecoverStateCodeEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecoverStateCodeEntry&&(identical(other.email, email) || other.email == email)&&(identical(other.code, code) || other.code == code)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirmation, passwordConfirmation) || other.passwordConfirmation == passwordConfirmation)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,email,code,password,passwordConfirmation,isLoading,error);

@override
String toString() {
  return 'RecoverState.codeEntry(email: $email, code: $code, password: $password, passwordConfirmation: $passwordConfirmation, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $RecoverStateCodeEntryCopyWith<$Res> implements $RecoverStateCopyWith<$Res> {
  factory $RecoverStateCodeEntryCopyWith(RecoverStateCodeEntry value, $Res Function(RecoverStateCodeEntry) _then) = _$RecoverStateCodeEntryCopyWithImpl;
@useResult
$Res call({
 Email email, String code, String password, String passwordConfirmation, bool isLoading, String? error
});




}
/// @nodoc
class _$RecoverStateCodeEntryCopyWithImpl<$Res>
    implements $RecoverStateCodeEntryCopyWith<$Res> {
  _$RecoverStateCodeEntryCopyWithImpl(this._self, this._then);

  final RecoverStateCodeEntry _self;
  final $Res Function(RecoverStateCodeEntry) _then;

/// Create a copy of RecoverState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? code = null,Object? password = null,Object? passwordConfirmation = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(RecoverStateCodeEntry(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Email,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirmation: null == passwordConfirmation ? _self.passwordConfirmation : passwordConfirmation // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class RecoverStateSuccess extends RecoverState {
  const RecoverStateSuccess(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecoverStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RecoverState.success()';
}


}




// dart format on
