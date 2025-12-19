// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'round.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Round {

 String get id; String get status; DateTime get startTime; DateTime? get endTime; int? get durationMinutes; int? get totalStrokes; int? get totalPutts; int? get totalPenalties; int? get scoreRelativeToPar; double? get distanceWalked; int? get fairwaysHit; int? get fairwaysTotal; int? get greensInRegulation; int? get greensTotal; String? get weatherConditions; bool get chatgptEnabled; bool get gpsEnabled; String? get notes; Course get course; Tee? get tee; List<HoleScore> get scores;
/// Create a copy of Round
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundCopyWith<Round> get copyWith => _$RoundCopyWithImpl<Round>(this as Round, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Round&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.totalStrokes, totalStrokes) || other.totalStrokes == totalStrokes)&&(identical(other.totalPutts, totalPutts) || other.totalPutts == totalPutts)&&(identical(other.totalPenalties, totalPenalties) || other.totalPenalties == totalPenalties)&&(identical(other.scoreRelativeToPar, scoreRelativeToPar) || other.scoreRelativeToPar == scoreRelativeToPar)&&(identical(other.distanceWalked, distanceWalked) || other.distanceWalked == distanceWalked)&&(identical(other.fairwaysHit, fairwaysHit) || other.fairwaysHit == fairwaysHit)&&(identical(other.fairwaysTotal, fairwaysTotal) || other.fairwaysTotal == fairwaysTotal)&&(identical(other.greensInRegulation, greensInRegulation) || other.greensInRegulation == greensInRegulation)&&(identical(other.greensTotal, greensTotal) || other.greensTotal == greensTotal)&&(identical(other.weatherConditions, weatherConditions) || other.weatherConditions == weatherConditions)&&(identical(other.chatgptEnabled, chatgptEnabled) || other.chatgptEnabled == chatgptEnabled)&&(identical(other.gpsEnabled, gpsEnabled) || other.gpsEnabled == gpsEnabled)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.course, course) || other.course == course)&&(identical(other.tee, tee) || other.tee == tee)&&const DeepCollectionEquality().equals(other.scores, scores));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,status,startTime,endTime,durationMinutes,totalStrokes,totalPutts,totalPenalties,scoreRelativeToPar,distanceWalked,fairwaysHit,fairwaysTotal,greensInRegulation,greensTotal,weatherConditions,chatgptEnabled,gpsEnabled,notes,course,tee,const DeepCollectionEquality().hash(scores)]);

@override
String toString() {
  return 'Round(id: $id, status: $status, startTime: $startTime, endTime: $endTime, durationMinutes: $durationMinutes, totalStrokes: $totalStrokes, totalPutts: $totalPutts, totalPenalties: $totalPenalties, scoreRelativeToPar: $scoreRelativeToPar, distanceWalked: $distanceWalked, fairwaysHit: $fairwaysHit, fairwaysTotal: $fairwaysTotal, greensInRegulation: $greensInRegulation, greensTotal: $greensTotal, weatherConditions: $weatherConditions, chatgptEnabled: $chatgptEnabled, gpsEnabled: $gpsEnabled, notes: $notes, course: $course, tee: $tee, scores: $scores)';
}


}

/// @nodoc
abstract mixin class $RoundCopyWith<$Res>  {
  factory $RoundCopyWith(Round value, $Res Function(Round) _then) = _$RoundCopyWithImpl;
@useResult
$Res call({
 String id, String status, DateTime startTime, DateTime? endTime, int? durationMinutes, int? totalStrokes, int? totalPutts, int? totalPenalties, int? scoreRelativeToPar, double? distanceWalked, int? fairwaysHit, int? fairwaysTotal, int? greensInRegulation, int? greensTotal, String? weatherConditions, bool chatgptEnabled, bool gpsEnabled, String? notes, Course course, Tee? tee, List<HoleScore> scores
});


$CourseCopyWith<$Res> get course;$TeeCopyWith<$Res>? get tee;

}
/// @nodoc
class _$RoundCopyWithImpl<$Res>
    implements $RoundCopyWith<$Res> {
  _$RoundCopyWithImpl(this._self, this._then);

  final Round _self;
  final $Res Function(Round) _then;

/// Create a copy of Round
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? startTime = null,Object? endTime = freezed,Object? durationMinutes = freezed,Object? totalStrokes = freezed,Object? totalPutts = freezed,Object? totalPenalties = freezed,Object? scoreRelativeToPar = freezed,Object? distanceWalked = freezed,Object? fairwaysHit = freezed,Object? fairwaysTotal = freezed,Object? greensInRegulation = freezed,Object? greensTotal = freezed,Object? weatherConditions = freezed,Object? chatgptEnabled = null,Object? gpsEnabled = null,Object? notes = freezed,Object? course = null,Object? tee = freezed,Object? scores = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,durationMinutes: freezed == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int?,totalStrokes: freezed == totalStrokes ? _self.totalStrokes : totalStrokes // ignore: cast_nullable_to_non_nullable
as int?,totalPutts: freezed == totalPutts ? _self.totalPutts : totalPutts // ignore: cast_nullable_to_non_nullable
as int?,totalPenalties: freezed == totalPenalties ? _self.totalPenalties : totalPenalties // ignore: cast_nullable_to_non_nullable
as int?,scoreRelativeToPar: freezed == scoreRelativeToPar ? _self.scoreRelativeToPar : scoreRelativeToPar // ignore: cast_nullable_to_non_nullable
as int?,distanceWalked: freezed == distanceWalked ? _self.distanceWalked : distanceWalked // ignore: cast_nullable_to_non_nullable
as double?,fairwaysHit: freezed == fairwaysHit ? _self.fairwaysHit : fairwaysHit // ignore: cast_nullable_to_non_nullable
as int?,fairwaysTotal: freezed == fairwaysTotal ? _self.fairwaysTotal : fairwaysTotal // ignore: cast_nullable_to_non_nullable
as int?,greensInRegulation: freezed == greensInRegulation ? _self.greensInRegulation : greensInRegulation // ignore: cast_nullable_to_non_nullable
as int?,greensTotal: freezed == greensTotal ? _self.greensTotal : greensTotal // ignore: cast_nullable_to_non_nullable
as int?,weatherConditions: freezed == weatherConditions ? _self.weatherConditions : weatherConditions // ignore: cast_nullable_to_non_nullable
as String?,chatgptEnabled: null == chatgptEnabled ? _self.chatgptEnabled : chatgptEnabled // ignore: cast_nullable_to_non_nullable
as bool,gpsEnabled: null == gpsEnabled ? _self.gpsEnabled : gpsEnabled // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as Course,tee: freezed == tee ? _self.tee : tee // ignore: cast_nullable_to_non_nullable
as Tee?,scores: null == scores ? _self.scores : scores // ignore: cast_nullable_to_non_nullable
as List<HoleScore>,
  ));
}
/// Create a copy of Round
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseCopyWith<$Res> get course {
  
  return $CourseCopyWith<$Res>(_self.course, (value) {
    return _then(_self.copyWith(course: value));
  });
}/// Create a copy of Round
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeeCopyWith<$Res>? get tee {
    if (_self.tee == null) {
    return null;
  }

  return $TeeCopyWith<$Res>(_self.tee!, (value) {
    return _then(_self.copyWith(tee: value));
  });
}
}


/// Adds pattern-matching-related methods to [Round].
extension RoundPatterns on Round {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( RoundData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case RoundData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( RoundData value)  $default,){
final _that = this;
switch (_that) {
case RoundData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( RoundData value)?  $default,){
final _that = this;
switch (_that) {
case RoundData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status,  DateTime startTime,  DateTime? endTime,  int? durationMinutes,  int? totalStrokes,  int? totalPutts,  int? totalPenalties,  int? scoreRelativeToPar,  double? distanceWalked,  int? fairwaysHit,  int? fairwaysTotal,  int? greensInRegulation,  int? greensTotal,  String? weatherConditions,  bool chatgptEnabled,  bool gpsEnabled,  String? notes,  Course course,  Tee? tee,  List<HoleScore> scores)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case RoundData() when $default != null:
return $default(_that.id,_that.status,_that.startTime,_that.endTime,_that.durationMinutes,_that.totalStrokes,_that.totalPutts,_that.totalPenalties,_that.scoreRelativeToPar,_that.distanceWalked,_that.fairwaysHit,_that.fairwaysTotal,_that.greensInRegulation,_that.greensTotal,_that.weatherConditions,_that.chatgptEnabled,_that.gpsEnabled,_that.notes,_that.course,_that.tee,_that.scores);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status,  DateTime startTime,  DateTime? endTime,  int? durationMinutes,  int? totalStrokes,  int? totalPutts,  int? totalPenalties,  int? scoreRelativeToPar,  double? distanceWalked,  int? fairwaysHit,  int? fairwaysTotal,  int? greensInRegulation,  int? greensTotal,  String? weatherConditions,  bool chatgptEnabled,  bool gpsEnabled,  String? notes,  Course course,  Tee? tee,  List<HoleScore> scores)  $default,) {final _that = this;
switch (_that) {
case RoundData():
return $default(_that.id,_that.status,_that.startTime,_that.endTime,_that.durationMinutes,_that.totalStrokes,_that.totalPutts,_that.totalPenalties,_that.scoreRelativeToPar,_that.distanceWalked,_that.fairwaysHit,_that.fairwaysTotal,_that.greensInRegulation,_that.greensTotal,_that.weatherConditions,_that.chatgptEnabled,_that.gpsEnabled,_that.notes,_that.course,_that.tee,_that.scores);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status,  DateTime startTime,  DateTime? endTime,  int? durationMinutes,  int? totalStrokes,  int? totalPutts,  int? totalPenalties,  int? scoreRelativeToPar,  double? distanceWalked,  int? fairwaysHit,  int? fairwaysTotal,  int? greensInRegulation,  int? greensTotal,  String? weatherConditions,  bool chatgptEnabled,  bool gpsEnabled,  String? notes,  Course course,  Tee? tee,  List<HoleScore> scores)?  $default,) {final _that = this;
switch (_that) {
case RoundData() when $default != null:
return $default(_that.id,_that.status,_that.startTime,_that.endTime,_that.durationMinutes,_that.totalStrokes,_that.totalPutts,_that.totalPenalties,_that.scoreRelativeToPar,_that.distanceWalked,_that.fairwaysHit,_that.fairwaysTotal,_that.greensInRegulation,_that.greensTotal,_that.weatherConditions,_that.chatgptEnabled,_that.gpsEnabled,_that.notes,_that.course,_that.tee,_that.scores);case _:
  return null;

}
}

}

/// @nodoc


class RoundData extends Round {
  const RoundData({required this.id, required this.status, required this.startTime, this.endTime, this.durationMinutes, this.totalStrokes, this.totalPutts, this.totalPenalties, this.scoreRelativeToPar, this.distanceWalked, this.fairwaysHit, this.fairwaysTotal, this.greensInRegulation, this.greensTotal, this.weatherConditions, this.chatgptEnabled = false, this.gpsEnabled = true, this.notes, required this.course, this.tee, final  List<HoleScore> scores = const []}): _scores = scores,super._();
  

@override final  String id;
@override final  String status;
@override final  DateTime startTime;
@override final  DateTime? endTime;
@override final  int? durationMinutes;
@override final  int? totalStrokes;
@override final  int? totalPutts;
@override final  int? totalPenalties;
@override final  int? scoreRelativeToPar;
@override final  double? distanceWalked;
@override final  int? fairwaysHit;
@override final  int? fairwaysTotal;
@override final  int? greensInRegulation;
@override final  int? greensTotal;
@override final  String? weatherConditions;
@override@JsonKey() final  bool chatgptEnabled;
@override@JsonKey() final  bool gpsEnabled;
@override final  String? notes;
@override final  Course course;
@override final  Tee? tee;
 final  List<HoleScore> _scores;
@override@JsonKey() List<HoleScore> get scores {
  if (_scores is EqualUnmodifiableListView) return _scores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scores);
}


/// Create a copy of Round
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundDataCopyWith<RoundData> get copyWith => _$RoundDataCopyWithImpl<RoundData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundData&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.totalStrokes, totalStrokes) || other.totalStrokes == totalStrokes)&&(identical(other.totalPutts, totalPutts) || other.totalPutts == totalPutts)&&(identical(other.totalPenalties, totalPenalties) || other.totalPenalties == totalPenalties)&&(identical(other.scoreRelativeToPar, scoreRelativeToPar) || other.scoreRelativeToPar == scoreRelativeToPar)&&(identical(other.distanceWalked, distanceWalked) || other.distanceWalked == distanceWalked)&&(identical(other.fairwaysHit, fairwaysHit) || other.fairwaysHit == fairwaysHit)&&(identical(other.fairwaysTotal, fairwaysTotal) || other.fairwaysTotal == fairwaysTotal)&&(identical(other.greensInRegulation, greensInRegulation) || other.greensInRegulation == greensInRegulation)&&(identical(other.greensTotal, greensTotal) || other.greensTotal == greensTotal)&&(identical(other.weatherConditions, weatherConditions) || other.weatherConditions == weatherConditions)&&(identical(other.chatgptEnabled, chatgptEnabled) || other.chatgptEnabled == chatgptEnabled)&&(identical(other.gpsEnabled, gpsEnabled) || other.gpsEnabled == gpsEnabled)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.course, course) || other.course == course)&&(identical(other.tee, tee) || other.tee == tee)&&const DeepCollectionEquality().equals(other._scores, _scores));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,status,startTime,endTime,durationMinutes,totalStrokes,totalPutts,totalPenalties,scoreRelativeToPar,distanceWalked,fairwaysHit,fairwaysTotal,greensInRegulation,greensTotal,weatherConditions,chatgptEnabled,gpsEnabled,notes,course,tee,const DeepCollectionEquality().hash(_scores)]);

@override
String toString() {
  return 'Round(id: $id, status: $status, startTime: $startTime, endTime: $endTime, durationMinutes: $durationMinutes, totalStrokes: $totalStrokes, totalPutts: $totalPutts, totalPenalties: $totalPenalties, scoreRelativeToPar: $scoreRelativeToPar, distanceWalked: $distanceWalked, fairwaysHit: $fairwaysHit, fairwaysTotal: $fairwaysTotal, greensInRegulation: $greensInRegulation, greensTotal: $greensTotal, weatherConditions: $weatherConditions, chatgptEnabled: $chatgptEnabled, gpsEnabled: $gpsEnabled, notes: $notes, course: $course, tee: $tee, scores: $scores)';
}


}

/// @nodoc
abstract mixin class $RoundDataCopyWith<$Res> implements $RoundCopyWith<$Res> {
  factory $RoundDataCopyWith(RoundData value, $Res Function(RoundData) _then) = _$RoundDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String status, DateTime startTime, DateTime? endTime, int? durationMinutes, int? totalStrokes, int? totalPutts, int? totalPenalties, int? scoreRelativeToPar, double? distanceWalked, int? fairwaysHit, int? fairwaysTotal, int? greensInRegulation, int? greensTotal, String? weatherConditions, bool chatgptEnabled, bool gpsEnabled, String? notes, Course course, Tee? tee, List<HoleScore> scores
});


@override $CourseCopyWith<$Res> get course;@override $TeeCopyWith<$Res>? get tee;

}
/// @nodoc
class _$RoundDataCopyWithImpl<$Res>
    implements $RoundDataCopyWith<$Res> {
  _$RoundDataCopyWithImpl(this._self, this._then);

  final RoundData _self;
  final $Res Function(RoundData) _then;

/// Create a copy of Round
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? startTime = null,Object? endTime = freezed,Object? durationMinutes = freezed,Object? totalStrokes = freezed,Object? totalPutts = freezed,Object? totalPenalties = freezed,Object? scoreRelativeToPar = freezed,Object? distanceWalked = freezed,Object? fairwaysHit = freezed,Object? fairwaysTotal = freezed,Object? greensInRegulation = freezed,Object? greensTotal = freezed,Object? weatherConditions = freezed,Object? chatgptEnabled = null,Object? gpsEnabled = null,Object? notes = freezed,Object? course = null,Object? tee = freezed,Object? scores = null,}) {
  return _then(RoundData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,durationMinutes: freezed == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int?,totalStrokes: freezed == totalStrokes ? _self.totalStrokes : totalStrokes // ignore: cast_nullable_to_non_nullable
as int?,totalPutts: freezed == totalPutts ? _self.totalPutts : totalPutts // ignore: cast_nullable_to_non_nullable
as int?,totalPenalties: freezed == totalPenalties ? _self.totalPenalties : totalPenalties // ignore: cast_nullable_to_non_nullable
as int?,scoreRelativeToPar: freezed == scoreRelativeToPar ? _self.scoreRelativeToPar : scoreRelativeToPar // ignore: cast_nullable_to_non_nullable
as int?,distanceWalked: freezed == distanceWalked ? _self.distanceWalked : distanceWalked // ignore: cast_nullable_to_non_nullable
as double?,fairwaysHit: freezed == fairwaysHit ? _self.fairwaysHit : fairwaysHit // ignore: cast_nullable_to_non_nullable
as int?,fairwaysTotal: freezed == fairwaysTotal ? _self.fairwaysTotal : fairwaysTotal // ignore: cast_nullable_to_non_nullable
as int?,greensInRegulation: freezed == greensInRegulation ? _self.greensInRegulation : greensInRegulation // ignore: cast_nullable_to_non_nullable
as int?,greensTotal: freezed == greensTotal ? _self.greensTotal : greensTotal // ignore: cast_nullable_to_non_nullable
as int?,weatherConditions: freezed == weatherConditions ? _self.weatherConditions : weatherConditions // ignore: cast_nullable_to_non_nullable
as String?,chatgptEnabled: null == chatgptEnabled ? _self.chatgptEnabled : chatgptEnabled // ignore: cast_nullable_to_non_nullable
as bool,gpsEnabled: null == gpsEnabled ? _self.gpsEnabled : gpsEnabled // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as Course,tee: freezed == tee ? _self.tee : tee // ignore: cast_nullable_to_non_nullable
as Tee?,scores: null == scores ? _self._scores : scores // ignore: cast_nullable_to_non_nullable
as List<HoleScore>,
  ));
}

/// Create a copy of Round
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseCopyWith<$Res> get course {
  
  return $CourseCopyWith<$Res>(_self.course, (value) {
    return _then(_self.copyWith(course: value));
  });
}/// Create a copy of Round
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeeCopyWith<$Res>? get tee {
    if (_self.tee == null) {
    return null;
  }

  return $TeeCopyWith<$Res>(_self.tee!, (value) {
    return _then(_self.copyWith(tee: value));
  });
}
}

// dart format on
