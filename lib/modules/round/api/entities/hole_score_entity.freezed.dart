// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hole_score_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
HoleScoreEntity _$HoleScoreEntityFromJson(
  Map<String, dynamic> json
) {
    return HoleScoreEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$HoleScoreEntity {

 String? get id;@JsonKey(name: 'hole_number') int get holeNumber; int? get strokes; int? get putts; int? get penalties; int? get par;@JsonKey(name: 'fairway_hit') bool? get fairwayHit;@JsonKey(name: 'green_in_regulation') bool? get greenInRegulation;@JsonKey(name: 'in_sand') bool? get inSand;@JsonKey(name: 'score_name') String? get scoreName;
/// Create a copy of HoleScoreEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HoleScoreEntityCopyWith<HoleScoreEntity> get copyWith => _$HoleScoreEntityCopyWithImpl<HoleScoreEntity>(this as HoleScoreEntity, _$identity);

  /// Serializes this HoleScoreEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HoleScoreEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.holeNumber, holeNumber) || other.holeNumber == holeNumber)&&(identical(other.strokes, strokes) || other.strokes == strokes)&&(identical(other.putts, putts) || other.putts == putts)&&(identical(other.penalties, penalties) || other.penalties == penalties)&&(identical(other.par, par) || other.par == par)&&(identical(other.fairwayHit, fairwayHit) || other.fairwayHit == fairwayHit)&&(identical(other.greenInRegulation, greenInRegulation) || other.greenInRegulation == greenInRegulation)&&(identical(other.inSand, inSand) || other.inSand == inSand)&&(identical(other.scoreName, scoreName) || other.scoreName == scoreName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,holeNumber,strokes,putts,penalties,par,fairwayHit,greenInRegulation,inSand,scoreName);

@override
String toString() {
  return 'HoleScoreEntity(id: $id, holeNumber: $holeNumber, strokes: $strokes, putts: $putts, penalties: $penalties, par: $par, fairwayHit: $fairwayHit, greenInRegulation: $greenInRegulation, inSand: $inSand, scoreName: $scoreName)';
}


}

/// @nodoc
abstract mixin class $HoleScoreEntityCopyWith<$Res>  {
  factory $HoleScoreEntityCopyWith(HoleScoreEntity value, $Res Function(HoleScoreEntity) _then) = _$HoleScoreEntityCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'hole_number') int holeNumber, int? strokes, int? putts, int? penalties, int? par,@JsonKey(name: 'fairway_hit') bool? fairwayHit,@JsonKey(name: 'green_in_regulation') bool? greenInRegulation,@JsonKey(name: 'in_sand') bool? inSand,@JsonKey(name: 'score_name') String? scoreName
});




}
/// @nodoc
class _$HoleScoreEntityCopyWithImpl<$Res>
    implements $HoleScoreEntityCopyWith<$Res> {
  _$HoleScoreEntityCopyWithImpl(this._self, this._then);

  final HoleScoreEntity _self;
  final $Res Function(HoleScoreEntity) _then;

/// Create a copy of HoleScoreEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? holeNumber = null,Object? strokes = freezed,Object? putts = freezed,Object? penalties = freezed,Object? par = freezed,Object? fairwayHit = freezed,Object? greenInRegulation = freezed,Object? inSand = freezed,Object? scoreName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,holeNumber: null == holeNumber ? _self.holeNumber : holeNumber // ignore: cast_nullable_to_non_nullable
as int,strokes: freezed == strokes ? _self.strokes : strokes // ignore: cast_nullable_to_non_nullable
as int?,putts: freezed == putts ? _self.putts : putts // ignore: cast_nullable_to_non_nullable
as int?,penalties: freezed == penalties ? _self.penalties : penalties // ignore: cast_nullable_to_non_nullable
as int?,par: freezed == par ? _self.par : par // ignore: cast_nullable_to_non_nullable
as int?,fairwayHit: freezed == fairwayHit ? _self.fairwayHit : fairwayHit // ignore: cast_nullable_to_non_nullable
as bool?,greenInRegulation: freezed == greenInRegulation ? _self.greenInRegulation : greenInRegulation // ignore: cast_nullable_to_non_nullable
as bool?,inSand: freezed == inSand ? _self.inSand : inSand // ignore: cast_nullable_to_non_nullable
as bool?,scoreName: freezed == scoreName ? _self.scoreName : scoreName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HoleScoreEntity].
extension HoleScoreEntityPatterns on HoleScoreEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( HoleScoreEntityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case HoleScoreEntityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( HoleScoreEntityData value)  $default,){
final _that = this;
switch (_that) {
case HoleScoreEntityData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( HoleScoreEntityData value)?  $default,){
final _that = this;
switch (_that) {
case HoleScoreEntityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'hole_number')  int holeNumber,  int? strokes,  int? putts,  int? penalties,  int? par, @JsonKey(name: 'fairway_hit')  bool? fairwayHit, @JsonKey(name: 'green_in_regulation')  bool? greenInRegulation, @JsonKey(name: 'in_sand')  bool? inSand, @JsonKey(name: 'score_name')  String? scoreName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case HoleScoreEntityData() when $default != null:
return $default(_that.id,_that.holeNumber,_that.strokes,_that.putts,_that.penalties,_that.par,_that.fairwayHit,_that.greenInRegulation,_that.inSand,_that.scoreName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'hole_number')  int holeNumber,  int? strokes,  int? putts,  int? penalties,  int? par, @JsonKey(name: 'fairway_hit')  bool? fairwayHit, @JsonKey(name: 'green_in_regulation')  bool? greenInRegulation, @JsonKey(name: 'in_sand')  bool? inSand, @JsonKey(name: 'score_name')  String? scoreName)  $default,) {final _that = this;
switch (_that) {
case HoleScoreEntityData():
return $default(_that.id,_that.holeNumber,_that.strokes,_that.putts,_that.penalties,_that.par,_that.fairwayHit,_that.greenInRegulation,_that.inSand,_that.scoreName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'hole_number')  int holeNumber,  int? strokes,  int? putts,  int? penalties,  int? par, @JsonKey(name: 'fairway_hit')  bool? fairwayHit, @JsonKey(name: 'green_in_regulation')  bool? greenInRegulation, @JsonKey(name: 'in_sand')  bool? inSand, @JsonKey(name: 'score_name')  String? scoreName)?  $default,) {final _that = this;
switch (_that) {
case HoleScoreEntityData() when $default != null:
return $default(_that.id,_that.holeNumber,_that.strokes,_that.putts,_that.penalties,_that.par,_that.fairwayHit,_that.greenInRegulation,_that.inSand,_that.scoreName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class HoleScoreEntityData extends HoleScoreEntity {
  const HoleScoreEntityData({this.id, @JsonKey(name: 'hole_number') required this.holeNumber, this.strokes, this.putts, this.penalties, this.par, @JsonKey(name: 'fairway_hit') this.fairwayHit, @JsonKey(name: 'green_in_regulation') this.greenInRegulation, @JsonKey(name: 'in_sand') this.inSand, @JsonKey(name: 'score_name') this.scoreName}): super._();
  factory HoleScoreEntityData.fromJson(Map<String, dynamic> json) => _$HoleScoreEntityDataFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'hole_number') final  int holeNumber;
@override final  int? strokes;
@override final  int? putts;
@override final  int? penalties;
@override final  int? par;
@override@JsonKey(name: 'fairway_hit') final  bool? fairwayHit;
@override@JsonKey(name: 'green_in_regulation') final  bool? greenInRegulation;
@override@JsonKey(name: 'in_sand') final  bool? inSand;
@override@JsonKey(name: 'score_name') final  String? scoreName;

/// Create a copy of HoleScoreEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HoleScoreEntityDataCopyWith<HoleScoreEntityData> get copyWith => _$HoleScoreEntityDataCopyWithImpl<HoleScoreEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HoleScoreEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HoleScoreEntityData&&(identical(other.id, id) || other.id == id)&&(identical(other.holeNumber, holeNumber) || other.holeNumber == holeNumber)&&(identical(other.strokes, strokes) || other.strokes == strokes)&&(identical(other.putts, putts) || other.putts == putts)&&(identical(other.penalties, penalties) || other.penalties == penalties)&&(identical(other.par, par) || other.par == par)&&(identical(other.fairwayHit, fairwayHit) || other.fairwayHit == fairwayHit)&&(identical(other.greenInRegulation, greenInRegulation) || other.greenInRegulation == greenInRegulation)&&(identical(other.inSand, inSand) || other.inSand == inSand)&&(identical(other.scoreName, scoreName) || other.scoreName == scoreName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,holeNumber,strokes,putts,penalties,par,fairwayHit,greenInRegulation,inSand,scoreName);

@override
String toString() {
  return 'HoleScoreEntity(id: $id, holeNumber: $holeNumber, strokes: $strokes, putts: $putts, penalties: $penalties, par: $par, fairwayHit: $fairwayHit, greenInRegulation: $greenInRegulation, inSand: $inSand, scoreName: $scoreName)';
}


}

/// @nodoc
abstract mixin class $HoleScoreEntityDataCopyWith<$Res> implements $HoleScoreEntityCopyWith<$Res> {
  factory $HoleScoreEntityDataCopyWith(HoleScoreEntityData value, $Res Function(HoleScoreEntityData) _then) = _$HoleScoreEntityDataCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'hole_number') int holeNumber, int? strokes, int? putts, int? penalties, int? par,@JsonKey(name: 'fairway_hit') bool? fairwayHit,@JsonKey(name: 'green_in_regulation') bool? greenInRegulation,@JsonKey(name: 'in_sand') bool? inSand,@JsonKey(name: 'score_name') String? scoreName
});




}
/// @nodoc
class _$HoleScoreEntityDataCopyWithImpl<$Res>
    implements $HoleScoreEntityDataCopyWith<$Res> {
  _$HoleScoreEntityDataCopyWithImpl(this._self, this._then);

  final HoleScoreEntityData _self;
  final $Res Function(HoleScoreEntityData) _then;

/// Create a copy of HoleScoreEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? holeNumber = null,Object? strokes = freezed,Object? putts = freezed,Object? penalties = freezed,Object? par = freezed,Object? fairwayHit = freezed,Object? greenInRegulation = freezed,Object? inSand = freezed,Object? scoreName = freezed,}) {
  return _then(HoleScoreEntityData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,holeNumber: null == holeNumber ? _self.holeNumber : holeNumber // ignore: cast_nullable_to_non_nullable
as int,strokes: freezed == strokes ? _self.strokes : strokes // ignore: cast_nullable_to_non_nullable
as int?,putts: freezed == putts ? _self.putts : putts // ignore: cast_nullable_to_non_nullable
as int?,penalties: freezed == penalties ? _self.penalties : penalties // ignore: cast_nullable_to_non_nullable
as int?,par: freezed == par ? _self.par : par // ignore: cast_nullable_to_non_nullable
as int?,fairwayHit: freezed == fairwayHit ? _self.fairwayHit : fairwayHit // ignore: cast_nullable_to_non_nullable
as bool?,greenInRegulation: freezed == greenInRegulation ? _self.greenInRegulation : greenInRegulation // ignore: cast_nullable_to_non_nullable
as bool?,inSand: freezed == inSand ? _self.inSand : inSand // ignore: cast_nullable_to_non_nullable
as bool?,scoreName: freezed == scoreName ? _self.scoreName : scoreName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
