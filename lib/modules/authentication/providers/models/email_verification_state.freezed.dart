// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_verification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmailVerificationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailVerificationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmailVerificationState()';
}


}

/// @nodoc
class $EmailVerificationStateCopyWith<$Res>  {
$EmailVerificationStateCopyWith(EmailVerificationState _, $Res Function(EmailVerificationState) __);
}


/// Adds pattern-matching-related methods to [EmailVerificationState].
extension EmailVerificationStatePatterns on EmailVerificationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( EmailVerificationStateData value)?  $default,{TResult Function( EmailVerificationVerified value)?  verified,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EmailVerificationStateData() when $default != null:
return $default(_that);case EmailVerificationVerified() when verified != null:
return verified(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( EmailVerificationStateData value)  $default,{required TResult Function( EmailVerificationVerified value)  verified,}){
final _that = this;
switch (_that) {
case EmailVerificationStateData():
return $default(_that);case EmailVerificationVerified():
return verified(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( EmailVerificationStateData value)?  $default,{TResult? Function( EmailVerificationVerified value)?  verified,}){
final _that = this;
switch (_that) {
case EmailVerificationStateData() when $default != null:
return $default(_that);case EmailVerificationVerified() when verified != null:
return verified(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool codeSent,  String email,  String? error)?  $default,{TResult Function()?  verified,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EmailVerificationStateData() when $default != null:
return $default(_that.isLoading,_that.codeSent,_that.email,_that.error);case EmailVerificationVerified() when verified != null:
return verified();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool codeSent,  String email,  String? error)  $default,{required TResult Function()  verified,}) {final _that = this;
switch (_that) {
case EmailVerificationStateData():
return $default(_that.isLoading,_that.codeSent,_that.email,_that.error);case EmailVerificationVerified():
return verified();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool codeSent,  String email,  String? error)?  $default,{TResult? Function()?  verified,}) {final _that = this;
switch (_that) {
case EmailVerificationStateData() when $default != null:
return $default(_that.isLoading,_that.codeSent,_that.email,_that.error);case EmailVerificationVerified() when verified != null:
return verified();case _:
  return null;

}
}

}

/// @nodoc


class EmailVerificationStateData extends EmailVerificationState {
  const EmailVerificationStateData({this.isLoading = false, this.codeSent = false, this.email = '', this.error}): super._();
  

@JsonKey() final  bool isLoading;
@JsonKey() final  bool codeSent;
@JsonKey() final  String email;
 final  String? error;

/// Create a copy of EmailVerificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailVerificationStateDataCopyWith<EmailVerificationStateData> get copyWith => _$EmailVerificationStateDataCopyWithImpl<EmailVerificationStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailVerificationStateData&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.codeSent, codeSent) || other.codeSent == codeSent)&&(identical(other.email, email) || other.email == email)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,codeSent,email,error);

@override
String toString() {
  return 'EmailVerificationState(isLoading: $isLoading, codeSent: $codeSent, email: $email, error: $error)';
}


}

/// @nodoc
abstract mixin class $EmailVerificationStateDataCopyWith<$Res> implements $EmailVerificationStateCopyWith<$Res> {
  factory $EmailVerificationStateDataCopyWith(EmailVerificationStateData value, $Res Function(EmailVerificationStateData) _then) = _$EmailVerificationStateDataCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool codeSent, String email, String? error
});




}
/// @nodoc
class _$EmailVerificationStateDataCopyWithImpl<$Res>
    implements $EmailVerificationStateDataCopyWith<$Res> {
  _$EmailVerificationStateDataCopyWithImpl(this._self, this._then);

  final EmailVerificationStateData _self;
  final $Res Function(EmailVerificationStateData) _then;

/// Create a copy of EmailVerificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? codeSent = null,Object? email = null,Object? error = freezed,}) {
  return _then(EmailVerificationStateData(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,codeSent: null == codeSent ? _self.codeSent : codeSent // ignore: cast_nullable_to_non_nullable
as bool,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class EmailVerificationVerified extends EmailVerificationState {
  const EmailVerificationVerified(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailVerificationVerified);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmailVerificationState.verified()';
}


}




// dart format on
