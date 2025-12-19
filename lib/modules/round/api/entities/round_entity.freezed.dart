// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'round_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
RoundEntity _$RoundEntityFromJson(
  Map<String, dynamic> json
) {
    return RoundEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$RoundEntity {

 String get id;@JsonKey(name: 'course_id') String? get courseId;@JsonKey(name: 'tee_id') String? get teeId; String get status;@JsonKey(name: 'start_time') String get startTime;@JsonKey(name: 'end_time') String? get endTime;@JsonKey(name: 'duration_minutes') int? get durationMinutes;@JsonKey(name: 'total_strokes') int? get totalStrokes;@JsonKey(name: 'total_putts') int? get totalPutts;@JsonKey(name: 'total_penalties') int? get totalPenalties;@JsonKey(name: 'score_relative_to_par') int? get scoreRelativeToPar;@JsonKey(name: 'distance_walked') double? get distanceWalked;@JsonKey(name: 'fairways_hit') int? get fairwaysHit;@JsonKey(name: 'fairways_total') int? get fairwaysTotal;@JsonKey(name: 'greens_in_regulation') int? get greensInRegulation;@JsonKey(name: 'greens_total') int? get greensTotal;@JsonKey(name: 'weather_conditions') String? get weatherConditions;@JsonKey(name: 'chatgpt_enabled') bool get chatgptEnabled;@JsonKey(name: 'gps_enabled') bool get gpsEnabled; String? get notes; CourseEntity? get course; TeeEntity? get tee; List<HoleScoreEntity> get scores;
/// Create a copy of RoundEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundEntityCopyWith<RoundEntity> get copyWith => _$RoundEntityCopyWithImpl<RoundEntity>(this as RoundEntity, _$identity);

  /// Serializes this RoundEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.teeId, teeId) || other.teeId == teeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.totalStrokes, totalStrokes) || other.totalStrokes == totalStrokes)&&(identical(other.totalPutts, totalPutts) || other.totalPutts == totalPutts)&&(identical(other.totalPenalties, totalPenalties) || other.totalPenalties == totalPenalties)&&(identical(other.scoreRelativeToPar, scoreRelativeToPar) || other.scoreRelativeToPar == scoreRelativeToPar)&&(identical(other.distanceWalked, distanceWalked) || other.distanceWalked == distanceWalked)&&(identical(other.fairwaysHit, fairwaysHit) || other.fairwaysHit == fairwaysHit)&&(identical(other.fairwaysTotal, fairwaysTotal) || other.fairwaysTotal == fairwaysTotal)&&(identical(other.greensInRegulation, greensInRegulation) || other.greensInRegulation == greensInRegulation)&&(identical(other.greensTotal, greensTotal) || other.greensTotal == greensTotal)&&(identical(other.weatherConditions, weatherConditions) || other.weatherConditions == weatherConditions)&&(identical(other.chatgptEnabled, chatgptEnabled) || other.chatgptEnabled == chatgptEnabled)&&(identical(other.gpsEnabled, gpsEnabled) || other.gpsEnabled == gpsEnabled)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.course, course) || other.course == course)&&(identical(other.tee, tee) || other.tee == tee)&&const DeepCollectionEquality().equals(other.scores, scores));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,courseId,teeId,status,startTime,endTime,durationMinutes,totalStrokes,totalPutts,totalPenalties,scoreRelativeToPar,distanceWalked,fairwaysHit,fairwaysTotal,greensInRegulation,greensTotal,weatherConditions,chatgptEnabled,gpsEnabled,notes,course,tee,const DeepCollectionEquality().hash(scores)]);

@override
String toString() {
  return 'RoundEntity(id: $id, courseId: $courseId, teeId: $teeId, status: $status, startTime: $startTime, endTime: $endTime, durationMinutes: $durationMinutes, totalStrokes: $totalStrokes, totalPutts: $totalPutts, totalPenalties: $totalPenalties, scoreRelativeToPar: $scoreRelativeToPar, distanceWalked: $distanceWalked, fairwaysHit: $fairwaysHit, fairwaysTotal: $fairwaysTotal, greensInRegulation: $greensInRegulation, greensTotal: $greensTotal, weatherConditions: $weatherConditions, chatgptEnabled: $chatgptEnabled, gpsEnabled: $gpsEnabled, notes: $notes, course: $course, tee: $tee, scores: $scores)';
}


}

/// @nodoc
abstract mixin class $RoundEntityCopyWith<$Res>  {
  factory $RoundEntityCopyWith(RoundEntity value, $Res Function(RoundEntity) _then) = _$RoundEntityCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'course_id') String? courseId,@JsonKey(name: 'tee_id') String? teeId, String status,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String? endTime,@JsonKey(name: 'duration_minutes') int? durationMinutes,@JsonKey(name: 'total_strokes') int? totalStrokes,@JsonKey(name: 'total_putts') int? totalPutts,@JsonKey(name: 'total_penalties') int? totalPenalties,@JsonKey(name: 'score_relative_to_par') int? scoreRelativeToPar,@JsonKey(name: 'distance_walked') double? distanceWalked,@JsonKey(name: 'fairways_hit') int? fairwaysHit,@JsonKey(name: 'fairways_total') int? fairwaysTotal,@JsonKey(name: 'greens_in_regulation') int? greensInRegulation,@JsonKey(name: 'greens_total') int? greensTotal,@JsonKey(name: 'weather_conditions') String? weatherConditions,@JsonKey(name: 'chatgpt_enabled') bool chatgptEnabled,@JsonKey(name: 'gps_enabled') bool gpsEnabled, String? notes, CourseEntity? course, TeeEntity? tee, List<HoleScoreEntity> scores
});


$CourseEntityCopyWith<$Res>? get course;$TeeEntityCopyWith<$Res>? get tee;

}
/// @nodoc
class _$RoundEntityCopyWithImpl<$Res>
    implements $RoundEntityCopyWith<$Res> {
  _$RoundEntityCopyWithImpl(this._self, this._then);

  final RoundEntity _self;
  final $Res Function(RoundEntity) _then;

/// Create a copy of RoundEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? courseId = freezed,Object? teeId = freezed,Object? status = null,Object? startTime = null,Object? endTime = freezed,Object? durationMinutes = freezed,Object? totalStrokes = freezed,Object? totalPutts = freezed,Object? totalPenalties = freezed,Object? scoreRelativeToPar = freezed,Object? distanceWalked = freezed,Object? fairwaysHit = freezed,Object? fairwaysTotal = freezed,Object? greensInRegulation = freezed,Object? greensTotal = freezed,Object? weatherConditions = freezed,Object? chatgptEnabled = null,Object? gpsEnabled = null,Object? notes = freezed,Object? course = freezed,Object? tee = freezed,Object? scores = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,teeId: freezed == teeId ? _self.teeId : teeId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,durationMinutes: freezed == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
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
as String?,course: freezed == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as CourseEntity?,tee: freezed == tee ? _self.tee : tee // ignore: cast_nullable_to_non_nullable
as TeeEntity?,scores: null == scores ? _self.scores : scores // ignore: cast_nullable_to_non_nullable
as List<HoleScoreEntity>,
  ));
}
/// Create a copy of RoundEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseEntityCopyWith<$Res>? get course {
    if (_self.course == null) {
    return null;
  }

  return $CourseEntityCopyWith<$Res>(_self.course!, (value) {
    return _then(_self.copyWith(course: value));
  });
}/// Create a copy of RoundEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeeEntityCopyWith<$Res>? get tee {
    if (_self.tee == null) {
    return null;
  }

  return $TeeEntityCopyWith<$Res>(_self.tee!, (value) {
    return _then(_self.copyWith(tee: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoundEntity].
extension RoundEntityPatterns on RoundEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( RoundEntityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case RoundEntityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( RoundEntityData value)  $default,){
final _that = this;
switch (_that) {
case RoundEntityData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( RoundEntityData value)?  $default,){
final _that = this;
switch (_that) {
case RoundEntityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'course_id')  String? courseId, @JsonKey(name: 'tee_id')  String? teeId,  String status, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String? endTime, @JsonKey(name: 'duration_minutes')  int? durationMinutes, @JsonKey(name: 'total_strokes')  int? totalStrokes, @JsonKey(name: 'total_putts')  int? totalPutts, @JsonKey(name: 'total_penalties')  int? totalPenalties, @JsonKey(name: 'score_relative_to_par')  int? scoreRelativeToPar, @JsonKey(name: 'distance_walked')  double? distanceWalked, @JsonKey(name: 'fairways_hit')  int? fairwaysHit, @JsonKey(name: 'fairways_total')  int? fairwaysTotal, @JsonKey(name: 'greens_in_regulation')  int? greensInRegulation, @JsonKey(name: 'greens_total')  int? greensTotal, @JsonKey(name: 'weather_conditions')  String? weatherConditions, @JsonKey(name: 'chatgpt_enabled')  bool chatgptEnabled, @JsonKey(name: 'gps_enabled')  bool gpsEnabled,  String? notes,  CourseEntity? course,  TeeEntity? tee,  List<HoleScoreEntity> scores)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case RoundEntityData() when $default != null:
return $default(_that.id,_that.courseId,_that.teeId,_that.status,_that.startTime,_that.endTime,_that.durationMinutes,_that.totalStrokes,_that.totalPutts,_that.totalPenalties,_that.scoreRelativeToPar,_that.distanceWalked,_that.fairwaysHit,_that.fairwaysTotal,_that.greensInRegulation,_that.greensTotal,_that.weatherConditions,_that.chatgptEnabled,_that.gpsEnabled,_that.notes,_that.course,_that.tee,_that.scores);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'course_id')  String? courseId, @JsonKey(name: 'tee_id')  String? teeId,  String status, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String? endTime, @JsonKey(name: 'duration_minutes')  int? durationMinutes, @JsonKey(name: 'total_strokes')  int? totalStrokes, @JsonKey(name: 'total_putts')  int? totalPutts, @JsonKey(name: 'total_penalties')  int? totalPenalties, @JsonKey(name: 'score_relative_to_par')  int? scoreRelativeToPar, @JsonKey(name: 'distance_walked')  double? distanceWalked, @JsonKey(name: 'fairways_hit')  int? fairwaysHit, @JsonKey(name: 'fairways_total')  int? fairwaysTotal, @JsonKey(name: 'greens_in_regulation')  int? greensInRegulation, @JsonKey(name: 'greens_total')  int? greensTotal, @JsonKey(name: 'weather_conditions')  String? weatherConditions, @JsonKey(name: 'chatgpt_enabled')  bool chatgptEnabled, @JsonKey(name: 'gps_enabled')  bool gpsEnabled,  String? notes,  CourseEntity? course,  TeeEntity? tee,  List<HoleScoreEntity> scores)  $default,) {final _that = this;
switch (_that) {
case RoundEntityData():
return $default(_that.id,_that.courseId,_that.teeId,_that.status,_that.startTime,_that.endTime,_that.durationMinutes,_that.totalStrokes,_that.totalPutts,_that.totalPenalties,_that.scoreRelativeToPar,_that.distanceWalked,_that.fairwaysHit,_that.fairwaysTotal,_that.greensInRegulation,_that.greensTotal,_that.weatherConditions,_that.chatgptEnabled,_that.gpsEnabled,_that.notes,_that.course,_that.tee,_that.scores);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'course_id')  String? courseId, @JsonKey(name: 'tee_id')  String? teeId,  String status, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String? endTime, @JsonKey(name: 'duration_minutes')  int? durationMinutes, @JsonKey(name: 'total_strokes')  int? totalStrokes, @JsonKey(name: 'total_putts')  int? totalPutts, @JsonKey(name: 'total_penalties')  int? totalPenalties, @JsonKey(name: 'score_relative_to_par')  int? scoreRelativeToPar, @JsonKey(name: 'distance_walked')  double? distanceWalked, @JsonKey(name: 'fairways_hit')  int? fairwaysHit, @JsonKey(name: 'fairways_total')  int? fairwaysTotal, @JsonKey(name: 'greens_in_regulation')  int? greensInRegulation, @JsonKey(name: 'greens_total')  int? greensTotal, @JsonKey(name: 'weather_conditions')  String? weatherConditions, @JsonKey(name: 'chatgpt_enabled')  bool chatgptEnabled, @JsonKey(name: 'gps_enabled')  bool gpsEnabled,  String? notes,  CourseEntity? course,  TeeEntity? tee,  List<HoleScoreEntity> scores)?  $default,) {final _that = this;
switch (_that) {
case RoundEntityData() when $default != null:
return $default(_that.id,_that.courseId,_that.teeId,_that.status,_that.startTime,_that.endTime,_that.durationMinutes,_that.totalStrokes,_that.totalPutts,_that.totalPenalties,_that.scoreRelativeToPar,_that.distanceWalked,_that.fairwaysHit,_that.fairwaysTotal,_that.greensInRegulation,_that.greensTotal,_that.weatherConditions,_that.chatgptEnabled,_that.gpsEnabled,_that.notes,_that.course,_that.tee,_that.scores);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class RoundEntityData extends RoundEntity {
  const RoundEntityData({required this.id, @JsonKey(name: 'course_id') this.courseId, @JsonKey(name: 'tee_id') this.teeId, required this.status, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') this.endTime, @JsonKey(name: 'duration_minutes') this.durationMinutes, @JsonKey(name: 'total_strokes') this.totalStrokes, @JsonKey(name: 'total_putts') this.totalPutts, @JsonKey(name: 'total_penalties') this.totalPenalties, @JsonKey(name: 'score_relative_to_par') this.scoreRelativeToPar, @JsonKey(name: 'distance_walked') this.distanceWalked, @JsonKey(name: 'fairways_hit') this.fairwaysHit, @JsonKey(name: 'fairways_total') this.fairwaysTotal, @JsonKey(name: 'greens_in_regulation') this.greensInRegulation, @JsonKey(name: 'greens_total') this.greensTotal, @JsonKey(name: 'weather_conditions') this.weatherConditions, @JsonKey(name: 'chatgpt_enabled') this.chatgptEnabled = false, @JsonKey(name: 'gps_enabled') this.gpsEnabled = true, this.notes, this.course, this.tee, final  List<HoleScoreEntity> scores = const []}): _scores = scores,super._();
  factory RoundEntityData.fromJson(Map<String, dynamic> json) => _$RoundEntityDataFromJson(json);

@override final  String id;
@override@JsonKey(name: 'course_id') final  String? courseId;
@override@JsonKey(name: 'tee_id') final  String? teeId;
@override final  String status;
@override@JsonKey(name: 'start_time') final  String startTime;
@override@JsonKey(name: 'end_time') final  String? endTime;
@override@JsonKey(name: 'duration_minutes') final  int? durationMinutes;
@override@JsonKey(name: 'total_strokes') final  int? totalStrokes;
@override@JsonKey(name: 'total_putts') final  int? totalPutts;
@override@JsonKey(name: 'total_penalties') final  int? totalPenalties;
@override@JsonKey(name: 'score_relative_to_par') final  int? scoreRelativeToPar;
@override@JsonKey(name: 'distance_walked') final  double? distanceWalked;
@override@JsonKey(name: 'fairways_hit') final  int? fairwaysHit;
@override@JsonKey(name: 'fairways_total') final  int? fairwaysTotal;
@override@JsonKey(name: 'greens_in_regulation') final  int? greensInRegulation;
@override@JsonKey(name: 'greens_total') final  int? greensTotal;
@override@JsonKey(name: 'weather_conditions') final  String? weatherConditions;
@override@JsonKey(name: 'chatgpt_enabled') final  bool chatgptEnabled;
@override@JsonKey(name: 'gps_enabled') final  bool gpsEnabled;
@override final  String? notes;
@override final  CourseEntity? course;
@override final  TeeEntity? tee;
 final  List<HoleScoreEntity> _scores;
@override@JsonKey() List<HoleScoreEntity> get scores {
  if (_scores is EqualUnmodifiableListView) return _scores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scores);
}


/// Create a copy of RoundEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundEntityDataCopyWith<RoundEntityData> get copyWith => _$RoundEntityDataCopyWithImpl<RoundEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoundEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundEntityData&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.teeId, teeId) || other.teeId == teeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.totalStrokes, totalStrokes) || other.totalStrokes == totalStrokes)&&(identical(other.totalPutts, totalPutts) || other.totalPutts == totalPutts)&&(identical(other.totalPenalties, totalPenalties) || other.totalPenalties == totalPenalties)&&(identical(other.scoreRelativeToPar, scoreRelativeToPar) || other.scoreRelativeToPar == scoreRelativeToPar)&&(identical(other.distanceWalked, distanceWalked) || other.distanceWalked == distanceWalked)&&(identical(other.fairwaysHit, fairwaysHit) || other.fairwaysHit == fairwaysHit)&&(identical(other.fairwaysTotal, fairwaysTotal) || other.fairwaysTotal == fairwaysTotal)&&(identical(other.greensInRegulation, greensInRegulation) || other.greensInRegulation == greensInRegulation)&&(identical(other.greensTotal, greensTotal) || other.greensTotal == greensTotal)&&(identical(other.weatherConditions, weatherConditions) || other.weatherConditions == weatherConditions)&&(identical(other.chatgptEnabled, chatgptEnabled) || other.chatgptEnabled == chatgptEnabled)&&(identical(other.gpsEnabled, gpsEnabled) || other.gpsEnabled == gpsEnabled)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.course, course) || other.course == course)&&(identical(other.tee, tee) || other.tee == tee)&&const DeepCollectionEquality().equals(other._scores, _scores));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,courseId,teeId,status,startTime,endTime,durationMinutes,totalStrokes,totalPutts,totalPenalties,scoreRelativeToPar,distanceWalked,fairwaysHit,fairwaysTotal,greensInRegulation,greensTotal,weatherConditions,chatgptEnabled,gpsEnabled,notes,course,tee,const DeepCollectionEquality().hash(_scores)]);

@override
String toString() {
  return 'RoundEntity(id: $id, courseId: $courseId, teeId: $teeId, status: $status, startTime: $startTime, endTime: $endTime, durationMinutes: $durationMinutes, totalStrokes: $totalStrokes, totalPutts: $totalPutts, totalPenalties: $totalPenalties, scoreRelativeToPar: $scoreRelativeToPar, distanceWalked: $distanceWalked, fairwaysHit: $fairwaysHit, fairwaysTotal: $fairwaysTotal, greensInRegulation: $greensInRegulation, greensTotal: $greensTotal, weatherConditions: $weatherConditions, chatgptEnabled: $chatgptEnabled, gpsEnabled: $gpsEnabled, notes: $notes, course: $course, tee: $tee, scores: $scores)';
}


}

/// @nodoc
abstract mixin class $RoundEntityDataCopyWith<$Res> implements $RoundEntityCopyWith<$Res> {
  factory $RoundEntityDataCopyWith(RoundEntityData value, $Res Function(RoundEntityData) _then) = _$RoundEntityDataCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'course_id') String? courseId,@JsonKey(name: 'tee_id') String? teeId, String status,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String? endTime,@JsonKey(name: 'duration_minutes') int? durationMinutes,@JsonKey(name: 'total_strokes') int? totalStrokes,@JsonKey(name: 'total_putts') int? totalPutts,@JsonKey(name: 'total_penalties') int? totalPenalties,@JsonKey(name: 'score_relative_to_par') int? scoreRelativeToPar,@JsonKey(name: 'distance_walked') double? distanceWalked,@JsonKey(name: 'fairways_hit') int? fairwaysHit,@JsonKey(name: 'fairways_total') int? fairwaysTotal,@JsonKey(name: 'greens_in_regulation') int? greensInRegulation,@JsonKey(name: 'greens_total') int? greensTotal,@JsonKey(name: 'weather_conditions') String? weatherConditions,@JsonKey(name: 'chatgpt_enabled') bool chatgptEnabled,@JsonKey(name: 'gps_enabled') bool gpsEnabled, String? notes, CourseEntity? course, TeeEntity? tee, List<HoleScoreEntity> scores
});


@override $CourseEntityCopyWith<$Res>? get course;@override $TeeEntityCopyWith<$Res>? get tee;

}
/// @nodoc
class _$RoundEntityDataCopyWithImpl<$Res>
    implements $RoundEntityDataCopyWith<$Res> {
  _$RoundEntityDataCopyWithImpl(this._self, this._then);

  final RoundEntityData _self;
  final $Res Function(RoundEntityData) _then;

/// Create a copy of RoundEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? courseId = freezed,Object? teeId = freezed,Object? status = null,Object? startTime = null,Object? endTime = freezed,Object? durationMinutes = freezed,Object? totalStrokes = freezed,Object? totalPutts = freezed,Object? totalPenalties = freezed,Object? scoreRelativeToPar = freezed,Object? distanceWalked = freezed,Object? fairwaysHit = freezed,Object? fairwaysTotal = freezed,Object? greensInRegulation = freezed,Object? greensTotal = freezed,Object? weatherConditions = freezed,Object? chatgptEnabled = null,Object? gpsEnabled = null,Object? notes = freezed,Object? course = freezed,Object? tee = freezed,Object? scores = null,}) {
  return _then(RoundEntityData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,teeId: freezed == teeId ? _self.teeId : teeId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,durationMinutes: freezed == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
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
as String?,course: freezed == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as CourseEntity?,tee: freezed == tee ? _self.tee : tee // ignore: cast_nullable_to_non_nullable
as TeeEntity?,scores: null == scores ? _self._scores : scores // ignore: cast_nullable_to_non_nullable
as List<HoleScoreEntity>,
  ));
}

/// Create a copy of RoundEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseEntityCopyWith<$Res>? get course {
    if (_self.course == null) {
    return null;
  }

  return $CourseEntityCopyWith<$Res>(_self.course!, (value) {
    return _then(_self.copyWith(course: value));
  });
}/// Create a copy of RoundEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeeEntityCopyWith<$Res>? get tee {
    if (_self.tee == null) {
    return null;
  }

  return $TeeEntityCopyWith<$Res>(_self.tee!, (value) {
    return _then(_self.copyWith(tee: value));
  });
}
}

RoundResponse _$RoundResponseFromJson(
  Map<String, dynamic> json
) {
    return RoundResponseData.fromJson(
      json
    );
}

/// @nodoc
mixin _$RoundResponse {

 RoundEntity get round;
/// Create a copy of RoundResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundResponseCopyWith<RoundResponse> get copyWith => _$RoundResponseCopyWithImpl<RoundResponse>(this as RoundResponse, _$identity);

  /// Serializes this RoundResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundResponse&&(identical(other.round, round) || other.round == round));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,round);

@override
String toString() {
  return 'RoundResponse(round: $round)';
}


}

/// @nodoc
abstract mixin class $RoundResponseCopyWith<$Res>  {
  factory $RoundResponseCopyWith(RoundResponse value, $Res Function(RoundResponse) _then) = _$RoundResponseCopyWithImpl;
@useResult
$Res call({
 RoundEntity round
});


$RoundEntityCopyWith<$Res> get round;

}
/// @nodoc
class _$RoundResponseCopyWithImpl<$Res>
    implements $RoundResponseCopyWith<$Res> {
  _$RoundResponseCopyWithImpl(this._self, this._then);

  final RoundResponse _self;
  final $Res Function(RoundResponse) _then;

/// Create a copy of RoundResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? round = null,}) {
  return _then(_self.copyWith(
round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as RoundEntity,
  ));
}
/// Create a copy of RoundResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoundEntityCopyWith<$Res> get round {
  
  return $RoundEntityCopyWith<$Res>(_self.round, (value) {
    return _then(_self.copyWith(round: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoundResponse].
extension RoundResponsePatterns on RoundResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( RoundResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case RoundResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( RoundResponseData value)  $default,){
final _that = this;
switch (_that) {
case RoundResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( RoundResponseData value)?  $default,){
final _that = this;
switch (_that) {
case RoundResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RoundEntity round)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case RoundResponseData() when $default != null:
return $default(_that.round);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RoundEntity round)  $default,) {final _that = this;
switch (_that) {
case RoundResponseData():
return $default(_that.round);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RoundEntity round)?  $default,) {final _that = this;
switch (_that) {
case RoundResponseData() when $default != null:
return $default(_that.round);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class RoundResponseData extends RoundResponse {
  const RoundResponseData({required this.round}): super._();
  factory RoundResponseData.fromJson(Map<String, dynamic> json) => _$RoundResponseDataFromJson(json);

@override final  RoundEntity round;

/// Create a copy of RoundResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundResponseDataCopyWith<RoundResponseData> get copyWith => _$RoundResponseDataCopyWithImpl<RoundResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoundResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundResponseData&&(identical(other.round, round) || other.round == round));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,round);

@override
String toString() {
  return 'RoundResponse(round: $round)';
}


}

/// @nodoc
abstract mixin class $RoundResponseDataCopyWith<$Res> implements $RoundResponseCopyWith<$Res> {
  factory $RoundResponseDataCopyWith(RoundResponseData value, $Res Function(RoundResponseData) _then) = _$RoundResponseDataCopyWithImpl;
@override @useResult
$Res call({
 RoundEntity round
});


@override $RoundEntityCopyWith<$Res> get round;

}
/// @nodoc
class _$RoundResponseDataCopyWithImpl<$Res>
    implements $RoundResponseDataCopyWith<$Res> {
  _$RoundResponseDataCopyWithImpl(this._self, this._then);

  final RoundResponseData _self;
  final $Res Function(RoundResponseData) _then;

/// Create a copy of RoundResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? round = null,}) {
  return _then(RoundResponseData(
round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as RoundEntity,
  ));
}

/// Create a copy of RoundResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoundEntityCopyWith<$Res> get round {
  
  return $RoundEntityCopyWith<$Res>(_self.round, (value) {
    return _then(_self.copyWith(round: value));
  });
}
}

RoundsListResponse _$RoundsListResponseFromJson(
  Map<String, dynamic> json
) {
    return RoundsListResponseData.fromJson(
      json
    );
}

/// @nodoc
mixin _$RoundsListResponse {

 List<RoundEntity> get rounds;@JsonKey(fromJson: _parseIntOrString) int get total;@JsonKey(fromJson: _parseIntOrStringWithDefault20) int get limit;@JsonKey(fromJson: _parseIntOrString) int get offset;
/// Create a copy of RoundsListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundsListResponseCopyWith<RoundsListResponse> get copyWith => _$RoundsListResponseCopyWithImpl<RoundsListResponse>(this as RoundsListResponse, _$identity);

  /// Serializes this RoundsListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundsListResponse&&const DeepCollectionEquality().equals(other.rounds, rounds)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(rounds),total,limit,offset);

@override
String toString() {
  return 'RoundsListResponse(rounds: $rounds, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $RoundsListResponseCopyWith<$Res>  {
  factory $RoundsListResponseCopyWith(RoundsListResponse value, $Res Function(RoundsListResponse) _then) = _$RoundsListResponseCopyWithImpl;
@useResult
$Res call({
 List<RoundEntity> rounds,@JsonKey(fromJson: _parseIntOrString) int total,@JsonKey(fromJson: _parseIntOrStringWithDefault20) int limit,@JsonKey(fromJson: _parseIntOrString) int offset
});




}
/// @nodoc
class _$RoundsListResponseCopyWithImpl<$Res>
    implements $RoundsListResponseCopyWith<$Res> {
  _$RoundsListResponseCopyWithImpl(this._self, this._then);

  final RoundsListResponse _self;
  final $Res Function(RoundsListResponse) _then;

/// Create a copy of RoundsListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rounds = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_self.copyWith(
rounds: null == rounds ? _self.rounds : rounds // ignore: cast_nullable_to_non_nullable
as List<RoundEntity>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RoundsListResponse].
extension RoundsListResponsePatterns on RoundsListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( RoundsListResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case RoundsListResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( RoundsListResponseData value)  $default,){
final _that = this;
switch (_that) {
case RoundsListResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( RoundsListResponseData value)?  $default,){
final _that = this;
switch (_that) {
case RoundsListResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RoundEntity> rounds, @JsonKey(fromJson: _parseIntOrString)  int total, @JsonKey(fromJson: _parseIntOrStringWithDefault20)  int limit, @JsonKey(fromJson: _parseIntOrString)  int offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case RoundsListResponseData() when $default != null:
return $default(_that.rounds,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RoundEntity> rounds, @JsonKey(fromJson: _parseIntOrString)  int total, @JsonKey(fromJson: _parseIntOrStringWithDefault20)  int limit, @JsonKey(fromJson: _parseIntOrString)  int offset)  $default,) {final _that = this;
switch (_that) {
case RoundsListResponseData():
return $default(_that.rounds,_that.total,_that.limit,_that.offset);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RoundEntity> rounds, @JsonKey(fromJson: _parseIntOrString)  int total, @JsonKey(fromJson: _parseIntOrStringWithDefault20)  int limit, @JsonKey(fromJson: _parseIntOrString)  int offset)?  $default,) {final _that = this;
switch (_that) {
case RoundsListResponseData() when $default != null:
return $default(_that.rounds,_that.total,_that.limit,_that.offset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class RoundsListResponseData extends RoundsListResponse {
  const RoundsListResponseData({required final  List<RoundEntity> rounds, @JsonKey(fromJson: _parseIntOrString) this.total = 0, @JsonKey(fromJson: _parseIntOrStringWithDefault20) this.limit = 20, @JsonKey(fromJson: _parseIntOrString) this.offset = 0}): _rounds = rounds,super._();
  factory RoundsListResponseData.fromJson(Map<String, dynamic> json) => _$RoundsListResponseDataFromJson(json);

 final  List<RoundEntity> _rounds;
@override List<RoundEntity> get rounds {
  if (_rounds is EqualUnmodifiableListView) return _rounds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rounds);
}

@override@JsonKey(fromJson: _parseIntOrString) final  int total;
@override@JsonKey(fromJson: _parseIntOrStringWithDefault20) final  int limit;
@override@JsonKey(fromJson: _parseIntOrString) final  int offset;

/// Create a copy of RoundsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundsListResponseDataCopyWith<RoundsListResponseData> get copyWith => _$RoundsListResponseDataCopyWithImpl<RoundsListResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoundsListResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundsListResponseData&&const DeepCollectionEquality().equals(other._rounds, _rounds)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_rounds),total,limit,offset);

@override
String toString() {
  return 'RoundsListResponse(rounds: $rounds, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $RoundsListResponseDataCopyWith<$Res> implements $RoundsListResponseCopyWith<$Res> {
  factory $RoundsListResponseDataCopyWith(RoundsListResponseData value, $Res Function(RoundsListResponseData) _then) = _$RoundsListResponseDataCopyWithImpl;
@override @useResult
$Res call({
 List<RoundEntity> rounds,@JsonKey(fromJson: _parseIntOrString) int total,@JsonKey(fromJson: _parseIntOrStringWithDefault20) int limit,@JsonKey(fromJson: _parseIntOrString) int offset
});




}
/// @nodoc
class _$RoundsListResponseDataCopyWithImpl<$Res>
    implements $RoundsListResponseDataCopyWith<$Res> {
  _$RoundsListResponseDataCopyWithImpl(this._self, this._then);

  final RoundsListResponseData _self;
  final $Res Function(RoundsListResponseData) _then;

/// Create a copy of RoundsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rounds = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(RoundsListResponseData(
rounds: null == rounds ? _self._rounds : rounds // ignore: cast_nullable_to_non_nullable
as List<RoundEntity>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
