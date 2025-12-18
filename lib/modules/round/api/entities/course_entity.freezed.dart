// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CourseEntity _$CourseEntityFromJson(
  Map<String, dynamic> json
) {
    return CourseEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$CourseEntity {

 String get id;@JsonKey(name: 'external_course_id') String? get externalCourseId; String get name; String? get address; String? get city; String? get state; String? get country; double? get latitude; double? get longitude;@JsonKey(name: 'distance_km') double? get distanceKm; List<TeeEntity> get tees;
/// Create a copy of CourseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseEntityCopyWith<CourseEntity> get copyWith => _$CourseEntityCopyWithImpl<CourseEntity>(this as CourseEntity, _$identity);

  /// Serializes this CourseEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.externalCourseId, externalCourseId) || other.externalCourseId == externalCourseId)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&const DeepCollectionEquality().equals(other.tees, tees));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,externalCourseId,name,address,city,state,country,latitude,longitude,distanceKm,const DeepCollectionEquality().hash(tees));

@override
String toString() {
  return 'CourseEntity(id: $id, externalCourseId: $externalCourseId, name: $name, address: $address, city: $city, state: $state, country: $country, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, tees: $tees)';
}


}

/// @nodoc
abstract mixin class $CourseEntityCopyWith<$Res>  {
  factory $CourseEntityCopyWith(CourseEntity value, $Res Function(CourseEntity) _then) = _$CourseEntityCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'external_course_id') String? externalCourseId, String name, String? address, String? city, String? state, String? country, double? latitude, double? longitude,@JsonKey(name: 'distance_km') double? distanceKm, List<TeeEntity> tees
});




}
/// @nodoc
class _$CourseEntityCopyWithImpl<$Res>
    implements $CourseEntityCopyWith<$Res> {
  _$CourseEntityCopyWithImpl(this._self, this._then);

  final CourseEntity _self;
  final $Res Function(CourseEntity) _then;

/// Create a copy of CourseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? externalCourseId = freezed,Object? name = null,Object? address = freezed,Object? city = freezed,Object? state = freezed,Object? country = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? tees = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,externalCourseId: freezed == externalCourseId ? _self.externalCourseId : externalCourseId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,tees: null == tees ? _self.tees : tees // ignore: cast_nullable_to_non_nullable
as List<TeeEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseEntity].
extension CourseEntityPatterns on CourseEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( CourseEntityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case CourseEntityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( CourseEntityData value)  $default,){
final _that = this;
switch (_that) {
case CourseEntityData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( CourseEntityData value)?  $default,){
final _that = this;
switch (_that) {
case CourseEntityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'external_course_id')  String? externalCourseId,  String name,  String? address,  String? city,  String? state,  String? country,  double? latitude,  double? longitude, @JsonKey(name: 'distance_km')  double? distanceKm,  List<TeeEntity> tees)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case CourseEntityData() when $default != null:
return $default(_that.id,_that.externalCourseId,_that.name,_that.address,_that.city,_that.state,_that.country,_that.latitude,_that.longitude,_that.distanceKm,_that.tees);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'external_course_id')  String? externalCourseId,  String name,  String? address,  String? city,  String? state,  String? country,  double? latitude,  double? longitude, @JsonKey(name: 'distance_km')  double? distanceKm,  List<TeeEntity> tees)  $default,) {final _that = this;
switch (_that) {
case CourseEntityData():
return $default(_that.id,_that.externalCourseId,_that.name,_that.address,_that.city,_that.state,_that.country,_that.latitude,_that.longitude,_that.distanceKm,_that.tees);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'external_course_id')  String? externalCourseId,  String name,  String? address,  String? city,  String? state,  String? country,  double? latitude,  double? longitude, @JsonKey(name: 'distance_km')  double? distanceKm,  List<TeeEntity> tees)?  $default,) {final _that = this;
switch (_that) {
case CourseEntityData() when $default != null:
return $default(_that.id,_that.externalCourseId,_that.name,_that.address,_that.city,_that.state,_that.country,_that.latitude,_that.longitude,_that.distanceKm,_that.tees);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class CourseEntityData extends CourseEntity {
  const CourseEntityData({required this.id, @JsonKey(name: 'external_course_id') this.externalCourseId, required this.name, this.address, this.city, this.state, this.country, this.latitude, this.longitude, @JsonKey(name: 'distance_km') this.distanceKm, final  List<TeeEntity> tees = const []}): _tees = tees,super._();
  factory CourseEntityData.fromJson(Map<String, dynamic> json) => _$CourseEntityDataFromJson(json);

@override final  String id;
@override@JsonKey(name: 'external_course_id') final  String? externalCourseId;
@override final  String name;
@override final  String? address;
@override final  String? city;
@override final  String? state;
@override final  String? country;
@override final  double? latitude;
@override final  double? longitude;
@override@JsonKey(name: 'distance_km') final  double? distanceKm;
 final  List<TeeEntity> _tees;
@override@JsonKey() List<TeeEntity> get tees {
  if (_tees is EqualUnmodifiableListView) return _tees;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tees);
}


/// Create a copy of CourseEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseEntityDataCopyWith<CourseEntityData> get copyWith => _$CourseEntityDataCopyWithImpl<CourseEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourseEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseEntityData&&(identical(other.id, id) || other.id == id)&&(identical(other.externalCourseId, externalCourseId) || other.externalCourseId == externalCourseId)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&const DeepCollectionEquality().equals(other._tees, _tees));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,externalCourseId,name,address,city,state,country,latitude,longitude,distanceKm,const DeepCollectionEquality().hash(_tees));

@override
String toString() {
  return 'CourseEntity(id: $id, externalCourseId: $externalCourseId, name: $name, address: $address, city: $city, state: $state, country: $country, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, tees: $tees)';
}


}

/// @nodoc
abstract mixin class $CourseEntityDataCopyWith<$Res> implements $CourseEntityCopyWith<$Res> {
  factory $CourseEntityDataCopyWith(CourseEntityData value, $Res Function(CourseEntityData) _then) = _$CourseEntityDataCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'external_course_id') String? externalCourseId, String name, String? address, String? city, String? state, String? country, double? latitude, double? longitude,@JsonKey(name: 'distance_km') double? distanceKm, List<TeeEntity> tees
});




}
/// @nodoc
class _$CourseEntityDataCopyWithImpl<$Res>
    implements $CourseEntityDataCopyWith<$Res> {
  _$CourseEntityDataCopyWithImpl(this._self, this._then);

  final CourseEntityData _self;
  final $Res Function(CourseEntityData) _then;

/// Create a copy of CourseEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? externalCourseId = freezed,Object? name = null,Object? address = freezed,Object? city = freezed,Object? state = freezed,Object? country = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? tees = null,}) {
  return _then(CourseEntityData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,externalCourseId: freezed == externalCourseId ? _self.externalCourseId : externalCourseId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,tees: null == tees ? _self._tees : tees // ignore: cast_nullable_to_non_nullable
as List<TeeEntity>,
  ));
}


}

ClosestCourseResponse _$ClosestCourseResponseFromJson(
  Map<String, dynamic> json
) {
    return ClosestCourseResponseData.fromJson(
      json
    );
}

/// @nodoc
mixin _$ClosestCourseResponse {

 CourseEntity get course;
/// Create a copy of ClosestCourseResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClosestCourseResponseCopyWith<ClosestCourseResponse> get copyWith => _$ClosestCourseResponseCopyWithImpl<ClosestCourseResponse>(this as ClosestCourseResponse, _$identity);

  /// Serializes this ClosestCourseResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClosestCourseResponse&&(identical(other.course, course) || other.course == course));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,course);

@override
String toString() {
  return 'ClosestCourseResponse(course: $course)';
}


}

/// @nodoc
abstract mixin class $ClosestCourseResponseCopyWith<$Res>  {
  factory $ClosestCourseResponseCopyWith(ClosestCourseResponse value, $Res Function(ClosestCourseResponse) _then) = _$ClosestCourseResponseCopyWithImpl;
@useResult
$Res call({
 CourseEntity course
});


$CourseEntityCopyWith<$Res> get course;

}
/// @nodoc
class _$ClosestCourseResponseCopyWithImpl<$Res>
    implements $ClosestCourseResponseCopyWith<$Res> {
  _$ClosestCourseResponseCopyWithImpl(this._self, this._then);

  final ClosestCourseResponse _self;
  final $Res Function(ClosestCourseResponse) _then;

/// Create a copy of ClosestCourseResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? course = null,}) {
  return _then(_self.copyWith(
course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as CourseEntity,
  ));
}
/// Create a copy of ClosestCourseResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseEntityCopyWith<$Res> get course {
  
  return $CourseEntityCopyWith<$Res>(_self.course, (value) {
    return _then(_self.copyWith(course: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClosestCourseResponse].
extension ClosestCourseResponsePatterns on ClosestCourseResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( ClosestCourseResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case ClosestCourseResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( ClosestCourseResponseData value)  $default,){
final _that = this;
switch (_that) {
case ClosestCourseResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( ClosestCourseResponseData value)?  $default,){
final _that = this;
switch (_that) {
case ClosestCourseResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CourseEntity course)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case ClosestCourseResponseData() when $default != null:
return $default(_that.course);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CourseEntity course)  $default,) {final _that = this;
switch (_that) {
case ClosestCourseResponseData():
return $default(_that.course);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CourseEntity course)?  $default,) {final _that = this;
switch (_that) {
case ClosestCourseResponseData() when $default != null:
return $default(_that.course);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ClosestCourseResponseData extends ClosestCourseResponse {
  const ClosestCourseResponseData({required this.course}): super._();
  factory ClosestCourseResponseData.fromJson(Map<String, dynamic> json) => _$ClosestCourseResponseDataFromJson(json);

@override final  CourseEntity course;

/// Create a copy of ClosestCourseResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClosestCourseResponseDataCopyWith<ClosestCourseResponseData> get copyWith => _$ClosestCourseResponseDataCopyWithImpl<ClosestCourseResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClosestCourseResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClosestCourseResponseData&&(identical(other.course, course) || other.course == course));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,course);

@override
String toString() {
  return 'ClosestCourseResponse(course: $course)';
}


}

/// @nodoc
abstract mixin class $ClosestCourseResponseDataCopyWith<$Res> implements $ClosestCourseResponseCopyWith<$Res> {
  factory $ClosestCourseResponseDataCopyWith(ClosestCourseResponseData value, $Res Function(ClosestCourseResponseData) _then) = _$ClosestCourseResponseDataCopyWithImpl;
@override @useResult
$Res call({
 CourseEntity course
});


@override $CourseEntityCopyWith<$Res> get course;

}
/// @nodoc
class _$ClosestCourseResponseDataCopyWithImpl<$Res>
    implements $ClosestCourseResponseDataCopyWith<$Res> {
  _$ClosestCourseResponseDataCopyWithImpl(this._self, this._then);

  final ClosestCourseResponseData _self;
  final $Res Function(ClosestCourseResponseData) _then;

/// Create a copy of ClosestCourseResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? course = null,}) {
  return _then(ClosestCourseResponseData(
course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as CourseEntity,
  ));
}

/// Create a copy of ClosestCourseResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseEntityCopyWith<$Res> get course {
  
  return $CourseEntityCopyWith<$Res>(_self.course, (value) {
    return _then(_self.copyWith(course: value));
  });
}
}

// dart format on
