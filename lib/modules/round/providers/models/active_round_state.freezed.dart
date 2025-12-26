// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_round_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActiveRoundState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveRoundState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveRoundState()';
}


}

/// @nodoc
class $ActiveRoundStateCopyWith<$Res>  {
$ActiveRoundStateCopyWith(ActiveRoundState _, $Res Function(ActiveRoundState) __);
}


/// Adds pattern-matching-related methods to [ActiveRoundState].
extension ActiveRoundStatePatterns on ActiveRoundState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ActiveRoundStateInitial value)?  initial,TResult Function( ActiveRoundStateLoading value)?  loading,TResult Function( ActiveRoundStateActive value)?  active,TResult Function( ActiveRoundStateFinished value)?  finished,TResult Function( ActiveRoundStateDiscarded value)?  discarded,TResult Function( ActiveRoundStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ActiveRoundStateInitial() when initial != null:
return initial(_that);case ActiveRoundStateLoading() when loading != null:
return loading(_that);case ActiveRoundStateActive() when active != null:
return active(_that);case ActiveRoundStateFinished() when finished != null:
return finished(_that);case ActiveRoundStateDiscarded() when discarded != null:
return discarded(_that);case ActiveRoundStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ActiveRoundStateInitial value)  initial,required TResult Function( ActiveRoundStateLoading value)  loading,required TResult Function( ActiveRoundStateActive value)  active,required TResult Function( ActiveRoundStateFinished value)  finished,required TResult Function( ActiveRoundStateDiscarded value)  discarded,required TResult Function( ActiveRoundStateError value)  error,}){
final _that = this;
switch (_that) {
case ActiveRoundStateInitial():
return initial(_that);case ActiveRoundStateLoading():
return loading(_that);case ActiveRoundStateActive():
return active(_that);case ActiveRoundStateFinished():
return finished(_that);case ActiveRoundStateDiscarded():
return discarded(_that);case ActiveRoundStateError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ActiveRoundStateInitial value)?  initial,TResult? Function( ActiveRoundStateLoading value)?  loading,TResult? Function( ActiveRoundStateActive value)?  active,TResult? Function( ActiveRoundStateFinished value)?  finished,TResult? Function( ActiveRoundStateDiscarded value)?  discarded,TResult? Function( ActiveRoundStateError value)?  error,}){
final _that = this;
switch (_that) {
case ActiveRoundStateInitial() when initial != null:
return initial(_that);case ActiveRoundStateLoading() when loading != null:
return loading(_that);case ActiveRoundStateActive() when active != null:
return active(_that);case ActiveRoundStateFinished() when finished != null:
return finished(_that);case ActiveRoundStateDiscarded() when discarded != null:
return discarded(_that);case ActiveRoundStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Round round,  int currentHole,  bool isSaving,  String? savingError)?  active,TResult Function( String roundId,  RoundSummary summary)?  finished,TResult Function( String roundId)?  discarded,TResult Function( String message,  String? roundId)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ActiveRoundStateInitial() when initial != null:
return initial();case ActiveRoundStateLoading() when loading != null:
return loading();case ActiveRoundStateActive() when active != null:
return active(_that.round,_that.currentHole,_that.isSaving,_that.savingError);case ActiveRoundStateFinished() when finished != null:
return finished(_that.roundId,_that.summary);case ActiveRoundStateDiscarded() when discarded != null:
return discarded(_that.roundId);case ActiveRoundStateError() when error != null:
return error(_that.message,_that.roundId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Round round,  int currentHole,  bool isSaving,  String? savingError)  active,required TResult Function( String roundId,  RoundSummary summary)  finished,required TResult Function( String roundId)  discarded,required TResult Function( String message,  String? roundId)  error,}) {final _that = this;
switch (_that) {
case ActiveRoundStateInitial():
return initial();case ActiveRoundStateLoading():
return loading();case ActiveRoundStateActive():
return active(_that.round,_that.currentHole,_that.isSaving,_that.savingError);case ActiveRoundStateFinished():
return finished(_that.roundId,_that.summary);case ActiveRoundStateDiscarded():
return discarded(_that.roundId);case ActiveRoundStateError():
return error(_that.message,_that.roundId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Round round,  int currentHole,  bool isSaving,  String? savingError)?  active,TResult? Function( String roundId,  RoundSummary summary)?  finished,TResult? Function( String roundId)?  discarded,TResult? Function( String message,  String? roundId)?  error,}) {final _that = this;
switch (_that) {
case ActiveRoundStateInitial() when initial != null:
return initial();case ActiveRoundStateLoading() when loading != null:
return loading();case ActiveRoundStateActive() when active != null:
return active(_that.round,_that.currentHole,_that.isSaving,_that.savingError);case ActiveRoundStateFinished() when finished != null:
return finished(_that.roundId,_that.summary);case ActiveRoundStateDiscarded() when discarded != null:
return discarded(_that.roundId);case ActiveRoundStateError() when error != null:
return error(_that.message,_that.roundId);case _:
  return null;

}
}

}

/// @nodoc


class ActiveRoundStateInitial extends ActiveRoundState {
  const ActiveRoundStateInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveRoundStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveRoundState.initial()';
}


}




/// @nodoc


class ActiveRoundStateLoading extends ActiveRoundState {
  const ActiveRoundStateLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveRoundStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveRoundState.loading()';
}


}




/// @nodoc


class ActiveRoundStateActive extends ActiveRoundState {
  const ActiveRoundStateActive({required this.round, required this.currentHole, this.isSaving = false, this.savingError}): super._();
  

 final  Round round;
 final  int currentHole;
@JsonKey() final  bool isSaving;
 final  String? savingError;

/// Create a copy of ActiveRoundState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveRoundStateActiveCopyWith<ActiveRoundStateActive> get copyWith => _$ActiveRoundStateActiveCopyWithImpl<ActiveRoundStateActive>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveRoundStateActive&&(identical(other.round, round) || other.round == round)&&(identical(other.currentHole, currentHole) || other.currentHole == currentHole)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.savingError, savingError) || other.savingError == savingError));
}


@override
int get hashCode => Object.hash(runtimeType,round,currentHole,isSaving,savingError);

@override
String toString() {
  return 'ActiveRoundState.active(round: $round, currentHole: $currentHole, isSaving: $isSaving, savingError: $savingError)';
}


}

/// @nodoc
abstract mixin class $ActiveRoundStateActiveCopyWith<$Res> implements $ActiveRoundStateCopyWith<$Res> {
  factory $ActiveRoundStateActiveCopyWith(ActiveRoundStateActive value, $Res Function(ActiveRoundStateActive) _then) = _$ActiveRoundStateActiveCopyWithImpl;
@useResult
$Res call({
 Round round, int currentHole, bool isSaving, String? savingError
});


$RoundCopyWith<$Res> get round;

}
/// @nodoc
class _$ActiveRoundStateActiveCopyWithImpl<$Res>
    implements $ActiveRoundStateActiveCopyWith<$Res> {
  _$ActiveRoundStateActiveCopyWithImpl(this._self, this._then);

  final ActiveRoundStateActive _self;
  final $Res Function(ActiveRoundStateActive) _then;

/// Create a copy of ActiveRoundState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? round = null,Object? currentHole = null,Object? isSaving = null,Object? savingError = freezed,}) {
  return _then(ActiveRoundStateActive(
round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as Round,currentHole: null == currentHole ? _self.currentHole : currentHole // ignore: cast_nullable_to_non_nullable
as int,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,savingError: freezed == savingError ? _self.savingError : savingError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ActiveRoundState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoundCopyWith<$Res> get round {
  
  return $RoundCopyWith<$Res>(_self.round, (value) {
    return _then(_self.copyWith(round: value));
  });
}
}

/// @nodoc


class ActiveRoundStateFinished extends ActiveRoundState {
  const ActiveRoundStateFinished({required this.roundId, required this.summary}): super._();
  

 final  String roundId;
 final  RoundSummary summary;

/// Create a copy of ActiveRoundState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveRoundStateFinishedCopyWith<ActiveRoundStateFinished> get copyWith => _$ActiveRoundStateFinishedCopyWithImpl<ActiveRoundStateFinished>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveRoundStateFinished&&(identical(other.roundId, roundId) || other.roundId == roundId)&&(identical(other.summary, summary) || other.summary == summary));
}


@override
int get hashCode => Object.hash(runtimeType,roundId,summary);

@override
String toString() {
  return 'ActiveRoundState.finished(roundId: $roundId, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $ActiveRoundStateFinishedCopyWith<$Res> implements $ActiveRoundStateCopyWith<$Res> {
  factory $ActiveRoundStateFinishedCopyWith(ActiveRoundStateFinished value, $Res Function(ActiveRoundStateFinished) _then) = _$ActiveRoundStateFinishedCopyWithImpl;
@useResult
$Res call({
 String roundId, RoundSummary summary
});


$RoundSummaryCopyWith<$Res> get summary;

}
/// @nodoc
class _$ActiveRoundStateFinishedCopyWithImpl<$Res>
    implements $ActiveRoundStateFinishedCopyWith<$Res> {
  _$ActiveRoundStateFinishedCopyWithImpl(this._self, this._then);

  final ActiveRoundStateFinished _self;
  final $Res Function(ActiveRoundStateFinished) _then;

/// Create a copy of ActiveRoundState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? roundId = null,Object? summary = null,}) {
  return _then(ActiveRoundStateFinished(
roundId: null == roundId ? _self.roundId : roundId // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as RoundSummary,
  ));
}

/// Create a copy of ActiveRoundState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoundSummaryCopyWith<$Res> get summary {
  
  return $RoundSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

/// @nodoc


class ActiveRoundStateDiscarded extends ActiveRoundState {
  const ActiveRoundStateDiscarded({required this.roundId}): super._();
  

 final  String roundId;

/// Create a copy of ActiveRoundState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveRoundStateDiscardedCopyWith<ActiveRoundStateDiscarded> get copyWith => _$ActiveRoundStateDiscardedCopyWithImpl<ActiveRoundStateDiscarded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveRoundStateDiscarded&&(identical(other.roundId, roundId) || other.roundId == roundId));
}


@override
int get hashCode => Object.hash(runtimeType,roundId);

@override
String toString() {
  return 'ActiveRoundState.discarded(roundId: $roundId)';
}


}

/// @nodoc
abstract mixin class $ActiveRoundStateDiscardedCopyWith<$Res> implements $ActiveRoundStateCopyWith<$Res> {
  factory $ActiveRoundStateDiscardedCopyWith(ActiveRoundStateDiscarded value, $Res Function(ActiveRoundStateDiscarded) _then) = _$ActiveRoundStateDiscardedCopyWithImpl;
@useResult
$Res call({
 String roundId
});




}
/// @nodoc
class _$ActiveRoundStateDiscardedCopyWithImpl<$Res>
    implements $ActiveRoundStateDiscardedCopyWith<$Res> {
  _$ActiveRoundStateDiscardedCopyWithImpl(this._self, this._then);

  final ActiveRoundStateDiscarded _self;
  final $Res Function(ActiveRoundStateDiscarded) _then;

/// Create a copy of ActiveRoundState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? roundId = null,}) {
  return _then(ActiveRoundStateDiscarded(
roundId: null == roundId ? _self.roundId : roundId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ActiveRoundStateError extends ActiveRoundState {
  const ActiveRoundStateError({required this.message, this.roundId}): super._();
  

 final  String message;
 final  String? roundId;

/// Create a copy of ActiveRoundState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveRoundStateErrorCopyWith<ActiveRoundStateError> get copyWith => _$ActiveRoundStateErrorCopyWithImpl<ActiveRoundStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveRoundStateError&&(identical(other.message, message) || other.message == message)&&(identical(other.roundId, roundId) || other.roundId == roundId));
}


@override
int get hashCode => Object.hash(runtimeType,message,roundId);

@override
String toString() {
  return 'ActiveRoundState.error(message: $message, roundId: $roundId)';
}


}

/// @nodoc
abstract mixin class $ActiveRoundStateErrorCopyWith<$Res> implements $ActiveRoundStateCopyWith<$Res> {
  factory $ActiveRoundStateErrorCopyWith(ActiveRoundStateError value, $Res Function(ActiveRoundStateError) _then) = _$ActiveRoundStateErrorCopyWithImpl;
@useResult
$Res call({
 String message, String? roundId
});




}
/// @nodoc
class _$ActiveRoundStateErrorCopyWithImpl<$Res>
    implements $ActiveRoundStateErrorCopyWith<$Res> {
  _$ActiveRoundStateErrorCopyWithImpl(this._self, this._then);

  final ActiveRoundStateError _self;
  final $Res Function(ActiveRoundStateError) _then;

/// Create a copy of ActiveRoundState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? roundId = freezed,}) {
  return _then(ActiveRoundStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,roundId: freezed == roundId ? _self.roundId : roundId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
