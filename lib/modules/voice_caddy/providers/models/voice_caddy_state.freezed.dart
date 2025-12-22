// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_caddy_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VoiceCaddyState {

/// Whether the user has completed GPT OAuth
 bool get isConnected;/// Last interaction with the GPT
 DateTime? get lastInteraction;/// Whether we're currently checking connection status
 bool get isChecking;/// Whether we're currently polling for connection
 bool get isPolling;/// Whether the user has skipped the flow
 bool get hasSkippedFlow;/// Whether the user has completed the flow
 bool get hasCompletedFlow;/// Error message if any
 String? get error;
/// Create a copy of VoiceCaddyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceCaddyStateCopyWith<VoiceCaddyState> get copyWith => _$VoiceCaddyStateCopyWithImpl<VoiceCaddyState>(this as VoiceCaddyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceCaddyState&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.lastInteraction, lastInteraction) || other.lastInteraction == lastInteraction)&&(identical(other.isChecking, isChecking) || other.isChecking == isChecking)&&(identical(other.isPolling, isPolling) || other.isPolling == isPolling)&&(identical(other.hasSkippedFlow, hasSkippedFlow) || other.hasSkippedFlow == hasSkippedFlow)&&(identical(other.hasCompletedFlow, hasCompletedFlow) || other.hasCompletedFlow == hasCompletedFlow)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isConnected,lastInteraction,isChecking,isPolling,hasSkippedFlow,hasCompletedFlow,error);

@override
String toString() {
  return 'VoiceCaddyState(isConnected: $isConnected, lastInteraction: $lastInteraction, isChecking: $isChecking, isPolling: $isPolling, hasSkippedFlow: $hasSkippedFlow, hasCompletedFlow: $hasCompletedFlow, error: $error)';
}


}

/// @nodoc
abstract mixin class $VoiceCaddyStateCopyWith<$Res>  {
  factory $VoiceCaddyStateCopyWith(VoiceCaddyState value, $Res Function(VoiceCaddyState) _then) = _$VoiceCaddyStateCopyWithImpl;
@useResult
$Res call({
 bool isConnected, DateTime? lastInteraction, bool isChecking, bool isPolling, bool hasSkippedFlow, bool hasCompletedFlow, String? error
});




}
/// @nodoc
class _$VoiceCaddyStateCopyWithImpl<$Res>
    implements $VoiceCaddyStateCopyWith<$Res> {
  _$VoiceCaddyStateCopyWithImpl(this._self, this._then);

  final VoiceCaddyState _self;
  final $Res Function(VoiceCaddyState) _then;

/// Create a copy of VoiceCaddyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isConnected = null,Object? lastInteraction = freezed,Object? isChecking = null,Object? isPolling = null,Object? hasSkippedFlow = null,Object? hasCompletedFlow = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,lastInteraction: freezed == lastInteraction ? _self.lastInteraction : lastInteraction // ignore: cast_nullable_to_non_nullable
as DateTime?,isChecking: null == isChecking ? _self.isChecking : isChecking // ignore: cast_nullable_to_non_nullable
as bool,isPolling: null == isPolling ? _self.isPolling : isPolling // ignore: cast_nullable_to_non_nullable
as bool,hasSkippedFlow: null == hasSkippedFlow ? _self.hasSkippedFlow : hasSkippedFlow // ignore: cast_nullable_to_non_nullable
as bool,hasCompletedFlow: null == hasCompletedFlow ? _self.hasCompletedFlow : hasCompletedFlow // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VoiceCaddyState].
extension VoiceCaddyStatePatterns on VoiceCaddyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( VoiceCaddyStateData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case VoiceCaddyStateData() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( VoiceCaddyStateData value)  $default,){
final _that = this;
switch (_that) {
case VoiceCaddyStateData():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( VoiceCaddyStateData value)?  $default,){
final _that = this;
switch (_that) {
case VoiceCaddyStateData() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isConnected,  DateTime? lastInteraction,  bool isChecking,  bool isPolling,  bool hasSkippedFlow,  bool hasCompletedFlow,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case VoiceCaddyStateData() when $default != null:
return $default(_that.isConnected,_that.lastInteraction,_that.isChecking,_that.isPolling,_that.hasSkippedFlow,_that.hasCompletedFlow,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isConnected,  DateTime? lastInteraction,  bool isChecking,  bool isPolling,  bool hasSkippedFlow,  bool hasCompletedFlow,  String? error)  $default,) {final _that = this;
switch (_that) {
case VoiceCaddyStateData():
return $default(_that.isConnected,_that.lastInteraction,_that.isChecking,_that.isPolling,_that.hasSkippedFlow,_that.hasCompletedFlow,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isConnected,  DateTime? lastInteraction,  bool isChecking,  bool isPolling,  bool hasSkippedFlow,  bool hasCompletedFlow,  String? error)?  $default,) {final _that = this;
switch (_that) {
case VoiceCaddyStateData() when $default != null:
return $default(_that.isConnected,_that.lastInteraction,_that.isChecking,_that.isPolling,_that.hasSkippedFlow,_that.hasCompletedFlow,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class VoiceCaddyStateData extends VoiceCaddyState {
  const VoiceCaddyStateData({this.isConnected = false, this.lastInteraction, this.isChecking = false, this.isPolling = false, this.hasSkippedFlow = false, this.hasCompletedFlow = false, this.error}): super._();
  

/// Whether the user has completed GPT OAuth
@override@JsonKey() final  bool isConnected;
/// Last interaction with the GPT
@override final  DateTime? lastInteraction;
/// Whether we're currently checking connection status
@override@JsonKey() final  bool isChecking;
/// Whether we're currently polling for connection
@override@JsonKey() final  bool isPolling;
/// Whether the user has skipped the flow
@override@JsonKey() final  bool hasSkippedFlow;
/// Whether the user has completed the flow
@override@JsonKey() final  bool hasCompletedFlow;
/// Error message if any
@override final  String? error;

/// Create a copy of VoiceCaddyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceCaddyStateDataCopyWith<VoiceCaddyStateData> get copyWith => _$VoiceCaddyStateDataCopyWithImpl<VoiceCaddyStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceCaddyStateData&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.lastInteraction, lastInteraction) || other.lastInteraction == lastInteraction)&&(identical(other.isChecking, isChecking) || other.isChecking == isChecking)&&(identical(other.isPolling, isPolling) || other.isPolling == isPolling)&&(identical(other.hasSkippedFlow, hasSkippedFlow) || other.hasSkippedFlow == hasSkippedFlow)&&(identical(other.hasCompletedFlow, hasCompletedFlow) || other.hasCompletedFlow == hasCompletedFlow)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isConnected,lastInteraction,isChecking,isPolling,hasSkippedFlow,hasCompletedFlow,error);

@override
String toString() {
  return 'VoiceCaddyState(isConnected: $isConnected, lastInteraction: $lastInteraction, isChecking: $isChecking, isPolling: $isPolling, hasSkippedFlow: $hasSkippedFlow, hasCompletedFlow: $hasCompletedFlow, error: $error)';
}


}

/// @nodoc
abstract mixin class $VoiceCaddyStateDataCopyWith<$Res> implements $VoiceCaddyStateCopyWith<$Res> {
  factory $VoiceCaddyStateDataCopyWith(VoiceCaddyStateData value, $Res Function(VoiceCaddyStateData) _then) = _$VoiceCaddyStateDataCopyWithImpl;
@override @useResult
$Res call({
 bool isConnected, DateTime? lastInteraction, bool isChecking, bool isPolling, bool hasSkippedFlow, bool hasCompletedFlow, String? error
});




}
/// @nodoc
class _$VoiceCaddyStateDataCopyWithImpl<$Res>
    implements $VoiceCaddyStateDataCopyWith<$Res> {
  _$VoiceCaddyStateDataCopyWithImpl(this._self, this._then);

  final VoiceCaddyStateData _self;
  final $Res Function(VoiceCaddyStateData) _then;

/// Create a copy of VoiceCaddyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isConnected = null,Object? lastInteraction = freezed,Object? isChecking = null,Object? isPolling = null,Object? hasSkippedFlow = null,Object? hasCompletedFlow = null,Object? error = freezed,}) {
  return _then(VoiceCaddyStateData(
isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,lastInteraction: freezed == lastInteraction ? _self.lastInteraction : lastInteraction // ignore: cast_nullable_to_non_nullable
as DateTime?,isChecking: null == isChecking ? _self.isChecking : isChecking // ignore: cast_nullable_to_non_nullable
as bool,isPolling: null == isPolling ? _self.isPolling : isPolling // ignore: cast_nullable_to_non_nullable
as bool,hasSkippedFlow: null == hasSkippedFlow ? _self.hasSkippedFlow : hasSkippedFlow // ignore: cast_nullable_to_non_nullable
as bool,hasCompletedFlow: null == hasCompletedFlow ? _self.hasCompletedFlow : hasCompletedFlow // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
