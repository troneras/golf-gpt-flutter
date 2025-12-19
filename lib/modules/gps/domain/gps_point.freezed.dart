// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gps_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GpsPoint {

 double get latitude; double get longitude; double? get accuracy; double? get altitude; double? get speed; double? get heading; DateTime get recordedAt;
/// Create a copy of GpsPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GpsPointCopyWith<GpsPoint> get copyWith => _$GpsPointCopyWithImpl<GpsPoint>(this as GpsPoint, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GpsPoint&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.altitude, altitude) || other.altitude == altitude)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt));
}


@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,accuracy,altitude,speed,heading,recordedAt);

@override
String toString() {
  return 'GpsPoint(latitude: $latitude, longitude: $longitude, accuracy: $accuracy, altitude: $altitude, speed: $speed, heading: $heading, recordedAt: $recordedAt)';
}


}

/// @nodoc
abstract mixin class $GpsPointCopyWith<$Res>  {
  factory $GpsPointCopyWith(GpsPoint value, $Res Function(GpsPoint) _then) = _$GpsPointCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, double? accuracy, double? altitude, double? speed, double? heading, DateTime recordedAt
});




}
/// @nodoc
class _$GpsPointCopyWithImpl<$Res>
    implements $GpsPointCopyWith<$Res> {
  _$GpsPointCopyWithImpl(this._self, this._then);

  final GpsPoint _self;
  final $Res Function(GpsPoint) _then;

/// Create a copy of GpsPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? accuracy = freezed,Object? altitude = freezed,Object? speed = freezed,Object? heading = freezed,Object? recordedAt = null,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,altitude: freezed == altitude ? _self.altitude : altitude // ignore: cast_nullable_to_non_nullable
as double?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double?,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [GpsPoint].
extension GpsPointPatterns on GpsPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( GpsPointData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case GpsPointData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( GpsPointData value)  $default,){
final _that = this;
switch (_that) {
case GpsPointData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( GpsPointData value)?  $default,){
final _that = this;
switch (_that) {
case GpsPointData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude,  double? accuracy,  double? altitude,  double? speed,  double? heading,  DateTime recordedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case GpsPointData() when $default != null:
return $default(_that.latitude,_that.longitude,_that.accuracy,_that.altitude,_that.speed,_that.heading,_that.recordedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude,  double? accuracy,  double? altitude,  double? speed,  double? heading,  DateTime recordedAt)  $default,) {final _that = this;
switch (_that) {
case GpsPointData():
return $default(_that.latitude,_that.longitude,_that.accuracy,_that.altitude,_that.speed,_that.heading,_that.recordedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude,  double? accuracy,  double? altitude,  double? speed,  double? heading,  DateTime recordedAt)?  $default,) {final _that = this;
switch (_that) {
case GpsPointData() when $default != null:
return $default(_that.latitude,_that.longitude,_that.accuracy,_that.altitude,_that.speed,_that.heading,_that.recordedAt);case _:
  return null;

}
}

}

/// @nodoc


class GpsPointData extends GpsPoint {
  const GpsPointData({required this.latitude, required this.longitude, this.accuracy, this.altitude, this.speed, this.heading, required this.recordedAt}): super._();
  

@override final  double latitude;
@override final  double longitude;
@override final  double? accuracy;
@override final  double? altitude;
@override final  double? speed;
@override final  double? heading;
@override final  DateTime recordedAt;

/// Create a copy of GpsPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GpsPointDataCopyWith<GpsPointData> get copyWith => _$GpsPointDataCopyWithImpl<GpsPointData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GpsPointData&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.altitude, altitude) || other.altitude == altitude)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt));
}


@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,accuracy,altitude,speed,heading,recordedAt);

@override
String toString() {
  return 'GpsPoint(latitude: $latitude, longitude: $longitude, accuracy: $accuracy, altitude: $altitude, speed: $speed, heading: $heading, recordedAt: $recordedAt)';
}


}

/// @nodoc
abstract mixin class $GpsPointDataCopyWith<$Res> implements $GpsPointCopyWith<$Res> {
  factory $GpsPointDataCopyWith(GpsPointData value, $Res Function(GpsPointData) _then) = _$GpsPointDataCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude, double? accuracy, double? altitude, double? speed, double? heading, DateTime recordedAt
});




}
/// @nodoc
class _$GpsPointDataCopyWithImpl<$Res>
    implements $GpsPointDataCopyWith<$Res> {
  _$GpsPointDataCopyWithImpl(this._self, this._then);

  final GpsPointData _self;
  final $Res Function(GpsPointData) _then;

/// Create a copy of GpsPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? accuracy = freezed,Object? altitude = freezed,Object? speed = freezed,Object? heading = freezed,Object? recordedAt = null,}) {
  return _then(GpsPointData(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,altitude: freezed == altitude ? _self.altitude : altitude // ignore: cast_nullable_to_non_nullable
as double?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double?,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
