// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gpt_connection_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
GptConnectionEntity _$GptConnectionEntityFromJson(
  Map<String, dynamic> json
) {
    return GptConnectionEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$GptConnectionEntity {

@JsonKey(name: 'has_completed_oauth') bool get hasCompletedOauth;@JsonKey(name: 'last_interaction') DateTime? get lastInteraction;
/// Create a copy of GptConnectionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GptConnectionEntityCopyWith<GptConnectionEntity> get copyWith => _$GptConnectionEntityCopyWithImpl<GptConnectionEntity>(this as GptConnectionEntity, _$identity);

  /// Serializes this GptConnectionEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GptConnectionEntity&&(identical(other.hasCompletedOauth, hasCompletedOauth) || other.hasCompletedOauth == hasCompletedOauth)&&(identical(other.lastInteraction, lastInteraction) || other.lastInteraction == lastInteraction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasCompletedOauth,lastInteraction);

@override
String toString() {
  return 'GptConnectionEntity(hasCompletedOauth: $hasCompletedOauth, lastInteraction: $lastInteraction)';
}


}

/// @nodoc
abstract mixin class $GptConnectionEntityCopyWith<$Res>  {
  factory $GptConnectionEntityCopyWith(GptConnectionEntity value, $Res Function(GptConnectionEntity) _then) = _$GptConnectionEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'has_completed_oauth') bool hasCompletedOauth,@JsonKey(name: 'last_interaction') DateTime? lastInteraction
});




}
/// @nodoc
class _$GptConnectionEntityCopyWithImpl<$Res>
    implements $GptConnectionEntityCopyWith<$Res> {
  _$GptConnectionEntityCopyWithImpl(this._self, this._then);

  final GptConnectionEntity _self;
  final $Res Function(GptConnectionEntity) _then;

/// Create a copy of GptConnectionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasCompletedOauth = null,Object? lastInteraction = freezed,}) {
  return _then(_self.copyWith(
hasCompletedOauth: null == hasCompletedOauth ? _self.hasCompletedOauth : hasCompletedOauth // ignore: cast_nullable_to_non_nullable
as bool,lastInteraction: freezed == lastInteraction ? _self.lastInteraction : lastInteraction // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [GptConnectionEntity].
extension GptConnectionEntityPatterns on GptConnectionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( GptConnectionEntityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case GptConnectionEntityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( GptConnectionEntityData value)  $default,){
final _that = this;
switch (_that) {
case GptConnectionEntityData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( GptConnectionEntityData value)?  $default,){
final _that = this;
switch (_that) {
case GptConnectionEntityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'has_completed_oauth')  bool hasCompletedOauth, @JsonKey(name: 'last_interaction')  DateTime? lastInteraction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case GptConnectionEntityData() when $default != null:
return $default(_that.hasCompletedOauth,_that.lastInteraction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'has_completed_oauth')  bool hasCompletedOauth, @JsonKey(name: 'last_interaction')  DateTime? lastInteraction)  $default,) {final _that = this;
switch (_that) {
case GptConnectionEntityData():
return $default(_that.hasCompletedOauth,_that.lastInteraction);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'has_completed_oauth')  bool hasCompletedOauth, @JsonKey(name: 'last_interaction')  DateTime? lastInteraction)?  $default,) {final _that = this;
switch (_that) {
case GptConnectionEntityData() when $default != null:
return $default(_that.hasCompletedOauth,_that.lastInteraction);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class GptConnectionEntityData extends GptConnectionEntity {
  const GptConnectionEntityData({@JsonKey(name: 'has_completed_oauth') this.hasCompletedOauth = false, @JsonKey(name: 'last_interaction') this.lastInteraction}): super._();
  factory GptConnectionEntityData.fromJson(Map<String, dynamic> json) => _$GptConnectionEntityDataFromJson(json);

@override@JsonKey(name: 'has_completed_oauth') final  bool hasCompletedOauth;
@override@JsonKey(name: 'last_interaction') final  DateTime? lastInteraction;

/// Create a copy of GptConnectionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GptConnectionEntityDataCopyWith<GptConnectionEntityData> get copyWith => _$GptConnectionEntityDataCopyWithImpl<GptConnectionEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GptConnectionEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GptConnectionEntityData&&(identical(other.hasCompletedOauth, hasCompletedOauth) || other.hasCompletedOauth == hasCompletedOauth)&&(identical(other.lastInteraction, lastInteraction) || other.lastInteraction == lastInteraction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasCompletedOauth,lastInteraction);

@override
String toString() {
  return 'GptConnectionEntity(hasCompletedOauth: $hasCompletedOauth, lastInteraction: $lastInteraction)';
}


}

/// @nodoc
abstract mixin class $GptConnectionEntityDataCopyWith<$Res> implements $GptConnectionEntityCopyWith<$Res> {
  factory $GptConnectionEntityDataCopyWith(GptConnectionEntityData value, $Res Function(GptConnectionEntityData) _then) = _$GptConnectionEntityDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'has_completed_oauth') bool hasCompletedOauth,@JsonKey(name: 'last_interaction') DateTime? lastInteraction
});




}
/// @nodoc
class _$GptConnectionEntityDataCopyWithImpl<$Res>
    implements $GptConnectionEntityDataCopyWith<$Res> {
  _$GptConnectionEntityDataCopyWithImpl(this._self, this._then);

  final GptConnectionEntityData _self;
  final $Res Function(GptConnectionEntityData) _then;

/// Create a copy of GptConnectionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasCompletedOauth = null,Object? lastInteraction = freezed,}) {
  return _then(GptConnectionEntityData(
hasCompletedOauth: null == hasCompletedOauth ? _self.hasCompletedOauth : hasCompletedOauth // ignore: cast_nullable_to_non_nullable
as bool,lastInteraction: freezed == lastInteraction ? _self.lastInteraction : lastInteraction // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
