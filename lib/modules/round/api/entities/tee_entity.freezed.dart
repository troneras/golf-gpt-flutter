// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tee_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
TeeEntity _$TeeEntityFromJson(
  Map<String, dynamic> json
) {
    return TeeEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$TeeEntity {

 String get id; String get name; String? get color;@JsonKey(name: 'slope_men', fromJson: _intFromJson) int? get slopeMen;@JsonKey(name: 'slope_women', fromJson: _intFromJson) int? get slopeWomen;@JsonKey(name: 'course_rating_men', fromJson: _doubleFromJson) double? get courseRatingMen;@JsonKey(name: 'course_rating_women', fromJson: _doubleFromJson) double? get courseRatingWomen;@JsonKey(name: 'total_length', fromJson: _intFromJson) int? get totalLength;@JsonKey(name: 'measure_unit') String? get measureUnit;@JsonKey(name: 'hole_lengths', fromJson: _intListFromJson) List<int>? get holeLengths;
/// Create a copy of TeeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeeEntityCopyWith<TeeEntity> get copyWith => _$TeeEntityCopyWithImpl<TeeEntity>(this as TeeEntity, _$identity);

  /// Serializes this TeeEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.slopeMen, slopeMen) || other.slopeMen == slopeMen)&&(identical(other.slopeWomen, slopeWomen) || other.slopeWomen == slopeWomen)&&(identical(other.courseRatingMen, courseRatingMen) || other.courseRatingMen == courseRatingMen)&&(identical(other.courseRatingWomen, courseRatingWomen) || other.courseRatingWomen == courseRatingWomen)&&(identical(other.totalLength, totalLength) || other.totalLength == totalLength)&&(identical(other.measureUnit, measureUnit) || other.measureUnit == measureUnit)&&const DeepCollectionEquality().equals(other.holeLengths, holeLengths));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,color,slopeMen,slopeWomen,courseRatingMen,courseRatingWomen,totalLength,measureUnit,const DeepCollectionEquality().hash(holeLengths));

@override
String toString() {
  return 'TeeEntity(id: $id, name: $name, color: $color, slopeMen: $slopeMen, slopeWomen: $slopeWomen, courseRatingMen: $courseRatingMen, courseRatingWomen: $courseRatingWomen, totalLength: $totalLength, measureUnit: $measureUnit, holeLengths: $holeLengths)';
}


}

/// @nodoc
abstract mixin class $TeeEntityCopyWith<$Res>  {
  factory $TeeEntityCopyWith(TeeEntity value, $Res Function(TeeEntity) _then) = _$TeeEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? color,@JsonKey(name: 'slope_men', fromJson: _intFromJson) int? slopeMen,@JsonKey(name: 'slope_women', fromJson: _intFromJson) int? slopeWomen,@JsonKey(name: 'course_rating_men', fromJson: _doubleFromJson) double? courseRatingMen,@JsonKey(name: 'course_rating_women', fromJson: _doubleFromJson) double? courseRatingWomen,@JsonKey(name: 'total_length', fromJson: _intFromJson) int? totalLength,@JsonKey(name: 'measure_unit') String? measureUnit,@JsonKey(name: 'hole_lengths', fromJson: _intListFromJson) List<int>? holeLengths
});




}
/// @nodoc
class _$TeeEntityCopyWithImpl<$Res>
    implements $TeeEntityCopyWith<$Res> {
  _$TeeEntityCopyWithImpl(this._self, this._then);

  final TeeEntity _self;
  final $Res Function(TeeEntity) _then;

/// Create a copy of TeeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? color = freezed,Object? slopeMen = freezed,Object? slopeWomen = freezed,Object? courseRatingMen = freezed,Object? courseRatingWomen = freezed,Object? totalLength = freezed,Object? measureUnit = freezed,Object? holeLengths = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,slopeMen: freezed == slopeMen ? _self.slopeMen : slopeMen // ignore: cast_nullable_to_non_nullable
as int?,slopeWomen: freezed == slopeWomen ? _self.slopeWomen : slopeWomen // ignore: cast_nullable_to_non_nullable
as int?,courseRatingMen: freezed == courseRatingMen ? _self.courseRatingMen : courseRatingMen // ignore: cast_nullable_to_non_nullable
as double?,courseRatingWomen: freezed == courseRatingWomen ? _self.courseRatingWomen : courseRatingWomen // ignore: cast_nullable_to_non_nullable
as double?,totalLength: freezed == totalLength ? _self.totalLength : totalLength // ignore: cast_nullable_to_non_nullable
as int?,measureUnit: freezed == measureUnit ? _self.measureUnit : measureUnit // ignore: cast_nullable_to_non_nullable
as String?,holeLengths: freezed == holeLengths ? _self.holeLengths : holeLengths // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TeeEntity].
extension TeeEntityPatterns on TeeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( TeeEntityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case TeeEntityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( TeeEntityData value)  $default,){
final _that = this;
switch (_that) {
case TeeEntityData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( TeeEntityData value)?  $default,){
final _that = this;
switch (_that) {
case TeeEntityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? color, @JsonKey(name: 'slope_men', fromJson: _intFromJson)  int? slopeMen, @JsonKey(name: 'slope_women', fromJson: _intFromJson)  int? slopeWomen, @JsonKey(name: 'course_rating_men', fromJson: _doubleFromJson)  double? courseRatingMen, @JsonKey(name: 'course_rating_women', fromJson: _doubleFromJson)  double? courseRatingWomen, @JsonKey(name: 'total_length', fromJson: _intFromJson)  int? totalLength, @JsonKey(name: 'measure_unit')  String? measureUnit, @JsonKey(name: 'hole_lengths', fromJson: _intListFromJson)  List<int>? holeLengths)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case TeeEntityData() when $default != null:
return $default(_that.id,_that.name,_that.color,_that.slopeMen,_that.slopeWomen,_that.courseRatingMen,_that.courseRatingWomen,_that.totalLength,_that.measureUnit,_that.holeLengths);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? color, @JsonKey(name: 'slope_men', fromJson: _intFromJson)  int? slopeMen, @JsonKey(name: 'slope_women', fromJson: _intFromJson)  int? slopeWomen, @JsonKey(name: 'course_rating_men', fromJson: _doubleFromJson)  double? courseRatingMen, @JsonKey(name: 'course_rating_women', fromJson: _doubleFromJson)  double? courseRatingWomen, @JsonKey(name: 'total_length', fromJson: _intFromJson)  int? totalLength, @JsonKey(name: 'measure_unit')  String? measureUnit, @JsonKey(name: 'hole_lengths', fromJson: _intListFromJson)  List<int>? holeLengths)  $default,) {final _that = this;
switch (_that) {
case TeeEntityData():
return $default(_that.id,_that.name,_that.color,_that.slopeMen,_that.slopeWomen,_that.courseRatingMen,_that.courseRatingWomen,_that.totalLength,_that.measureUnit,_that.holeLengths);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? color, @JsonKey(name: 'slope_men', fromJson: _intFromJson)  int? slopeMen, @JsonKey(name: 'slope_women', fromJson: _intFromJson)  int? slopeWomen, @JsonKey(name: 'course_rating_men', fromJson: _doubleFromJson)  double? courseRatingMen, @JsonKey(name: 'course_rating_women', fromJson: _doubleFromJson)  double? courseRatingWomen, @JsonKey(name: 'total_length', fromJson: _intFromJson)  int? totalLength, @JsonKey(name: 'measure_unit')  String? measureUnit, @JsonKey(name: 'hole_lengths', fromJson: _intListFromJson)  List<int>? holeLengths)?  $default,) {final _that = this;
switch (_that) {
case TeeEntityData() when $default != null:
return $default(_that.id,_that.name,_that.color,_that.slopeMen,_that.slopeWomen,_that.courseRatingMen,_that.courseRatingWomen,_that.totalLength,_that.measureUnit,_that.holeLengths);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class TeeEntityData extends TeeEntity {
  const TeeEntityData({required this.id, required this.name, this.color, @JsonKey(name: 'slope_men', fromJson: _intFromJson) this.slopeMen, @JsonKey(name: 'slope_women', fromJson: _intFromJson) this.slopeWomen, @JsonKey(name: 'course_rating_men', fromJson: _doubleFromJson) this.courseRatingMen, @JsonKey(name: 'course_rating_women', fromJson: _doubleFromJson) this.courseRatingWomen, @JsonKey(name: 'total_length', fromJson: _intFromJson) this.totalLength, @JsonKey(name: 'measure_unit') this.measureUnit, @JsonKey(name: 'hole_lengths', fromJson: _intListFromJson) final  List<int>? holeLengths}): _holeLengths = holeLengths,super._();
  factory TeeEntityData.fromJson(Map<String, dynamic> json) => _$TeeEntityDataFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? color;
@override@JsonKey(name: 'slope_men', fromJson: _intFromJson) final  int? slopeMen;
@override@JsonKey(name: 'slope_women', fromJson: _intFromJson) final  int? slopeWomen;
@override@JsonKey(name: 'course_rating_men', fromJson: _doubleFromJson) final  double? courseRatingMen;
@override@JsonKey(name: 'course_rating_women', fromJson: _doubleFromJson) final  double? courseRatingWomen;
@override@JsonKey(name: 'total_length', fromJson: _intFromJson) final  int? totalLength;
@override@JsonKey(name: 'measure_unit') final  String? measureUnit;
 final  List<int>? _holeLengths;
@override@JsonKey(name: 'hole_lengths', fromJson: _intListFromJson) List<int>? get holeLengths {
  final value = _holeLengths;
  if (value == null) return null;
  if (_holeLengths is EqualUnmodifiableListView) return _holeLengths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TeeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeeEntityDataCopyWith<TeeEntityData> get copyWith => _$TeeEntityDataCopyWithImpl<TeeEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeeEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeeEntityData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.slopeMen, slopeMen) || other.slopeMen == slopeMen)&&(identical(other.slopeWomen, slopeWomen) || other.slopeWomen == slopeWomen)&&(identical(other.courseRatingMen, courseRatingMen) || other.courseRatingMen == courseRatingMen)&&(identical(other.courseRatingWomen, courseRatingWomen) || other.courseRatingWomen == courseRatingWomen)&&(identical(other.totalLength, totalLength) || other.totalLength == totalLength)&&(identical(other.measureUnit, measureUnit) || other.measureUnit == measureUnit)&&const DeepCollectionEquality().equals(other._holeLengths, _holeLengths));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,color,slopeMen,slopeWomen,courseRatingMen,courseRatingWomen,totalLength,measureUnit,const DeepCollectionEquality().hash(_holeLengths));

@override
String toString() {
  return 'TeeEntity(id: $id, name: $name, color: $color, slopeMen: $slopeMen, slopeWomen: $slopeWomen, courseRatingMen: $courseRatingMen, courseRatingWomen: $courseRatingWomen, totalLength: $totalLength, measureUnit: $measureUnit, holeLengths: $holeLengths)';
}


}

/// @nodoc
abstract mixin class $TeeEntityDataCopyWith<$Res> implements $TeeEntityCopyWith<$Res> {
  factory $TeeEntityDataCopyWith(TeeEntityData value, $Res Function(TeeEntityData) _then) = _$TeeEntityDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? color,@JsonKey(name: 'slope_men', fromJson: _intFromJson) int? slopeMen,@JsonKey(name: 'slope_women', fromJson: _intFromJson) int? slopeWomen,@JsonKey(name: 'course_rating_men', fromJson: _doubleFromJson) double? courseRatingMen,@JsonKey(name: 'course_rating_women', fromJson: _doubleFromJson) double? courseRatingWomen,@JsonKey(name: 'total_length', fromJson: _intFromJson) int? totalLength,@JsonKey(name: 'measure_unit') String? measureUnit,@JsonKey(name: 'hole_lengths', fromJson: _intListFromJson) List<int>? holeLengths
});




}
/// @nodoc
class _$TeeEntityDataCopyWithImpl<$Res>
    implements $TeeEntityDataCopyWith<$Res> {
  _$TeeEntityDataCopyWithImpl(this._self, this._then);

  final TeeEntityData _self;
  final $Res Function(TeeEntityData) _then;

/// Create a copy of TeeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? color = freezed,Object? slopeMen = freezed,Object? slopeWomen = freezed,Object? courseRatingMen = freezed,Object? courseRatingWomen = freezed,Object? totalLength = freezed,Object? measureUnit = freezed,Object? holeLengths = freezed,}) {
  return _then(TeeEntityData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,slopeMen: freezed == slopeMen ? _self.slopeMen : slopeMen // ignore: cast_nullable_to_non_nullable
as int?,slopeWomen: freezed == slopeWomen ? _self.slopeWomen : slopeWomen // ignore: cast_nullable_to_non_nullable
as int?,courseRatingMen: freezed == courseRatingMen ? _self.courseRatingMen : courseRatingMen // ignore: cast_nullable_to_non_nullable
as double?,courseRatingWomen: freezed == courseRatingWomen ? _self.courseRatingWomen : courseRatingWomen // ignore: cast_nullable_to_non_nullable
as double?,totalLength: freezed == totalLength ? _self.totalLength : totalLength // ignore: cast_nullable_to_non_nullable
as int?,measureUnit: freezed == measureUnit ? _self.measureUnit : measureUnit // ignore: cast_nullable_to_non_nullable
as String?,holeLengths: freezed == holeLengths ? _self._holeLengths : holeLengths // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}


}

// dart format on
