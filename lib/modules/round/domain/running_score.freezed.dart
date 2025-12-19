// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'running_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RunningScore {

 int get totalStrokes; int get holesPlayed; int get relativeToPar; int get totalPar;
/// Create a copy of RunningScore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RunningScoreCopyWith<RunningScore> get copyWith => _$RunningScoreCopyWithImpl<RunningScore>(this as RunningScore, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunningScore&&(identical(other.totalStrokes, totalStrokes) || other.totalStrokes == totalStrokes)&&(identical(other.holesPlayed, holesPlayed) || other.holesPlayed == holesPlayed)&&(identical(other.relativeToPar, relativeToPar) || other.relativeToPar == relativeToPar)&&(identical(other.totalPar, totalPar) || other.totalPar == totalPar));
}


@override
int get hashCode => Object.hash(runtimeType,totalStrokes,holesPlayed,relativeToPar,totalPar);

@override
String toString() {
  return 'RunningScore(totalStrokes: $totalStrokes, holesPlayed: $holesPlayed, relativeToPar: $relativeToPar, totalPar: $totalPar)';
}


}

/// @nodoc
abstract mixin class $RunningScoreCopyWith<$Res>  {
  factory $RunningScoreCopyWith(RunningScore value, $Res Function(RunningScore) _then) = _$RunningScoreCopyWithImpl;
@useResult
$Res call({
 int totalStrokes, int holesPlayed, int relativeToPar, int totalPar
});




}
/// @nodoc
class _$RunningScoreCopyWithImpl<$Res>
    implements $RunningScoreCopyWith<$Res> {
  _$RunningScoreCopyWithImpl(this._self, this._then);

  final RunningScore _self;
  final $Res Function(RunningScore) _then;

/// Create a copy of RunningScore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalStrokes = null,Object? holesPlayed = null,Object? relativeToPar = null,Object? totalPar = null,}) {
  return _then(_self.copyWith(
totalStrokes: null == totalStrokes ? _self.totalStrokes : totalStrokes // ignore: cast_nullable_to_non_nullable
as int,holesPlayed: null == holesPlayed ? _self.holesPlayed : holesPlayed // ignore: cast_nullable_to_non_nullable
as int,relativeToPar: null == relativeToPar ? _self.relativeToPar : relativeToPar // ignore: cast_nullable_to_non_nullable
as int,totalPar: null == totalPar ? _self.totalPar : totalPar // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RunningScore].
extension RunningScorePatterns on RunningScore {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( RunningScoreData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case RunningScoreData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( RunningScoreData value)  $default,){
final _that = this;
switch (_that) {
case RunningScoreData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( RunningScoreData value)?  $default,){
final _that = this;
switch (_that) {
case RunningScoreData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalStrokes,  int holesPlayed,  int relativeToPar,  int totalPar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case RunningScoreData() when $default != null:
return $default(_that.totalStrokes,_that.holesPlayed,_that.relativeToPar,_that.totalPar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalStrokes,  int holesPlayed,  int relativeToPar,  int totalPar)  $default,) {final _that = this;
switch (_that) {
case RunningScoreData():
return $default(_that.totalStrokes,_that.holesPlayed,_that.relativeToPar,_that.totalPar);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalStrokes,  int holesPlayed,  int relativeToPar,  int totalPar)?  $default,) {final _that = this;
switch (_that) {
case RunningScoreData() when $default != null:
return $default(_that.totalStrokes,_that.holesPlayed,_that.relativeToPar,_that.totalPar);case _:
  return null;

}
}

}

/// @nodoc


class RunningScoreData extends RunningScore {
  const RunningScoreData({this.totalStrokes = 0, this.holesPlayed = 0, this.relativeToPar = 0, this.totalPar = 0}): super._();
  

@override@JsonKey() final  int totalStrokes;
@override@JsonKey() final  int holesPlayed;
@override@JsonKey() final  int relativeToPar;
@override@JsonKey() final  int totalPar;

/// Create a copy of RunningScore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RunningScoreDataCopyWith<RunningScoreData> get copyWith => _$RunningScoreDataCopyWithImpl<RunningScoreData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunningScoreData&&(identical(other.totalStrokes, totalStrokes) || other.totalStrokes == totalStrokes)&&(identical(other.holesPlayed, holesPlayed) || other.holesPlayed == holesPlayed)&&(identical(other.relativeToPar, relativeToPar) || other.relativeToPar == relativeToPar)&&(identical(other.totalPar, totalPar) || other.totalPar == totalPar));
}


@override
int get hashCode => Object.hash(runtimeType,totalStrokes,holesPlayed,relativeToPar,totalPar);

@override
String toString() {
  return 'RunningScore(totalStrokes: $totalStrokes, holesPlayed: $holesPlayed, relativeToPar: $relativeToPar, totalPar: $totalPar)';
}


}

/// @nodoc
abstract mixin class $RunningScoreDataCopyWith<$Res> implements $RunningScoreCopyWith<$Res> {
  factory $RunningScoreDataCopyWith(RunningScoreData value, $Res Function(RunningScoreData) _then) = _$RunningScoreDataCopyWithImpl;
@override @useResult
$Res call({
 int totalStrokes, int holesPlayed, int relativeToPar, int totalPar
});




}
/// @nodoc
class _$RunningScoreDataCopyWithImpl<$Res>
    implements $RunningScoreDataCopyWith<$Res> {
  _$RunningScoreDataCopyWithImpl(this._self, this._then);

  final RunningScoreData _self;
  final $Res Function(RunningScoreData) _then;

/// Create a copy of RunningScore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalStrokes = null,Object? holesPlayed = null,Object? relativeToPar = null,Object? totalPar = null,}) {
  return _then(RunningScoreData(
totalStrokes: null == totalStrokes ? _self.totalStrokes : totalStrokes // ignore: cast_nullable_to_non_nullable
as int,holesPlayed: null == holesPlayed ? _self.holesPlayed : holesPlayed // ignore: cast_nullable_to_non_nullable
as int,relativeToPar: null == relativeToPar ? _self.relativeToPar : relativeToPar // ignore: cast_nullable_to_non_nullable
as int,totalPar: null == totalPar ? _self.totalPar : totalPar // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$RoundSummary {

 int get totalStrokes; int get relativeToPar; int get totalPutts; int? get fairwaysHit; int? get fairwaysTotal; int? get gir; int? get girTotal; int? get durationMinutes;
/// Create a copy of RoundSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundSummaryCopyWith<RoundSummary> get copyWith => _$RoundSummaryCopyWithImpl<RoundSummary>(this as RoundSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundSummary&&(identical(other.totalStrokes, totalStrokes) || other.totalStrokes == totalStrokes)&&(identical(other.relativeToPar, relativeToPar) || other.relativeToPar == relativeToPar)&&(identical(other.totalPutts, totalPutts) || other.totalPutts == totalPutts)&&(identical(other.fairwaysHit, fairwaysHit) || other.fairwaysHit == fairwaysHit)&&(identical(other.fairwaysTotal, fairwaysTotal) || other.fairwaysTotal == fairwaysTotal)&&(identical(other.gir, gir) || other.gir == gir)&&(identical(other.girTotal, girTotal) || other.girTotal == girTotal)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes));
}


@override
int get hashCode => Object.hash(runtimeType,totalStrokes,relativeToPar,totalPutts,fairwaysHit,fairwaysTotal,gir,girTotal,durationMinutes);

@override
String toString() {
  return 'RoundSummary(totalStrokes: $totalStrokes, relativeToPar: $relativeToPar, totalPutts: $totalPutts, fairwaysHit: $fairwaysHit, fairwaysTotal: $fairwaysTotal, gir: $gir, girTotal: $girTotal, durationMinutes: $durationMinutes)';
}


}

/// @nodoc
abstract mixin class $RoundSummaryCopyWith<$Res>  {
  factory $RoundSummaryCopyWith(RoundSummary value, $Res Function(RoundSummary) _then) = _$RoundSummaryCopyWithImpl;
@useResult
$Res call({
 int totalStrokes, int relativeToPar, int totalPutts, int? fairwaysHit, int? fairwaysTotal, int? gir, int? girTotal, int? durationMinutes
});




}
/// @nodoc
class _$RoundSummaryCopyWithImpl<$Res>
    implements $RoundSummaryCopyWith<$Res> {
  _$RoundSummaryCopyWithImpl(this._self, this._then);

  final RoundSummary _self;
  final $Res Function(RoundSummary) _then;

/// Create a copy of RoundSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalStrokes = null,Object? relativeToPar = null,Object? totalPutts = null,Object? fairwaysHit = freezed,Object? fairwaysTotal = freezed,Object? gir = freezed,Object? girTotal = freezed,Object? durationMinutes = freezed,}) {
  return _then(_self.copyWith(
totalStrokes: null == totalStrokes ? _self.totalStrokes : totalStrokes // ignore: cast_nullable_to_non_nullable
as int,relativeToPar: null == relativeToPar ? _self.relativeToPar : relativeToPar // ignore: cast_nullable_to_non_nullable
as int,totalPutts: null == totalPutts ? _self.totalPutts : totalPutts // ignore: cast_nullable_to_non_nullable
as int,fairwaysHit: freezed == fairwaysHit ? _self.fairwaysHit : fairwaysHit // ignore: cast_nullable_to_non_nullable
as int?,fairwaysTotal: freezed == fairwaysTotal ? _self.fairwaysTotal : fairwaysTotal // ignore: cast_nullable_to_non_nullable
as int?,gir: freezed == gir ? _self.gir : gir // ignore: cast_nullable_to_non_nullable
as int?,girTotal: freezed == girTotal ? _self.girTotal : girTotal // ignore: cast_nullable_to_non_nullable
as int?,durationMinutes: freezed == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RoundSummary].
extension RoundSummaryPatterns on RoundSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( RoundSummaryData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case RoundSummaryData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( RoundSummaryData value)  $default,){
final _that = this;
switch (_that) {
case RoundSummaryData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( RoundSummaryData value)?  $default,){
final _that = this;
switch (_that) {
case RoundSummaryData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalStrokes,  int relativeToPar,  int totalPutts,  int? fairwaysHit,  int? fairwaysTotal,  int? gir,  int? girTotal,  int? durationMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case RoundSummaryData() when $default != null:
return $default(_that.totalStrokes,_that.relativeToPar,_that.totalPutts,_that.fairwaysHit,_that.fairwaysTotal,_that.gir,_that.girTotal,_that.durationMinutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalStrokes,  int relativeToPar,  int totalPutts,  int? fairwaysHit,  int? fairwaysTotal,  int? gir,  int? girTotal,  int? durationMinutes)  $default,) {final _that = this;
switch (_that) {
case RoundSummaryData():
return $default(_that.totalStrokes,_that.relativeToPar,_that.totalPutts,_that.fairwaysHit,_that.fairwaysTotal,_that.gir,_that.girTotal,_that.durationMinutes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalStrokes,  int relativeToPar,  int totalPutts,  int? fairwaysHit,  int? fairwaysTotal,  int? gir,  int? girTotal,  int? durationMinutes)?  $default,) {final _that = this;
switch (_that) {
case RoundSummaryData() when $default != null:
return $default(_that.totalStrokes,_that.relativeToPar,_that.totalPutts,_that.fairwaysHit,_that.fairwaysTotal,_that.gir,_that.girTotal,_that.durationMinutes);case _:
  return null;

}
}

}

/// @nodoc


class RoundSummaryData extends RoundSummary {
  const RoundSummaryData({this.totalStrokes = 0, this.relativeToPar = 0, this.totalPutts = 0, this.fairwaysHit, this.fairwaysTotal, this.gir, this.girTotal, this.durationMinutes}): super._();
  

@override@JsonKey() final  int totalStrokes;
@override@JsonKey() final  int relativeToPar;
@override@JsonKey() final  int totalPutts;
@override final  int? fairwaysHit;
@override final  int? fairwaysTotal;
@override final  int? gir;
@override final  int? girTotal;
@override final  int? durationMinutes;

/// Create a copy of RoundSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundSummaryDataCopyWith<RoundSummaryData> get copyWith => _$RoundSummaryDataCopyWithImpl<RoundSummaryData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundSummaryData&&(identical(other.totalStrokes, totalStrokes) || other.totalStrokes == totalStrokes)&&(identical(other.relativeToPar, relativeToPar) || other.relativeToPar == relativeToPar)&&(identical(other.totalPutts, totalPutts) || other.totalPutts == totalPutts)&&(identical(other.fairwaysHit, fairwaysHit) || other.fairwaysHit == fairwaysHit)&&(identical(other.fairwaysTotal, fairwaysTotal) || other.fairwaysTotal == fairwaysTotal)&&(identical(other.gir, gir) || other.gir == gir)&&(identical(other.girTotal, girTotal) || other.girTotal == girTotal)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes));
}


@override
int get hashCode => Object.hash(runtimeType,totalStrokes,relativeToPar,totalPutts,fairwaysHit,fairwaysTotal,gir,girTotal,durationMinutes);

@override
String toString() {
  return 'RoundSummary(totalStrokes: $totalStrokes, relativeToPar: $relativeToPar, totalPutts: $totalPutts, fairwaysHit: $fairwaysHit, fairwaysTotal: $fairwaysTotal, gir: $gir, girTotal: $girTotal, durationMinutes: $durationMinutes)';
}


}

/// @nodoc
abstract mixin class $RoundSummaryDataCopyWith<$Res> implements $RoundSummaryCopyWith<$Res> {
  factory $RoundSummaryDataCopyWith(RoundSummaryData value, $Res Function(RoundSummaryData) _then) = _$RoundSummaryDataCopyWithImpl;
@override @useResult
$Res call({
 int totalStrokes, int relativeToPar, int totalPutts, int? fairwaysHit, int? fairwaysTotal, int? gir, int? girTotal, int? durationMinutes
});




}
/// @nodoc
class _$RoundSummaryDataCopyWithImpl<$Res>
    implements $RoundSummaryDataCopyWith<$Res> {
  _$RoundSummaryDataCopyWithImpl(this._self, this._then);

  final RoundSummaryData _self;
  final $Res Function(RoundSummaryData) _then;

/// Create a copy of RoundSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalStrokes = null,Object? relativeToPar = null,Object? totalPutts = null,Object? fairwaysHit = freezed,Object? fairwaysTotal = freezed,Object? gir = freezed,Object? girTotal = freezed,Object? durationMinutes = freezed,}) {
  return _then(RoundSummaryData(
totalStrokes: null == totalStrokes ? _self.totalStrokes : totalStrokes // ignore: cast_nullable_to_non_nullable
as int,relativeToPar: null == relativeToPar ? _self.relativeToPar : relativeToPar // ignore: cast_nullable_to_non_nullable
as int,totalPutts: null == totalPutts ? _self.totalPutts : totalPutts // ignore: cast_nullable_to_non_nullable
as int,fairwaysHit: freezed == fairwaysHit ? _self.fairwaysHit : fairwaysHit // ignore: cast_nullable_to_non_nullable
as int?,fairwaysTotal: freezed == fairwaysTotal ? _self.fairwaysTotal : fairwaysTotal // ignore: cast_nullable_to_non_nullable
as int?,gir: freezed == gir ? _self.gir : gir // ignore: cast_nullable_to_non_nullable
as int?,girTotal: freezed == girTotal ? _self.girTotal : girTotal // ignore: cast_nullable_to_non_nullable
as int?,durationMinutes: freezed == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
