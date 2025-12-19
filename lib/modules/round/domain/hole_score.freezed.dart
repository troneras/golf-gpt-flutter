// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hole_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HoleScore {

 String? get id; int get holeNumber; int? get strokes; int? get putts; int? get penalties; int get par; int? get yards; bool? get fairwayHit; bool? get greenInRegulation; bool? get inSand; String? get scoreName;
/// Create a copy of HoleScore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HoleScoreCopyWith<HoleScore> get copyWith => _$HoleScoreCopyWithImpl<HoleScore>(this as HoleScore, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HoleScore&&(identical(other.id, id) || other.id == id)&&(identical(other.holeNumber, holeNumber) || other.holeNumber == holeNumber)&&(identical(other.strokes, strokes) || other.strokes == strokes)&&(identical(other.putts, putts) || other.putts == putts)&&(identical(other.penalties, penalties) || other.penalties == penalties)&&(identical(other.par, par) || other.par == par)&&(identical(other.yards, yards) || other.yards == yards)&&(identical(other.fairwayHit, fairwayHit) || other.fairwayHit == fairwayHit)&&(identical(other.greenInRegulation, greenInRegulation) || other.greenInRegulation == greenInRegulation)&&(identical(other.inSand, inSand) || other.inSand == inSand)&&(identical(other.scoreName, scoreName) || other.scoreName == scoreName));
}


@override
int get hashCode => Object.hash(runtimeType,id,holeNumber,strokes,putts,penalties,par,yards,fairwayHit,greenInRegulation,inSand,scoreName);

@override
String toString() {
  return 'HoleScore(id: $id, holeNumber: $holeNumber, strokes: $strokes, putts: $putts, penalties: $penalties, par: $par, yards: $yards, fairwayHit: $fairwayHit, greenInRegulation: $greenInRegulation, inSand: $inSand, scoreName: $scoreName)';
}


}

/// @nodoc
abstract mixin class $HoleScoreCopyWith<$Res>  {
  factory $HoleScoreCopyWith(HoleScore value, $Res Function(HoleScore) _then) = _$HoleScoreCopyWithImpl;
@useResult
$Res call({
 String? id, int holeNumber, int? strokes, int? putts, int? penalties, int par, int? yards, bool? fairwayHit, bool? greenInRegulation, bool? inSand, String? scoreName
});




}
/// @nodoc
class _$HoleScoreCopyWithImpl<$Res>
    implements $HoleScoreCopyWith<$Res> {
  _$HoleScoreCopyWithImpl(this._self, this._then);

  final HoleScore _self;
  final $Res Function(HoleScore) _then;

/// Create a copy of HoleScore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? holeNumber = null,Object? strokes = freezed,Object? putts = freezed,Object? penalties = freezed,Object? par = null,Object? yards = freezed,Object? fairwayHit = freezed,Object? greenInRegulation = freezed,Object? inSand = freezed,Object? scoreName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,holeNumber: null == holeNumber ? _self.holeNumber : holeNumber // ignore: cast_nullable_to_non_nullable
as int,strokes: freezed == strokes ? _self.strokes : strokes // ignore: cast_nullable_to_non_nullable
as int?,putts: freezed == putts ? _self.putts : putts // ignore: cast_nullable_to_non_nullable
as int?,penalties: freezed == penalties ? _self.penalties : penalties // ignore: cast_nullable_to_non_nullable
as int?,par: null == par ? _self.par : par // ignore: cast_nullable_to_non_nullable
as int,yards: freezed == yards ? _self.yards : yards // ignore: cast_nullable_to_non_nullable
as int?,fairwayHit: freezed == fairwayHit ? _self.fairwayHit : fairwayHit // ignore: cast_nullable_to_non_nullable
as bool?,greenInRegulation: freezed == greenInRegulation ? _self.greenInRegulation : greenInRegulation // ignore: cast_nullable_to_non_nullable
as bool?,inSand: freezed == inSand ? _self.inSand : inSand // ignore: cast_nullable_to_non_nullable
as bool?,scoreName: freezed == scoreName ? _self.scoreName : scoreName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HoleScore].
extension HoleScorePatterns on HoleScore {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( HoleScoreData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case HoleScoreData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( HoleScoreData value)  $default,){
final _that = this;
switch (_that) {
case HoleScoreData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( HoleScoreData value)?  $default,){
final _that = this;
switch (_that) {
case HoleScoreData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  int holeNumber,  int? strokes,  int? putts,  int? penalties,  int par,  int? yards,  bool? fairwayHit,  bool? greenInRegulation,  bool? inSand,  String? scoreName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case HoleScoreData() when $default != null:
return $default(_that.id,_that.holeNumber,_that.strokes,_that.putts,_that.penalties,_that.par,_that.yards,_that.fairwayHit,_that.greenInRegulation,_that.inSand,_that.scoreName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  int holeNumber,  int? strokes,  int? putts,  int? penalties,  int par,  int? yards,  bool? fairwayHit,  bool? greenInRegulation,  bool? inSand,  String? scoreName)  $default,) {final _that = this;
switch (_that) {
case HoleScoreData():
return $default(_that.id,_that.holeNumber,_that.strokes,_that.putts,_that.penalties,_that.par,_that.yards,_that.fairwayHit,_that.greenInRegulation,_that.inSand,_that.scoreName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  int holeNumber,  int? strokes,  int? putts,  int? penalties,  int par,  int? yards,  bool? fairwayHit,  bool? greenInRegulation,  bool? inSand,  String? scoreName)?  $default,) {final _that = this;
switch (_that) {
case HoleScoreData() when $default != null:
return $default(_that.id,_that.holeNumber,_that.strokes,_that.putts,_that.penalties,_that.par,_that.yards,_that.fairwayHit,_that.greenInRegulation,_that.inSand,_that.scoreName);case _:
  return null;

}
}

}

/// @nodoc


class HoleScoreData extends HoleScore {
  const HoleScoreData({this.id, required this.holeNumber, this.strokes, this.putts, this.penalties, required this.par, this.yards, this.fairwayHit, this.greenInRegulation, this.inSand, this.scoreName}): super._();
  

@override final  String? id;
@override final  int holeNumber;
@override final  int? strokes;
@override final  int? putts;
@override final  int? penalties;
@override final  int par;
@override final  int? yards;
@override final  bool? fairwayHit;
@override final  bool? greenInRegulation;
@override final  bool? inSand;
@override final  String? scoreName;

/// Create a copy of HoleScore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HoleScoreDataCopyWith<HoleScoreData> get copyWith => _$HoleScoreDataCopyWithImpl<HoleScoreData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HoleScoreData&&(identical(other.id, id) || other.id == id)&&(identical(other.holeNumber, holeNumber) || other.holeNumber == holeNumber)&&(identical(other.strokes, strokes) || other.strokes == strokes)&&(identical(other.putts, putts) || other.putts == putts)&&(identical(other.penalties, penalties) || other.penalties == penalties)&&(identical(other.par, par) || other.par == par)&&(identical(other.yards, yards) || other.yards == yards)&&(identical(other.fairwayHit, fairwayHit) || other.fairwayHit == fairwayHit)&&(identical(other.greenInRegulation, greenInRegulation) || other.greenInRegulation == greenInRegulation)&&(identical(other.inSand, inSand) || other.inSand == inSand)&&(identical(other.scoreName, scoreName) || other.scoreName == scoreName));
}


@override
int get hashCode => Object.hash(runtimeType,id,holeNumber,strokes,putts,penalties,par,yards,fairwayHit,greenInRegulation,inSand,scoreName);

@override
String toString() {
  return 'HoleScore(id: $id, holeNumber: $holeNumber, strokes: $strokes, putts: $putts, penalties: $penalties, par: $par, yards: $yards, fairwayHit: $fairwayHit, greenInRegulation: $greenInRegulation, inSand: $inSand, scoreName: $scoreName)';
}


}

/// @nodoc
abstract mixin class $HoleScoreDataCopyWith<$Res> implements $HoleScoreCopyWith<$Res> {
  factory $HoleScoreDataCopyWith(HoleScoreData value, $Res Function(HoleScoreData) _then) = _$HoleScoreDataCopyWithImpl;
@override @useResult
$Res call({
 String? id, int holeNumber, int? strokes, int? putts, int? penalties, int par, int? yards, bool? fairwayHit, bool? greenInRegulation, bool? inSand, String? scoreName
});




}
/// @nodoc
class _$HoleScoreDataCopyWithImpl<$Res>
    implements $HoleScoreDataCopyWith<$Res> {
  _$HoleScoreDataCopyWithImpl(this._self, this._then);

  final HoleScoreData _self;
  final $Res Function(HoleScoreData) _then;

/// Create a copy of HoleScore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? holeNumber = null,Object? strokes = freezed,Object? putts = freezed,Object? penalties = freezed,Object? par = null,Object? yards = freezed,Object? fairwayHit = freezed,Object? greenInRegulation = freezed,Object? inSand = freezed,Object? scoreName = freezed,}) {
  return _then(HoleScoreData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,holeNumber: null == holeNumber ? _self.holeNumber : holeNumber // ignore: cast_nullable_to_non_nullable
as int,strokes: freezed == strokes ? _self.strokes : strokes // ignore: cast_nullable_to_non_nullable
as int?,putts: freezed == putts ? _self.putts : putts // ignore: cast_nullable_to_non_nullable
as int?,penalties: freezed == penalties ? _self.penalties : penalties // ignore: cast_nullable_to_non_nullable
as int?,par: null == par ? _self.par : par // ignore: cast_nullable_to_non_nullable
as int,yards: freezed == yards ? _self.yards : yards // ignore: cast_nullable_to_non_nullable
as int?,fairwayHit: freezed == fairwayHit ? _self.fairwayHit : fairwayHit // ignore: cast_nullable_to_non_nullable
as bool?,greenInRegulation: freezed == greenInRegulation ? _self.greenInRegulation : greenInRegulation // ignore: cast_nullable_to_non_nullable
as bool?,inSand: freezed == inSand ? _self.inSand : inSand // ignore: cast_nullable_to_non_nullable
as bool?,scoreName: freezed == scoreName ? _self.scoreName : scoreName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
