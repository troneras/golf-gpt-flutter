// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeedbackState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedbackState()';
}


}

/// @nodoc
class $FeedbackStateCopyWith<$Res>  {
$FeedbackStateCopyWith(FeedbackState _, $Res Function(FeedbackState) __);
}


/// Adds pattern-matching-related methods to [FeedbackState].
extension FeedbackStatePatterns on FeedbackState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( FeedbackStateData value)?  $default,{TResult Function( FeedbackStateSending value)?  sending,TResult Function( FeedbackStateSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FeedbackStateData() when $default != null:
return $default(_that);case FeedbackStateSending() when sending != null:
return sending(_that);case FeedbackStateSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( FeedbackStateData value)  $default,{required TResult Function( FeedbackStateSending value)  sending,required TResult Function( FeedbackStateSuccess value)  success,}){
final _that = this;
switch (_that) {
case FeedbackStateData():
return $default(_that);case FeedbackStateSending():
return sending(_that);case FeedbackStateSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( FeedbackStateData value)?  $default,{TResult? Function( FeedbackStateSending value)?  sending,TResult? Function( FeedbackStateSuccess value)?  success,}){
final _that = this;
switch (_that) {
case FeedbackStateData() when $default != null:
return $default(_that);case FeedbackStateSending() when sending != null:
return sending(_that);case FeedbackStateSuccess() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String subject,  String message,  FeedbackCategory category,  String? error)?  $default,{TResult Function( String subject,  String message,  FeedbackCategory category)?  sending,TResult Function()?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FeedbackStateData() when $default != null:
return $default(_that.subject,_that.message,_that.category,_that.error);case FeedbackStateSending() when sending != null:
return sending(_that.subject,_that.message,_that.category);case FeedbackStateSuccess() when success != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String subject,  String message,  FeedbackCategory category,  String? error)  $default,{required TResult Function( String subject,  String message,  FeedbackCategory category)  sending,required TResult Function()  success,}) {final _that = this;
switch (_that) {
case FeedbackStateData():
return $default(_that.subject,_that.message,_that.category,_that.error);case FeedbackStateSending():
return sending(_that.subject,_that.message,_that.category);case FeedbackStateSuccess():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String subject,  String message,  FeedbackCategory category,  String? error)?  $default,{TResult? Function( String subject,  String message,  FeedbackCategory category)?  sending,TResult? Function()?  success,}) {final _that = this;
switch (_that) {
case FeedbackStateData() when $default != null:
return $default(_that.subject,_that.message,_that.category,_that.error);case FeedbackStateSending() when sending != null:
return sending(_that.subject,_that.message,_that.category);case FeedbackStateSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class FeedbackStateData extends FeedbackState {
  const FeedbackStateData({required this.subject, required this.message, required this.category, this.error}): super._();
  

 final  String subject;
 final  String message;
 final  FeedbackCategory category;
 final  String? error;

/// Create a copy of FeedbackState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbackStateDataCopyWith<FeedbackStateData> get copyWith => _$FeedbackStateDataCopyWithImpl<FeedbackStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackStateData&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.message, message) || other.message == message)&&(identical(other.category, category) || other.category == category)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,subject,message,category,error);

@override
String toString() {
  return 'FeedbackState(subject: $subject, message: $message, category: $category, error: $error)';
}


}

/// @nodoc
abstract mixin class $FeedbackStateDataCopyWith<$Res> implements $FeedbackStateCopyWith<$Res> {
  factory $FeedbackStateDataCopyWith(FeedbackStateData value, $Res Function(FeedbackStateData) _then) = _$FeedbackStateDataCopyWithImpl;
@useResult
$Res call({
 String subject, String message, FeedbackCategory category, String? error
});




}
/// @nodoc
class _$FeedbackStateDataCopyWithImpl<$Res>
    implements $FeedbackStateDataCopyWith<$Res> {
  _$FeedbackStateDataCopyWithImpl(this._self, this._then);

  final FeedbackStateData _self;
  final $Res Function(FeedbackStateData) _then;

/// Create a copy of FeedbackState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? subject = null,Object? message = null,Object? category = null,Object? error = freezed,}) {
  return _then(FeedbackStateData(
subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as FeedbackCategory,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class FeedbackStateSending extends FeedbackState {
  const FeedbackStateSending({required this.subject, required this.message, required this.category}): super._();
  

 final  String subject;
 final  String message;
 final  FeedbackCategory category;

/// Create a copy of FeedbackState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbackStateSendingCopyWith<FeedbackStateSending> get copyWith => _$FeedbackStateSendingCopyWithImpl<FeedbackStateSending>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackStateSending&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.message, message) || other.message == message)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,subject,message,category);

@override
String toString() {
  return 'FeedbackState.sending(subject: $subject, message: $message, category: $category)';
}


}

/// @nodoc
abstract mixin class $FeedbackStateSendingCopyWith<$Res> implements $FeedbackStateCopyWith<$Res> {
  factory $FeedbackStateSendingCopyWith(FeedbackStateSending value, $Res Function(FeedbackStateSending) _then) = _$FeedbackStateSendingCopyWithImpl;
@useResult
$Res call({
 String subject, String message, FeedbackCategory category
});




}
/// @nodoc
class _$FeedbackStateSendingCopyWithImpl<$Res>
    implements $FeedbackStateSendingCopyWith<$Res> {
  _$FeedbackStateSendingCopyWithImpl(this._self, this._then);

  final FeedbackStateSending _self;
  final $Res Function(FeedbackStateSending) _then;

/// Create a copy of FeedbackState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? subject = null,Object? message = null,Object? category = null,}) {
  return _then(FeedbackStateSending(
subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as FeedbackCategory,
  ));
}


}

/// @nodoc


class FeedbackStateSuccess extends FeedbackState {
  const FeedbackStateSuccess(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedbackState.success()';
}


}




// dart format on
