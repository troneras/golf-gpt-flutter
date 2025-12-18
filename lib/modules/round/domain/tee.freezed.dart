// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Tee {

 String get id; String get name; String? get colorValue; int? get slopeMen; int? get slopeWomen; double? get courseRatingMen; double? get courseRatingWomen; int? get totalLength; String get measureUnit; List<int> get holeLengths;
/// Create a copy of Tee
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeeCopyWith<Tee> get copyWith => _$TeeCopyWithImpl<Tee>(this as Tee, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tee&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.slopeMen, slopeMen) || other.slopeMen == slopeMen)&&(identical(other.slopeWomen, slopeWomen) || other.slopeWomen == slopeWomen)&&(identical(other.courseRatingMen, courseRatingMen) || other.courseRatingMen == courseRatingMen)&&(identical(other.courseRatingWomen, courseRatingWomen) || other.courseRatingWomen == courseRatingWomen)&&(identical(other.totalLength, totalLength) || other.totalLength == totalLength)&&(identical(other.measureUnit, measureUnit) || other.measureUnit == measureUnit)&&const DeepCollectionEquality().equals(other.holeLengths, holeLengths));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,colorValue,slopeMen,slopeWomen,courseRatingMen,courseRatingWomen,totalLength,measureUnit,const DeepCollectionEquality().hash(holeLengths));

@override
String toString() {
  return 'Tee(id: $id, name: $name, colorValue: $colorValue, slopeMen: $slopeMen, slopeWomen: $slopeWomen, courseRatingMen: $courseRatingMen, courseRatingWomen: $courseRatingWomen, totalLength: $totalLength, measureUnit: $measureUnit, holeLengths: $holeLengths)';
}


}

/// @nodoc
abstract mixin class $TeeCopyWith<$Res>  {
  factory $TeeCopyWith(Tee value, $Res Function(Tee) _then) = _$TeeCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? colorValue, int? slopeMen, int? slopeWomen, double? courseRatingMen, double? courseRatingWomen, int? totalLength, String measureUnit, List<int> holeLengths
});




}
/// @nodoc
class _$TeeCopyWithImpl<$Res>
    implements $TeeCopyWith<$Res> {
  _$TeeCopyWithImpl(this._self, this._then);

  final Tee _self;
  final $Res Function(Tee) _then;

/// Create a copy of Tee
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? colorValue = freezed,Object? slopeMen = freezed,Object? slopeWomen = freezed,Object? courseRatingMen = freezed,Object? courseRatingWomen = freezed,Object? totalLength = freezed,Object? measureUnit = null,Object? holeLengths = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorValue: freezed == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as String?,slopeMen: freezed == slopeMen ? _self.slopeMen : slopeMen // ignore: cast_nullable_to_non_nullable
as int?,slopeWomen: freezed == slopeWomen ? _self.slopeWomen : slopeWomen // ignore: cast_nullable_to_non_nullable
as int?,courseRatingMen: freezed == courseRatingMen ? _self.courseRatingMen : courseRatingMen // ignore: cast_nullable_to_non_nullable
as double?,courseRatingWomen: freezed == courseRatingWomen ? _self.courseRatingWomen : courseRatingWomen // ignore: cast_nullable_to_non_nullable
as double?,totalLength: freezed == totalLength ? _self.totalLength : totalLength // ignore: cast_nullable_to_non_nullable
as int?,measureUnit: null == measureUnit ? _self.measureUnit : measureUnit // ignore: cast_nullable_to_non_nullable
as String,holeLengths: null == holeLengths ? _self.holeLengths : holeLengths // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [Tee].
extension TeePatterns on Tee {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( TeeData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case TeeData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( TeeData value)  $default,){
final _that = this;
switch (_that) {
case TeeData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( TeeData value)?  $default,){
final _that = this;
switch (_that) {
case TeeData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? colorValue,  int? slopeMen,  int? slopeWomen,  double? courseRatingMen,  double? courseRatingWomen,  int? totalLength,  String measureUnit,  List<int> holeLengths)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case TeeData() when $default != null:
return $default(_that.id,_that.name,_that.colorValue,_that.slopeMen,_that.slopeWomen,_that.courseRatingMen,_that.courseRatingWomen,_that.totalLength,_that.measureUnit,_that.holeLengths);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? colorValue,  int? slopeMen,  int? slopeWomen,  double? courseRatingMen,  double? courseRatingWomen,  int? totalLength,  String measureUnit,  List<int> holeLengths)  $default,) {final _that = this;
switch (_that) {
case TeeData():
return $default(_that.id,_that.name,_that.colorValue,_that.slopeMen,_that.slopeWomen,_that.courseRatingMen,_that.courseRatingWomen,_that.totalLength,_that.measureUnit,_that.holeLengths);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? colorValue,  int? slopeMen,  int? slopeWomen,  double? courseRatingMen,  double? courseRatingWomen,  int? totalLength,  String measureUnit,  List<int> holeLengths)?  $default,) {final _that = this;
switch (_that) {
case TeeData() when $default != null:
return $default(_that.id,_that.name,_that.colorValue,_that.slopeMen,_that.slopeWomen,_that.courseRatingMen,_that.courseRatingWomen,_that.totalLength,_that.measureUnit,_that.holeLengths);case _:
  return null;

}
}

}

/// @nodoc


class TeeData extends Tee {
  const TeeData({required this.id, required this.name, this.colorValue, this.slopeMen, this.slopeWomen, this.courseRatingMen, this.courseRatingWomen, this.totalLength, this.measureUnit = 'yards', final  List<int> holeLengths = const []}): _holeLengths = holeLengths,super._();
  

@override final  String id;
@override final  String name;
@override final  String? colorValue;
@override final  int? slopeMen;
@override final  int? slopeWomen;
@override final  double? courseRatingMen;
@override final  double? courseRatingWomen;
@override final  int? totalLength;
@override@JsonKey() final  String measureUnit;
 final  List<int> _holeLengths;
@override@JsonKey() List<int> get holeLengths {
  if (_holeLengths is EqualUnmodifiableListView) return _holeLengths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_holeLengths);
}


/// Create a copy of Tee
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeeDataCopyWith<TeeData> get copyWith => _$TeeDataCopyWithImpl<TeeData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeeData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.slopeMen, slopeMen) || other.slopeMen == slopeMen)&&(identical(other.slopeWomen, slopeWomen) || other.slopeWomen == slopeWomen)&&(identical(other.courseRatingMen, courseRatingMen) || other.courseRatingMen == courseRatingMen)&&(identical(other.courseRatingWomen, courseRatingWomen) || other.courseRatingWomen == courseRatingWomen)&&(identical(other.totalLength, totalLength) || other.totalLength == totalLength)&&(identical(other.measureUnit, measureUnit) || other.measureUnit == measureUnit)&&const DeepCollectionEquality().equals(other._holeLengths, _holeLengths));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,colorValue,slopeMen,slopeWomen,courseRatingMen,courseRatingWomen,totalLength,measureUnit,const DeepCollectionEquality().hash(_holeLengths));

@override
String toString() {
  return 'Tee(id: $id, name: $name, colorValue: $colorValue, slopeMen: $slopeMen, slopeWomen: $slopeWomen, courseRatingMen: $courseRatingMen, courseRatingWomen: $courseRatingWomen, totalLength: $totalLength, measureUnit: $measureUnit, holeLengths: $holeLengths)';
}


}

/// @nodoc
abstract mixin class $TeeDataCopyWith<$Res> implements $TeeCopyWith<$Res> {
  factory $TeeDataCopyWith(TeeData value, $Res Function(TeeData) _then) = _$TeeDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? colorValue, int? slopeMen, int? slopeWomen, double? courseRatingMen, double? courseRatingWomen, int? totalLength, String measureUnit, List<int> holeLengths
});




}
/// @nodoc
class _$TeeDataCopyWithImpl<$Res>
    implements $TeeDataCopyWith<$Res> {
  _$TeeDataCopyWithImpl(this._self, this._then);

  final TeeData _self;
  final $Res Function(TeeData) _then;

/// Create a copy of Tee
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? colorValue = freezed,Object? slopeMen = freezed,Object? slopeWomen = freezed,Object? courseRatingMen = freezed,Object? courseRatingWomen = freezed,Object? totalLength = freezed,Object? measureUnit = null,Object? holeLengths = null,}) {
  return _then(TeeData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorValue: freezed == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as String?,slopeMen: freezed == slopeMen ? _self.slopeMen : slopeMen // ignore: cast_nullable_to_non_nullable
as int?,slopeWomen: freezed == slopeWomen ? _self.slopeWomen : slopeWomen // ignore: cast_nullable_to_non_nullable
as int?,courseRatingMen: freezed == courseRatingMen ? _self.courseRatingMen : courseRatingMen // ignore: cast_nullable_to_non_nullable
as double?,courseRatingWomen: freezed == courseRatingWomen ? _self.courseRatingWomen : courseRatingWomen // ignore: cast_nullable_to_non_nullable
as double?,totalLength: freezed == totalLength ? _self.totalLength : totalLength // ignore: cast_nullable_to_non_nullable
as int?,measureUnit: null == measureUnit ? _self.measureUnit : measureUnit // ignore: cast_nullable_to_non_nullable
as String,holeLengths: null == holeLengths ? _self._holeLengths : holeLengths // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
