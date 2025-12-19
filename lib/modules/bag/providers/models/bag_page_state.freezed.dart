// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bag_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BagPageState {

 List<Club> get clubs; bool get isSaving;
/// Create a copy of BagPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BagPageStateCopyWith<BagPageState> get copyWith => _$BagPageStateCopyWithImpl<BagPageState>(this as BagPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BagPageState&&const DeepCollectionEquality().equals(other.clubs, clubs)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(clubs),isSaving);

@override
String toString() {
  return 'BagPageState(clubs: $clubs, isSaving: $isSaving)';
}


}

/// @nodoc
abstract mixin class $BagPageStateCopyWith<$Res>  {
  factory $BagPageStateCopyWith(BagPageState value, $Res Function(BagPageState) _then) = _$BagPageStateCopyWithImpl;
@useResult
$Res call({
 List<Club> clubs, bool isSaving
});




}
/// @nodoc
class _$BagPageStateCopyWithImpl<$Res>
    implements $BagPageStateCopyWith<$Res> {
  _$BagPageStateCopyWithImpl(this._self, this._then);

  final BagPageState _self;
  final $Res Function(BagPageState) _then;

/// Create a copy of BagPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clubs = null,Object? isSaving = null,}) {
  return _then(_self.copyWith(
clubs: null == clubs ? _self.clubs : clubs // ignore: cast_nullable_to_non_nullable
as List<Club>,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BagPageState].
extension BagPageStatePatterns on BagPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( BagPageStateData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case BagPageStateData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( BagPageStateData value)  $default,){
final _that = this;
switch (_that) {
case BagPageStateData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( BagPageStateData value)?  $default,){
final _that = this;
switch (_that) {
case BagPageStateData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Club> clubs,  bool isSaving)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case BagPageStateData() when $default != null:
return $default(_that.clubs,_that.isSaving);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Club> clubs,  bool isSaving)  $default,) {final _that = this;
switch (_that) {
case BagPageStateData():
return $default(_that.clubs,_that.isSaving);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Club> clubs,  bool isSaving)?  $default,) {final _that = this;
switch (_that) {
case BagPageStateData() when $default != null:
return $default(_that.clubs,_that.isSaving);case _:
  return null;

}
}

}

/// @nodoc


class BagPageStateData extends BagPageState {
  const BagPageStateData({final  List<Club> clubs = const [], this.isSaving = false}): _clubs = clubs,super._();
  

 final  List<Club> _clubs;
@override@JsonKey() List<Club> get clubs {
  if (_clubs is EqualUnmodifiableListView) return _clubs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clubs);
}

@override@JsonKey() final  bool isSaving;

/// Create a copy of BagPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BagPageStateDataCopyWith<BagPageStateData> get copyWith => _$BagPageStateDataCopyWithImpl<BagPageStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BagPageStateData&&const DeepCollectionEquality().equals(other._clubs, _clubs)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_clubs),isSaving);

@override
String toString() {
  return 'BagPageState(clubs: $clubs, isSaving: $isSaving)';
}


}

/// @nodoc
abstract mixin class $BagPageStateDataCopyWith<$Res> implements $BagPageStateCopyWith<$Res> {
  factory $BagPageStateDataCopyWith(BagPageStateData value, $Res Function(BagPageStateData) _then) = _$BagPageStateDataCopyWithImpl;
@override @useResult
$Res call({
 List<Club> clubs, bool isSaving
});




}
/// @nodoc
class _$BagPageStateDataCopyWithImpl<$Res>
    implements $BagPageStateDataCopyWith<$Res> {
  _$BagPageStateDataCopyWithImpl(this._self, this._then);

  final BagPageStateData _self;
  final $Res Function(BagPageStateData) _then;

/// Create a copy of BagPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clubs = null,Object? isSaving = null,}) {
  return _then(BagPageStateData(
clubs: null == clubs ? _self._clubs : clubs // ignore: cast_nullable_to_non_nullable
as List<Club>,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
