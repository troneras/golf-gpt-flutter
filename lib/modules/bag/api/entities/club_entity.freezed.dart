// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ClubEntity _$ClubEntityFromJson(
  Map<String, dynamic> json
) {
    return ClubEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$ClubEntity {

 String get id;@JsonKey(name: 'club_type') String get clubType;@JsonKey(name: 'club_type_name') String get clubTypeName; String? get nickname; String? get brand; String? get model;@JsonKey(name: 'display_name') String get displayName;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'current_distance_yards') int? get currentDistanceYards;@JsonKey(name: 'acquired_at') String? get acquiredAt; String? get notes;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of ClubEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClubEntityCopyWith<ClubEntity> get copyWith => _$ClubEntityCopyWithImpl<ClubEntity>(this as ClubEntity, _$identity);

  /// Serializes this ClubEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClubEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.clubType, clubType) || other.clubType == clubType)&&(identical(other.clubTypeName, clubTypeName) || other.clubTypeName == clubTypeName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.currentDistanceYards, currentDistanceYards) || other.currentDistanceYards == currentDistanceYards)&&(identical(other.acquiredAt, acquiredAt) || other.acquiredAt == acquiredAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clubType,clubTypeName,nickname,brand,model,displayName,isActive,currentDistanceYards,acquiredAt,notes,createdAt);

@override
String toString() {
  return 'ClubEntity(id: $id, clubType: $clubType, clubTypeName: $clubTypeName, nickname: $nickname, brand: $brand, model: $model, displayName: $displayName, isActive: $isActive, currentDistanceYards: $currentDistanceYards, acquiredAt: $acquiredAt, notes: $notes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ClubEntityCopyWith<$Res>  {
  factory $ClubEntityCopyWith(ClubEntity value, $Res Function(ClubEntity) _then) = _$ClubEntityCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'club_type') String clubType,@JsonKey(name: 'club_type_name') String clubTypeName, String? nickname, String? brand, String? model,@JsonKey(name: 'display_name') String displayName,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'current_distance_yards') int? currentDistanceYards,@JsonKey(name: 'acquired_at') String? acquiredAt, String? notes,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$ClubEntityCopyWithImpl<$Res>
    implements $ClubEntityCopyWith<$Res> {
  _$ClubEntityCopyWithImpl(this._self, this._then);

  final ClubEntity _self;
  final $Res Function(ClubEntity) _then;

/// Create a copy of ClubEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clubType = null,Object? clubTypeName = null,Object? nickname = freezed,Object? brand = freezed,Object? model = freezed,Object? displayName = null,Object? isActive = null,Object? currentDistanceYards = freezed,Object? acquiredAt = freezed,Object? notes = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clubType: null == clubType ? _self.clubType : clubType // ignore: cast_nullable_to_non_nullable
as String,clubTypeName: null == clubTypeName ? _self.clubTypeName : clubTypeName // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,currentDistanceYards: freezed == currentDistanceYards ? _self.currentDistanceYards : currentDistanceYards // ignore: cast_nullable_to_non_nullable
as int?,acquiredAt: freezed == acquiredAt ? _self.acquiredAt : acquiredAt // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClubEntity].
extension ClubEntityPatterns on ClubEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( ClubEntityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case ClubEntityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( ClubEntityData value)  $default,){
final _that = this;
switch (_that) {
case ClubEntityData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( ClubEntityData value)?  $default,){
final _that = this;
switch (_that) {
case ClubEntityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'club_type')  String clubType, @JsonKey(name: 'club_type_name')  String clubTypeName,  String? nickname,  String? brand,  String? model, @JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'current_distance_yards')  int? currentDistanceYards, @JsonKey(name: 'acquired_at')  String? acquiredAt,  String? notes, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case ClubEntityData() when $default != null:
return $default(_that.id,_that.clubType,_that.clubTypeName,_that.nickname,_that.brand,_that.model,_that.displayName,_that.isActive,_that.currentDistanceYards,_that.acquiredAt,_that.notes,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'club_type')  String clubType, @JsonKey(name: 'club_type_name')  String clubTypeName,  String? nickname,  String? brand,  String? model, @JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'current_distance_yards')  int? currentDistanceYards, @JsonKey(name: 'acquired_at')  String? acquiredAt,  String? notes, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case ClubEntityData():
return $default(_that.id,_that.clubType,_that.clubTypeName,_that.nickname,_that.brand,_that.model,_that.displayName,_that.isActive,_that.currentDistanceYards,_that.acquiredAt,_that.notes,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'club_type')  String clubType, @JsonKey(name: 'club_type_name')  String clubTypeName,  String? nickname,  String? brand,  String? model, @JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'current_distance_yards')  int? currentDistanceYards, @JsonKey(name: 'acquired_at')  String? acquiredAt,  String? notes, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case ClubEntityData() when $default != null:
return $default(_that.id,_that.clubType,_that.clubTypeName,_that.nickname,_that.brand,_that.model,_that.displayName,_that.isActive,_that.currentDistanceYards,_that.acquiredAt,_that.notes,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ClubEntityData extends ClubEntity {
  const ClubEntityData({required this.id, @JsonKey(name: 'club_type') required this.clubType, @JsonKey(name: 'club_type_name') required this.clubTypeName, this.nickname, this.brand, this.model, @JsonKey(name: 'display_name') required this.displayName, @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'current_distance_yards') this.currentDistanceYards, @JsonKey(name: 'acquired_at') this.acquiredAt, this.notes, @JsonKey(name: 'created_at') this.createdAt}): super._();
  factory ClubEntityData.fromJson(Map<String, dynamic> json) => _$ClubEntityDataFromJson(json);

@override final  String id;
@override@JsonKey(name: 'club_type') final  String clubType;
@override@JsonKey(name: 'club_type_name') final  String clubTypeName;
@override final  String? nickname;
@override final  String? brand;
@override final  String? model;
@override@JsonKey(name: 'display_name') final  String displayName;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'current_distance_yards') final  int? currentDistanceYards;
@override@JsonKey(name: 'acquired_at') final  String? acquiredAt;
@override final  String? notes;
@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of ClubEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClubEntityDataCopyWith<ClubEntityData> get copyWith => _$ClubEntityDataCopyWithImpl<ClubEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClubEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClubEntityData&&(identical(other.id, id) || other.id == id)&&(identical(other.clubType, clubType) || other.clubType == clubType)&&(identical(other.clubTypeName, clubTypeName) || other.clubTypeName == clubTypeName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.currentDistanceYards, currentDistanceYards) || other.currentDistanceYards == currentDistanceYards)&&(identical(other.acquiredAt, acquiredAt) || other.acquiredAt == acquiredAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clubType,clubTypeName,nickname,brand,model,displayName,isActive,currentDistanceYards,acquiredAt,notes,createdAt);

@override
String toString() {
  return 'ClubEntity(id: $id, clubType: $clubType, clubTypeName: $clubTypeName, nickname: $nickname, brand: $brand, model: $model, displayName: $displayName, isActive: $isActive, currentDistanceYards: $currentDistanceYards, acquiredAt: $acquiredAt, notes: $notes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ClubEntityDataCopyWith<$Res> implements $ClubEntityCopyWith<$Res> {
  factory $ClubEntityDataCopyWith(ClubEntityData value, $Res Function(ClubEntityData) _then) = _$ClubEntityDataCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'club_type') String clubType,@JsonKey(name: 'club_type_name') String clubTypeName, String? nickname, String? brand, String? model,@JsonKey(name: 'display_name') String displayName,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'current_distance_yards') int? currentDistanceYards,@JsonKey(name: 'acquired_at') String? acquiredAt, String? notes,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$ClubEntityDataCopyWithImpl<$Res>
    implements $ClubEntityDataCopyWith<$Res> {
  _$ClubEntityDataCopyWithImpl(this._self, this._then);

  final ClubEntityData _self;
  final $Res Function(ClubEntityData) _then;

/// Create a copy of ClubEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clubType = null,Object? clubTypeName = null,Object? nickname = freezed,Object? brand = freezed,Object? model = freezed,Object? displayName = null,Object? isActive = null,Object? currentDistanceYards = freezed,Object? acquiredAt = freezed,Object? notes = freezed,Object? createdAt = freezed,}) {
  return _then(ClubEntityData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clubType: null == clubType ? _self.clubType : clubType // ignore: cast_nullable_to_non_nullable
as String,clubTypeName: null == clubTypeName ? _self.clubTypeName : clubTypeName // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,currentDistanceYards: freezed == currentDistanceYards ? _self.currentDistanceYards : currentDistanceYards // ignore: cast_nullable_to_non_nullable
as int?,acquiredAt: freezed == acquiredAt ? _self.acquiredAt : acquiredAt // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

BagResponse _$BagResponseFromJson(
  Map<String, dynamic> json
) {
    return BagResponseData.fromJson(
      json
    );
}

/// @nodoc
mixin _$BagResponse {

 List<ClubEntity> get clubs;@JsonKey(name: 'total_clubs') int get totalClubs; String? get narrative;
/// Create a copy of BagResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BagResponseCopyWith<BagResponse> get copyWith => _$BagResponseCopyWithImpl<BagResponse>(this as BagResponse, _$identity);

  /// Serializes this BagResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BagResponse&&const DeepCollectionEquality().equals(other.clubs, clubs)&&(identical(other.totalClubs, totalClubs) || other.totalClubs == totalClubs)&&(identical(other.narrative, narrative) || other.narrative == narrative));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(clubs),totalClubs,narrative);

@override
String toString() {
  return 'BagResponse(clubs: $clubs, totalClubs: $totalClubs, narrative: $narrative)';
}


}

/// @nodoc
abstract mixin class $BagResponseCopyWith<$Res>  {
  factory $BagResponseCopyWith(BagResponse value, $Res Function(BagResponse) _then) = _$BagResponseCopyWithImpl;
@useResult
$Res call({
 List<ClubEntity> clubs,@JsonKey(name: 'total_clubs') int totalClubs, String? narrative
});




}
/// @nodoc
class _$BagResponseCopyWithImpl<$Res>
    implements $BagResponseCopyWith<$Res> {
  _$BagResponseCopyWithImpl(this._self, this._then);

  final BagResponse _self;
  final $Res Function(BagResponse) _then;

/// Create a copy of BagResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clubs = null,Object? totalClubs = null,Object? narrative = freezed,}) {
  return _then(_self.copyWith(
clubs: null == clubs ? _self.clubs : clubs // ignore: cast_nullable_to_non_nullable
as List<ClubEntity>,totalClubs: null == totalClubs ? _self.totalClubs : totalClubs // ignore: cast_nullable_to_non_nullable
as int,narrative: freezed == narrative ? _self.narrative : narrative // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BagResponse].
extension BagResponsePatterns on BagResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( BagResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case BagResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( BagResponseData value)  $default,){
final _that = this;
switch (_that) {
case BagResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( BagResponseData value)?  $default,){
final _that = this;
switch (_that) {
case BagResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ClubEntity> clubs, @JsonKey(name: 'total_clubs')  int totalClubs,  String? narrative)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case BagResponseData() when $default != null:
return $default(_that.clubs,_that.totalClubs,_that.narrative);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ClubEntity> clubs, @JsonKey(name: 'total_clubs')  int totalClubs,  String? narrative)  $default,) {final _that = this;
switch (_that) {
case BagResponseData():
return $default(_that.clubs,_that.totalClubs,_that.narrative);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ClubEntity> clubs, @JsonKey(name: 'total_clubs')  int totalClubs,  String? narrative)?  $default,) {final _that = this;
switch (_that) {
case BagResponseData() when $default != null:
return $default(_that.clubs,_that.totalClubs,_that.narrative);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class BagResponseData extends BagResponse {
  const BagResponseData({required final  List<ClubEntity> clubs, @JsonKey(name: 'total_clubs') this.totalClubs = 0, this.narrative}): _clubs = clubs,super._();
  factory BagResponseData.fromJson(Map<String, dynamic> json) => _$BagResponseDataFromJson(json);

 final  List<ClubEntity> _clubs;
@override List<ClubEntity> get clubs {
  if (_clubs is EqualUnmodifiableListView) return _clubs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clubs);
}

@override@JsonKey(name: 'total_clubs') final  int totalClubs;
@override final  String? narrative;

/// Create a copy of BagResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BagResponseDataCopyWith<BagResponseData> get copyWith => _$BagResponseDataCopyWithImpl<BagResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BagResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BagResponseData&&const DeepCollectionEquality().equals(other._clubs, _clubs)&&(identical(other.totalClubs, totalClubs) || other.totalClubs == totalClubs)&&(identical(other.narrative, narrative) || other.narrative == narrative));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_clubs),totalClubs,narrative);

@override
String toString() {
  return 'BagResponse(clubs: $clubs, totalClubs: $totalClubs, narrative: $narrative)';
}


}

/// @nodoc
abstract mixin class $BagResponseDataCopyWith<$Res> implements $BagResponseCopyWith<$Res> {
  factory $BagResponseDataCopyWith(BagResponseData value, $Res Function(BagResponseData) _then) = _$BagResponseDataCopyWithImpl;
@override @useResult
$Res call({
 List<ClubEntity> clubs,@JsonKey(name: 'total_clubs') int totalClubs, String? narrative
});




}
/// @nodoc
class _$BagResponseDataCopyWithImpl<$Res>
    implements $BagResponseDataCopyWith<$Res> {
  _$BagResponseDataCopyWithImpl(this._self, this._then);

  final BagResponseData _self;
  final $Res Function(BagResponseData) _then;

/// Create a copy of BagResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clubs = null,Object? totalClubs = null,Object? narrative = freezed,}) {
  return _then(BagResponseData(
clubs: null == clubs ? _self._clubs : clubs // ignore: cast_nullable_to_non_nullable
as List<ClubEntity>,totalClubs: null == totalClubs ? _self.totalClubs : totalClubs // ignore: cast_nullable_to_non_nullable
as int,narrative: freezed == narrative ? _self.narrative : narrative // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

ClubResponse _$ClubResponseFromJson(
  Map<String, dynamic> json
) {
    return ClubResponseData.fromJson(
      json
    );
}

/// @nodoc
mixin _$ClubResponse {

 ClubEntity get club;
/// Create a copy of ClubResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClubResponseCopyWith<ClubResponse> get copyWith => _$ClubResponseCopyWithImpl<ClubResponse>(this as ClubResponse, _$identity);

  /// Serializes this ClubResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClubResponse&&(identical(other.club, club) || other.club == club));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,club);

@override
String toString() {
  return 'ClubResponse(club: $club)';
}


}

/// @nodoc
abstract mixin class $ClubResponseCopyWith<$Res>  {
  factory $ClubResponseCopyWith(ClubResponse value, $Res Function(ClubResponse) _then) = _$ClubResponseCopyWithImpl;
@useResult
$Res call({
 ClubEntity club
});


$ClubEntityCopyWith<$Res> get club;

}
/// @nodoc
class _$ClubResponseCopyWithImpl<$Res>
    implements $ClubResponseCopyWith<$Res> {
  _$ClubResponseCopyWithImpl(this._self, this._then);

  final ClubResponse _self;
  final $Res Function(ClubResponse) _then;

/// Create a copy of ClubResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? club = null,}) {
  return _then(_self.copyWith(
club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as ClubEntity,
  ));
}
/// Create a copy of ClubResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClubEntityCopyWith<$Res> get club {
  
  return $ClubEntityCopyWith<$Res>(_self.club, (value) {
    return _then(_self.copyWith(club: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClubResponse].
extension ClubResponsePatterns on ClubResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( ClubResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case ClubResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( ClubResponseData value)  $default,){
final _that = this;
switch (_that) {
case ClubResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( ClubResponseData value)?  $default,){
final _that = this;
switch (_that) {
case ClubResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ClubEntity club)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case ClubResponseData() when $default != null:
return $default(_that.club);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ClubEntity club)  $default,) {final _that = this;
switch (_that) {
case ClubResponseData():
return $default(_that.club);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ClubEntity club)?  $default,) {final _that = this;
switch (_that) {
case ClubResponseData() when $default != null:
return $default(_that.club);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ClubResponseData extends ClubResponse {
  const ClubResponseData({required this.club}): super._();
  factory ClubResponseData.fromJson(Map<String, dynamic> json) => _$ClubResponseDataFromJson(json);

@override final  ClubEntity club;

/// Create a copy of ClubResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClubResponseDataCopyWith<ClubResponseData> get copyWith => _$ClubResponseDataCopyWithImpl<ClubResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClubResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClubResponseData&&(identical(other.club, club) || other.club == club));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,club);

@override
String toString() {
  return 'ClubResponse(club: $club)';
}


}

/// @nodoc
abstract mixin class $ClubResponseDataCopyWith<$Res> implements $ClubResponseCopyWith<$Res> {
  factory $ClubResponseDataCopyWith(ClubResponseData value, $Res Function(ClubResponseData) _then) = _$ClubResponseDataCopyWithImpl;
@override @useResult
$Res call({
 ClubEntity club
});


@override $ClubEntityCopyWith<$Res> get club;

}
/// @nodoc
class _$ClubResponseDataCopyWithImpl<$Res>
    implements $ClubResponseDataCopyWith<$Res> {
  _$ClubResponseDataCopyWithImpl(this._self, this._then);

  final ClubResponseData _self;
  final $Res Function(ClubResponseData) _then;

/// Create a copy of ClubResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? club = null,}) {
  return _then(ClubResponseData(
club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as ClubEntity,
  ));
}

/// Create a copy of ClubResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClubEntityCopyWith<$Res> get club {
  
  return $ClubEntityCopyWith<$Res>(_self.club, (value) {
    return _then(_self.copyWith(club: value));
  });
}
}

// dart format on
