// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Course {

 String get id; String get name; String? get clubName; String? get externalCourseId; String? get address; String? get city; String? get state; String? get country; double? get latitude; double? get longitude; double? get distanceKm; List<Tee> get tees;
/// Create a copy of Course
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseCopyWith<Course> get copyWith => _$CourseCopyWithImpl<Course>(this as Course, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Course&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.clubName, clubName) || other.clubName == clubName)&&(identical(other.externalCourseId, externalCourseId) || other.externalCourseId == externalCourseId)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&const DeepCollectionEquality().equals(other.tees, tees));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,clubName,externalCourseId,address,city,state,country,latitude,longitude,distanceKm,const DeepCollectionEquality().hash(tees));

@override
String toString() {
  return 'Course(id: $id, name: $name, clubName: $clubName, externalCourseId: $externalCourseId, address: $address, city: $city, state: $state, country: $country, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, tees: $tees)';
}


}

/// @nodoc
abstract mixin class $CourseCopyWith<$Res>  {
  factory $CourseCopyWith(Course value, $Res Function(Course) _then) = _$CourseCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? clubName, String? externalCourseId, String? address, String? city, String? state, String? country, double? latitude, double? longitude, double? distanceKm, List<Tee> tees
});




}
/// @nodoc
class _$CourseCopyWithImpl<$Res>
    implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._self, this._then);

  final Course _self;
  final $Res Function(Course) _then;

/// Create a copy of Course
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? clubName = freezed,Object? externalCourseId = freezed,Object? address = freezed,Object? city = freezed,Object? state = freezed,Object? country = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? tees = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,clubName: freezed == clubName ? _self.clubName : clubName // ignore: cast_nullable_to_non_nullable
as String?,externalCourseId: freezed == externalCourseId ? _self.externalCourseId : externalCourseId // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,tees: null == tees ? _self.tees : tees // ignore: cast_nullable_to_non_nullable
as List<Tee>,
  ));
}

}


/// Adds pattern-matching-related methods to [Course].
extension CoursePatterns on Course {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( CourseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case CourseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( CourseData value)  $default,){
final _that = this;
switch (_that) {
case CourseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( CourseData value)?  $default,){
final _that = this;
switch (_that) {
case CourseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? clubName,  String? externalCourseId,  String? address,  String? city,  String? state,  String? country,  double? latitude,  double? longitude,  double? distanceKm,  List<Tee> tees)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case CourseData() when $default != null:
return $default(_that.id,_that.name,_that.clubName,_that.externalCourseId,_that.address,_that.city,_that.state,_that.country,_that.latitude,_that.longitude,_that.distanceKm,_that.tees);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? clubName,  String? externalCourseId,  String? address,  String? city,  String? state,  String? country,  double? latitude,  double? longitude,  double? distanceKm,  List<Tee> tees)  $default,) {final _that = this;
switch (_that) {
case CourseData():
return $default(_that.id,_that.name,_that.clubName,_that.externalCourseId,_that.address,_that.city,_that.state,_that.country,_that.latitude,_that.longitude,_that.distanceKm,_that.tees);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? clubName,  String? externalCourseId,  String? address,  String? city,  String? state,  String? country,  double? latitude,  double? longitude,  double? distanceKm,  List<Tee> tees)?  $default,) {final _that = this;
switch (_that) {
case CourseData() when $default != null:
return $default(_that.id,_that.name,_that.clubName,_that.externalCourseId,_that.address,_that.city,_that.state,_that.country,_that.latitude,_that.longitude,_that.distanceKm,_that.tees);case _:
  return null;

}
}

}

/// @nodoc


class CourseData extends Course {
  const CourseData({required this.id, required this.name, this.clubName, this.externalCourseId, this.address, this.city, this.state, this.country, this.latitude, this.longitude, this.distanceKm, final  List<Tee> tees = const []}): _tees = tees,super._();
  

@override final  String id;
@override final  String name;
@override final  String? clubName;
@override final  String? externalCourseId;
@override final  String? address;
@override final  String? city;
@override final  String? state;
@override final  String? country;
@override final  double? latitude;
@override final  double? longitude;
@override final  double? distanceKm;
 final  List<Tee> _tees;
@override@JsonKey() List<Tee> get tees {
  if (_tees is EqualUnmodifiableListView) return _tees;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tees);
}


/// Create a copy of Course
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseDataCopyWith<CourseData> get copyWith => _$CourseDataCopyWithImpl<CourseData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.clubName, clubName) || other.clubName == clubName)&&(identical(other.externalCourseId, externalCourseId) || other.externalCourseId == externalCourseId)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&const DeepCollectionEquality().equals(other._tees, _tees));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,clubName,externalCourseId,address,city,state,country,latitude,longitude,distanceKm,const DeepCollectionEquality().hash(_tees));

@override
String toString() {
  return 'Course(id: $id, name: $name, clubName: $clubName, externalCourseId: $externalCourseId, address: $address, city: $city, state: $state, country: $country, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, tees: $tees)';
}


}

/// @nodoc
abstract mixin class $CourseDataCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory $CourseDataCopyWith(CourseData value, $Res Function(CourseData) _then) = _$CourseDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? clubName, String? externalCourseId, String? address, String? city, String? state, String? country, double? latitude, double? longitude, double? distanceKm, List<Tee> tees
});




}
/// @nodoc
class _$CourseDataCopyWithImpl<$Res>
    implements $CourseDataCopyWith<$Res> {
  _$CourseDataCopyWithImpl(this._self, this._then);

  final CourseData _self;
  final $Res Function(CourseData) _then;

/// Create a copy of Course
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? clubName = freezed,Object? externalCourseId = freezed,Object? address = freezed,Object? city = freezed,Object? state = freezed,Object? country = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? tees = null,}) {
  return _then(CourseData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,clubName: freezed == clubName ? _self.clubName : clubName // ignore: cast_nullable_to_non_nullable
as String?,externalCourseId: freezed == externalCourseId ? _self.externalCourseId : externalCourseId // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,tees: null == tees ? _self._tees : tees // ignore: cast_nullable_to_non_nullable
as List<Tee>,
  ));
}


}

// dart format on
