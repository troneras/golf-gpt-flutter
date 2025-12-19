// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gps_point_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
GpsPointEntity _$GpsPointEntityFromJson(
  Map<String, dynamic> json
) {
    return GpsPointEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$GpsPointEntity {

 double get latitude; double get longitude; double? get accuracy; double? get altitude; double? get speed; double? get heading;@JsonKey(name: 'recorded_at') String? get recordedAt;
/// Create a copy of GpsPointEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GpsPointEntityCopyWith<GpsPointEntity> get copyWith => _$GpsPointEntityCopyWithImpl<GpsPointEntity>(this as GpsPointEntity, _$identity);

  /// Serializes this GpsPointEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GpsPointEntity&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.altitude, altitude) || other.altitude == altitude)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,accuracy,altitude,speed,heading,recordedAt);

@override
String toString() {
  return 'GpsPointEntity(latitude: $latitude, longitude: $longitude, accuracy: $accuracy, altitude: $altitude, speed: $speed, heading: $heading, recordedAt: $recordedAt)';
}


}

/// @nodoc
abstract mixin class $GpsPointEntityCopyWith<$Res>  {
  factory $GpsPointEntityCopyWith(GpsPointEntity value, $Res Function(GpsPointEntity) _then) = _$GpsPointEntityCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, double? accuracy, double? altitude, double? speed, double? heading,@JsonKey(name: 'recorded_at') String? recordedAt
});




}
/// @nodoc
class _$GpsPointEntityCopyWithImpl<$Res>
    implements $GpsPointEntityCopyWith<$Res> {
  _$GpsPointEntityCopyWithImpl(this._self, this._then);

  final GpsPointEntity _self;
  final $Res Function(GpsPointEntity) _then;

/// Create a copy of GpsPointEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? accuracy = freezed,Object? altitude = freezed,Object? speed = freezed,Object? heading = freezed,Object? recordedAt = freezed,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,altitude: freezed == altitude ? _self.altitude : altitude // ignore: cast_nullable_to_non_nullable
as double?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double?,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GpsPointEntity].
extension GpsPointEntityPatterns on GpsPointEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( GpsPointEntityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case GpsPointEntityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( GpsPointEntityData value)  $default,){
final _that = this;
switch (_that) {
case GpsPointEntityData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( GpsPointEntityData value)?  $default,){
final _that = this;
switch (_that) {
case GpsPointEntityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude,  double? accuracy,  double? altitude,  double? speed,  double? heading, @JsonKey(name: 'recorded_at')  String? recordedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case GpsPointEntityData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude,  double? accuracy,  double? altitude,  double? speed,  double? heading, @JsonKey(name: 'recorded_at')  String? recordedAt)  $default,) {final _that = this;
switch (_that) {
case GpsPointEntityData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude,  double? accuracy,  double? altitude,  double? speed,  double? heading, @JsonKey(name: 'recorded_at')  String? recordedAt)?  $default,) {final _that = this;
switch (_that) {
case GpsPointEntityData() when $default != null:
return $default(_that.latitude,_that.longitude,_that.accuracy,_that.altitude,_that.speed,_that.heading,_that.recordedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class GpsPointEntityData extends GpsPointEntity {
  const GpsPointEntityData({required this.latitude, required this.longitude, this.accuracy, this.altitude, this.speed, this.heading, @JsonKey(name: 'recorded_at') this.recordedAt}): super._();
  factory GpsPointEntityData.fromJson(Map<String, dynamic> json) => _$GpsPointEntityDataFromJson(json);

@override final  double latitude;
@override final  double longitude;
@override final  double? accuracy;
@override final  double? altitude;
@override final  double? speed;
@override final  double? heading;
@override@JsonKey(name: 'recorded_at') final  String? recordedAt;

/// Create a copy of GpsPointEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GpsPointEntityDataCopyWith<GpsPointEntityData> get copyWith => _$GpsPointEntityDataCopyWithImpl<GpsPointEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GpsPointEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GpsPointEntityData&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.altitude, altitude) || other.altitude == altitude)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,accuracy,altitude,speed,heading,recordedAt);

@override
String toString() {
  return 'GpsPointEntity(latitude: $latitude, longitude: $longitude, accuracy: $accuracy, altitude: $altitude, speed: $speed, heading: $heading, recordedAt: $recordedAt)';
}


}

/// @nodoc
abstract mixin class $GpsPointEntityDataCopyWith<$Res> implements $GpsPointEntityCopyWith<$Res> {
  factory $GpsPointEntityDataCopyWith(GpsPointEntityData value, $Res Function(GpsPointEntityData) _then) = _$GpsPointEntityDataCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude, double? accuracy, double? altitude, double? speed, double? heading,@JsonKey(name: 'recorded_at') String? recordedAt
});




}
/// @nodoc
class _$GpsPointEntityDataCopyWithImpl<$Res>
    implements $GpsPointEntityDataCopyWith<$Res> {
  _$GpsPointEntityDataCopyWithImpl(this._self, this._then);

  final GpsPointEntityData _self;
  final $Res Function(GpsPointEntityData) _then;

/// Create a copy of GpsPointEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? accuracy = freezed,Object? altitude = freezed,Object? speed = freezed,Object? heading = freezed,Object? recordedAt = freezed,}) {
  return _then(GpsPointEntityData(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,altitude: freezed == altitude ? _self.altitude : altitude // ignore: cast_nullable_to_non_nullable
as double?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double?,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

GpsTrackResponse _$GpsTrackResponseFromJson(
  Map<String, dynamic> json
) {
    return GpsTrackResponseData.fromJson(
      json
    );
}

/// @nodoc
mixin _$GpsTrackResponse {

 bool get ok; String? get id;
/// Create a copy of GpsTrackResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GpsTrackResponseCopyWith<GpsTrackResponse> get copyWith => _$GpsTrackResponseCopyWithImpl<GpsTrackResponse>(this as GpsTrackResponse, _$identity);

  /// Serializes this GpsTrackResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GpsTrackResponse&&(identical(other.ok, ok) || other.ok == ok)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok,id);

@override
String toString() {
  return 'GpsTrackResponse(ok: $ok, id: $id)';
}


}

/// @nodoc
abstract mixin class $GpsTrackResponseCopyWith<$Res>  {
  factory $GpsTrackResponseCopyWith(GpsTrackResponse value, $Res Function(GpsTrackResponse) _then) = _$GpsTrackResponseCopyWithImpl;
@useResult
$Res call({
 bool ok, String? id
});




}
/// @nodoc
class _$GpsTrackResponseCopyWithImpl<$Res>
    implements $GpsTrackResponseCopyWith<$Res> {
  _$GpsTrackResponseCopyWithImpl(this._self, this._then);

  final GpsTrackResponse _self;
  final $Res Function(GpsTrackResponse) _then;

/// Create a copy of GpsTrackResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ok = null,Object? id = freezed,}) {
  return _then(_self.copyWith(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GpsTrackResponse].
extension GpsTrackResponsePatterns on GpsTrackResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( GpsTrackResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case GpsTrackResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( GpsTrackResponseData value)  $default,){
final _that = this;
switch (_that) {
case GpsTrackResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( GpsTrackResponseData value)?  $default,){
final _that = this;
switch (_that) {
case GpsTrackResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool ok,  String? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case GpsTrackResponseData() when $default != null:
return $default(_that.ok,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool ok,  String? id)  $default,) {final _that = this;
switch (_that) {
case GpsTrackResponseData():
return $default(_that.ok,_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool ok,  String? id)?  $default,) {final _that = this;
switch (_that) {
case GpsTrackResponseData() when $default != null:
return $default(_that.ok,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class GpsTrackResponseData extends GpsTrackResponse {
  const GpsTrackResponseData({required this.ok, this.id}): super._();
  factory GpsTrackResponseData.fromJson(Map<String, dynamic> json) => _$GpsTrackResponseDataFromJson(json);

@override final  bool ok;
@override final  String? id;

/// Create a copy of GpsTrackResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GpsTrackResponseDataCopyWith<GpsTrackResponseData> get copyWith => _$GpsTrackResponseDataCopyWithImpl<GpsTrackResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GpsTrackResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GpsTrackResponseData&&(identical(other.ok, ok) || other.ok == ok)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok,id);

@override
String toString() {
  return 'GpsTrackResponse(ok: $ok, id: $id)';
}


}

/// @nodoc
abstract mixin class $GpsTrackResponseDataCopyWith<$Res> implements $GpsTrackResponseCopyWith<$Res> {
  factory $GpsTrackResponseDataCopyWith(GpsTrackResponseData value, $Res Function(GpsTrackResponseData) _then) = _$GpsTrackResponseDataCopyWithImpl;
@override @useResult
$Res call({
 bool ok, String? id
});




}
/// @nodoc
class _$GpsTrackResponseDataCopyWithImpl<$Res>
    implements $GpsTrackResponseDataCopyWith<$Res> {
  _$GpsTrackResponseDataCopyWithImpl(this._self, this._then);

  final GpsTrackResponseData _self;
  final $Res Function(GpsTrackResponseData) _then;

/// Create a copy of GpsTrackResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ok = null,Object? id = freezed,}) {
  return _then(GpsTrackResponseData(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
