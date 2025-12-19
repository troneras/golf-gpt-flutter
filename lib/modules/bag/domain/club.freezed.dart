// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Club {

 String get id; String get clubType; String get displayName; int? get distanceYards; bool get isActive;
/// Create a copy of Club
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClubCopyWith<Club> get copyWith => _$ClubCopyWithImpl<Club>(this as Club, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Club&&(identical(other.id, id) || other.id == id)&&(identical(other.clubType, clubType) || other.clubType == clubType)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.distanceYards, distanceYards) || other.distanceYards == distanceYards)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,clubType,displayName,distanceYards,isActive);

@override
String toString() {
  return 'Club(id: $id, clubType: $clubType, displayName: $displayName, distanceYards: $distanceYards, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $ClubCopyWith<$Res>  {
  factory $ClubCopyWith(Club value, $Res Function(Club) _then) = _$ClubCopyWithImpl;
@useResult
$Res call({
 String id, String clubType, String displayName, int? distanceYards, bool isActive
});




}
/// @nodoc
class _$ClubCopyWithImpl<$Res>
    implements $ClubCopyWith<$Res> {
  _$ClubCopyWithImpl(this._self, this._then);

  final Club _self;
  final $Res Function(Club) _then;

/// Create a copy of Club
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clubType = null,Object? displayName = null,Object? distanceYards = freezed,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clubType: null == clubType ? _self.clubType : clubType // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,distanceYards: freezed == distanceYards ? _self.distanceYards : distanceYards // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Club].
extension ClubPatterns on Club {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( ClubData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case ClubData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( ClubData value)  $default,){
final _that = this;
switch (_that) {
case ClubData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( ClubData value)?  $default,){
final _that = this;
switch (_that) {
case ClubData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clubType,  String displayName,  int? distanceYards,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case ClubData() when $default != null:
return $default(_that.id,_that.clubType,_that.displayName,_that.distanceYards,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clubType,  String displayName,  int? distanceYards,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case ClubData():
return $default(_that.id,_that.clubType,_that.displayName,_that.distanceYards,_that.isActive);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clubType,  String displayName,  int? distanceYards,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case ClubData() when $default != null:
return $default(_that.id,_that.clubType,_that.displayName,_that.distanceYards,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc


class ClubData extends Club {
  const ClubData({required this.id, required this.clubType, required this.displayName, this.distanceYards, required this.isActive}): super._();
  

@override final  String id;
@override final  String clubType;
@override final  String displayName;
@override final  int? distanceYards;
@override final  bool isActive;

/// Create a copy of Club
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClubDataCopyWith<ClubData> get copyWith => _$ClubDataCopyWithImpl<ClubData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClubData&&(identical(other.id, id) || other.id == id)&&(identical(other.clubType, clubType) || other.clubType == clubType)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.distanceYards, distanceYards) || other.distanceYards == distanceYards)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,clubType,displayName,distanceYards,isActive);

@override
String toString() {
  return 'Club(id: $id, clubType: $clubType, displayName: $displayName, distanceYards: $distanceYards, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $ClubDataCopyWith<$Res> implements $ClubCopyWith<$Res> {
  factory $ClubDataCopyWith(ClubData value, $Res Function(ClubData) _then) = _$ClubDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String clubType, String displayName, int? distanceYards, bool isActive
});




}
/// @nodoc
class _$ClubDataCopyWithImpl<$Res>
    implements $ClubDataCopyWith<$Res> {
  _$ClubDataCopyWithImpl(this._self, this._then);

  final ClubData _self;
  final $Res Function(ClubData) _then;

/// Create a copy of Club
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clubType = null,Object? displayName = null,Object? distanceYards = freezed,Object? isActive = null,}) {
  return _then(ClubData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clubType: null == clubType ? _self.clubType : clubType // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,distanceYards: freezed == distanceYards ? _self.distanceYards : distanceYards // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
