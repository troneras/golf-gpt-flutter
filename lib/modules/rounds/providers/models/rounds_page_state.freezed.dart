// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rounds_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoundsPageState {

 List<Round> get rounds; int get total; bool get isLoadingMore; bool get hasMore;
/// Create a copy of RoundsPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundsPageStateCopyWith<RoundsPageState> get copyWith => _$RoundsPageStateCopyWithImpl<RoundsPageState>(this as RoundsPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundsPageState&&const DeepCollectionEquality().equals(other.rounds, rounds)&&(identical(other.total, total) || other.total == total)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(rounds),total,isLoadingMore,hasMore);

@override
String toString() {
  return 'RoundsPageState(rounds: $rounds, total: $total, isLoadingMore: $isLoadingMore, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $RoundsPageStateCopyWith<$Res>  {
  factory $RoundsPageStateCopyWith(RoundsPageState value, $Res Function(RoundsPageState) _then) = _$RoundsPageStateCopyWithImpl;
@useResult
$Res call({
 List<Round> rounds, int total, bool isLoadingMore, bool hasMore
});




}
/// @nodoc
class _$RoundsPageStateCopyWithImpl<$Res>
    implements $RoundsPageStateCopyWith<$Res> {
  _$RoundsPageStateCopyWithImpl(this._self, this._then);

  final RoundsPageState _self;
  final $Res Function(RoundsPageState) _then;

/// Create a copy of RoundsPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rounds = null,Object? total = null,Object? isLoadingMore = null,Object? hasMore = null,}) {
  return _then(_self.copyWith(
rounds: null == rounds ? _self.rounds : rounds // ignore: cast_nullable_to_non_nullable
as List<Round>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RoundsPageState].
extension RoundsPageStatePatterns on RoundsPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( RoundsPageStateData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case RoundsPageStateData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( RoundsPageStateData value)  $default,){
final _that = this;
switch (_that) {
case RoundsPageStateData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( RoundsPageStateData value)?  $default,){
final _that = this;
switch (_that) {
case RoundsPageStateData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Round> rounds,  int total,  bool isLoadingMore,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case RoundsPageStateData() when $default != null:
return $default(_that.rounds,_that.total,_that.isLoadingMore,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Round> rounds,  int total,  bool isLoadingMore,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case RoundsPageStateData():
return $default(_that.rounds,_that.total,_that.isLoadingMore,_that.hasMore);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Round> rounds,  int total,  bool isLoadingMore,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case RoundsPageStateData() when $default != null:
return $default(_that.rounds,_that.total,_that.isLoadingMore,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc


class RoundsPageStateData extends RoundsPageState {
  const RoundsPageStateData({final  List<Round> rounds = const [], this.total = 0, this.isLoadingMore = false, this.hasMore = false}): _rounds = rounds,super._();
  

 final  List<Round> _rounds;
@override@JsonKey() List<Round> get rounds {
  if (_rounds is EqualUnmodifiableListView) return _rounds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rounds);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool hasMore;

/// Create a copy of RoundsPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundsPageStateDataCopyWith<RoundsPageStateData> get copyWith => _$RoundsPageStateDataCopyWithImpl<RoundsPageStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundsPageStateData&&const DeepCollectionEquality().equals(other._rounds, _rounds)&&(identical(other.total, total) || other.total == total)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_rounds),total,isLoadingMore,hasMore);

@override
String toString() {
  return 'RoundsPageState(rounds: $rounds, total: $total, isLoadingMore: $isLoadingMore, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $RoundsPageStateDataCopyWith<$Res> implements $RoundsPageStateCopyWith<$Res> {
  factory $RoundsPageStateDataCopyWith(RoundsPageStateData value, $Res Function(RoundsPageStateData) _then) = _$RoundsPageStateDataCopyWithImpl;
@override @useResult
$Res call({
 List<Round> rounds, int total, bool isLoadingMore, bool hasMore
});




}
/// @nodoc
class _$RoundsPageStateDataCopyWithImpl<$Res>
    implements $RoundsPageStateDataCopyWith<$Res> {
  _$RoundsPageStateDataCopyWithImpl(this._self, this._then);

  final RoundsPageStateData _self;
  final $Res Function(RoundsPageStateData) _then;

/// Create a copy of RoundsPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rounds = null,Object? total = null,Object? isLoadingMore = null,Object? hasMore = null,}) {
  return _then(RoundsPageStateData(
rounds: null == rounds ? _self._rounds : rounds // ignore: cast_nullable_to_non_nullable
as List<Round>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
