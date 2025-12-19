// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_upsert_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ScoreUpsertResponse _$ScoreUpsertResponseFromJson(
  Map<String, dynamic> json
) {
    return ScoreUpsertResponseData.fromJson(
      json
    );
}

/// @nodoc
mixin _$ScoreUpsertResponse {

 bool get ok; String? get id; ScoreUpsertData? get score; RunningScoreEntity? get running; NextActionsEntity? get next;
/// Create a copy of ScoreUpsertResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreUpsertResponseCopyWith<ScoreUpsertResponse> get copyWith => _$ScoreUpsertResponseCopyWithImpl<ScoreUpsertResponse>(this as ScoreUpsertResponse, _$identity);

  /// Serializes this ScoreUpsertResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreUpsertResponse&&(identical(other.ok, ok) || other.ok == ok)&&(identical(other.id, id) || other.id == id)&&(identical(other.score, score) || other.score == score)&&(identical(other.running, running) || other.running == running)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok,id,score,running,next);

@override
String toString() {
  return 'ScoreUpsertResponse(ok: $ok, id: $id, score: $score, running: $running, next: $next)';
}


}

/// @nodoc
abstract mixin class $ScoreUpsertResponseCopyWith<$Res>  {
  factory $ScoreUpsertResponseCopyWith(ScoreUpsertResponse value, $Res Function(ScoreUpsertResponse) _then) = _$ScoreUpsertResponseCopyWithImpl;
@useResult
$Res call({
 bool ok, String? id, ScoreUpsertData? score, RunningScoreEntity? running, NextActionsEntity? next
});


$ScoreUpsertDataCopyWith<$Res>? get score;$RunningScoreEntityCopyWith<$Res>? get running;$NextActionsEntityCopyWith<$Res>? get next;

}
/// @nodoc
class _$ScoreUpsertResponseCopyWithImpl<$Res>
    implements $ScoreUpsertResponseCopyWith<$Res> {
  _$ScoreUpsertResponseCopyWithImpl(this._self, this._then);

  final ScoreUpsertResponse _self;
  final $Res Function(ScoreUpsertResponse) _then;

/// Create a copy of ScoreUpsertResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ok = null,Object? id = freezed,Object? score = freezed,Object? running = freezed,Object? next = freezed,}) {
  return _then(_self.copyWith(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as ScoreUpsertData?,running: freezed == running ? _self.running : running // ignore: cast_nullable_to_non_nullable
as RunningScoreEntity?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as NextActionsEntity?,
  ));
}
/// Create a copy of ScoreUpsertResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreUpsertDataCopyWith<$Res>? get score {
    if (_self.score == null) {
    return null;
  }

  return $ScoreUpsertDataCopyWith<$Res>(_self.score!, (value) {
    return _then(_self.copyWith(score: value));
  });
}/// Create a copy of ScoreUpsertResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RunningScoreEntityCopyWith<$Res>? get running {
    if (_self.running == null) {
    return null;
  }

  return $RunningScoreEntityCopyWith<$Res>(_self.running!, (value) {
    return _then(_self.copyWith(running: value));
  });
}/// Create a copy of ScoreUpsertResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NextActionsEntityCopyWith<$Res>? get next {
    if (_self.next == null) {
    return null;
  }

  return $NextActionsEntityCopyWith<$Res>(_self.next!, (value) {
    return _then(_self.copyWith(next: value));
  });
}
}


/// Adds pattern-matching-related methods to [ScoreUpsertResponse].
extension ScoreUpsertResponsePatterns on ScoreUpsertResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( ScoreUpsertResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case ScoreUpsertResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( ScoreUpsertResponseData value)  $default,){
final _that = this;
switch (_that) {
case ScoreUpsertResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( ScoreUpsertResponseData value)?  $default,){
final _that = this;
switch (_that) {
case ScoreUpsertResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool ok,  String? id,  ScoreUpsertData? score,  RunningScoreEntity? running,  NextActionsEntity? next)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case ScoreUpsertResponseData() when $default != null:
return $default(_that.ok,_that.id,_that.score,_that.running,_that.next);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool ok,  String? id,  ScoreUpsertData? score,  RunningScoreEntity? running,  NextActionsEntity? next)  $default,) {final _that = this;
switch (_that) {
case ScoreUpsertResponseData():
return $default(_that.ok,_that.id,_that.score,_that.running,_that.next);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool ok,  String? id,  ScoreUpsertData? score,  RunningScoreEntity? running,  NextActionsEntity? next)?  $default,) {final _that = this;
switch (_that) {
case ScoreUpsertResponseData() when $default != null:
return $default(_that.ok,_that.id,_that.score,_that.running,_that.next);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ScoreUpsertResponseData extends ScoreUpsertResponse {
  const ScoreUpsertResponseData({required this.ok, this.id, this.score, this.running, this.next}): super._();
  factory ScoreUpsertResponseData.fromJson(Map<String, dynamic> json) => _$ScoreUpsertResponseDataFromJson(json);

@override final  bool ok;
@override final  String? id;
@override final  ScoreUpsertData? score;
@override final  RunningScoreEntity? running;
@override final  NextActionsEntity? next;

/// Create a copy of ScoreUpsertResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreUpsertResponseDataCopyWith<ScoreUpsertResponseData> get copyWith => _$ScoreUpsertResponseDataCopyWithImpl<ScoreUpsertResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScoreUpsertResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreUpsertResponseData&&(identical(other.ok, ok) || other.ok == ok)&&(identical(other.id, id) || other.id == id)&&(identical(other.score, score) || other.score == score)&&(identical(other.running, running) || other.running == running)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok,id,score,running,next);

@override
String toString() {
  return 'ScoreUpsertResponse(ok: $ok, id: $id, score: $score, running: $running, next: $next)';
}


}

/// @nodoc
abstract mixin class $ScoreUpsertResponseDataCopyWith<$Res> implements $ScoreUpsertResponseCopyWith<$Res> {
  factory $ScoreUpsertResponseDataCopyWith(ScoreUpsertResponseData value, $Res Function(ScoreUpsertResponseData) _then) = _$ScoreUpsertResponseDataCopyWithImpl;
@override @useResult
$Res call({
 bool ok, String? id, ScoreUpsertData? score, RunningScoreEntity? running, NextActionsEntity? next
});


@override $ScoreUpsertDataCopyWith<$Res>? get score;@override $RunningScoreEntityCopyWith<$Res>? get running;@override $NextActionsEntityCopyWith<$Res>? get next;

}
/// @nodoc
class _$ScoreUpsertResponseDataCopyWithImpl<$Res>
    implements $ScoreUpsertResponseDataCopyWith<$Res> {
  _$ScoreUpsertResponseDataCopyWithImpl(this._self, this._then);

  final ScoreUpsertResponseData _self;
  final $Res Function(ScoreUpsertResponseData) _then;

/// Create a copy of ScoreUpsertResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ok = null,Object? id = freezed,Object? score = freezed,Object? running = freezed,Object? next = freezed,}) {
  return _then(ScoreUpsertResponseData(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as ScoreUpsertData?,running: freezed == running ? _self.running : running // ignore: cast_nullable_to_non_nullable
as RunningScoreEntity?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as NextActionsEntity?,
  ));
}

/// Create a copy of ScoreUpsertResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreUpsertDataCopyWith<$Res>? get score {
    if (_self.score == null) {
    return null;
  }

  return $ScoreUpsertDataCopyWith<$Res>(_self.score!, (value) {
    return _then(_self.copyWith(score: value));
  });
}/// Create a copy of ScoreUpsertResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RunningScoreEntityCopyWith<$Res>? get running {
    if (_self.running == null) {
    return null;
  }

  return $RunningScoreEntityCopyWith<$Res>(_self.running!, (value) {
    return _then(_self.copyWith(running: value));
  });
}/// Create a copy of ScoreUpsertResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NextActionsEntityCopyWith<$Res>? get next {
    if (_self.next == null) {
    return null;
  }

  return $NextActionsEntityCopyWith<$Res>(_self.next!, (value) {
    return _then(_self.copyWith(next: value));
  });
}
}

ScoreUpsertData _$ScoreUpsertDataFromJson(
  Map<String, dynamic> json
) {
    return ScoreUpsertDataData.fromJson(
      json
    );
}

/// @nodoc
mixin _$ScoreUpsertData {

 int get hole; int? get strokes; int? get putts;@JsonKey(name: 'scoreName') String? get scoreName;
/// Create a copy of ScoreUpsertData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreUpsertDataCopyWith<ScoreUpsertData> get copyWith => _$ScoreUpsertDataCopyWithImpl<ScoreUpsertData>(this as ScoreUpsertData, _$identity);

  /// Serializes this ScoreUpsertData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreUpsertData&&(identical(other.hole, hole) || other.hole == hole)&&(identical(other.strokes, strokes) || other.strokes == strokes)&&(identical(other.putts, putts) || other.putts == putts)&&(identical(other.scoreName, scoreName) || other.scoreName == scoreName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hole,strokes,putts,scoreName);

@override
String toString() {
  return 'ScoreUpsertData(hole: $hole, strokes: $strokes, putts: $putts, scoreName: $scoreName)';
}


}

/// @nodoc
abstract mixin class $ScoreUpsertDataCopyWith<$Res>  {
  factory $ScoreUpsertDataCopyWith(ScoreUpsertData value, $Res Function(ScoreUpsertData) _then) = _$ScoreUpsertDataCopyWithImpl;
@useResult
$Res call({
 int hole, int? strokes, int? putts,@JsonKey(name: 'scoreName') String? scoreName
});




}
/// @nodoc
class _$ScoreUpsertDataCopyWithImpl<$Res>
    implements $ScoreUpsertDataCopyWith<$Res> {
  _$ScoreUpsertDataCopyWithImpl(this._self, this._then);

  final ScoreUpsertData _self;
  final $Res Function(ScoreUpsertData) _then;

/// Create a copy of ScoreUpsertData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hole = null,Object? strokes = freezed,Object? putts = freezed,Object? scoreName = freezed,}) {
  return _then(_self.copyWith(
hole: null == hole ? _self.hole : hole // ignore: cast_nullable_to_non_nullable
as int,strokes: freezed == strokes ? _self.strokes : strokes // ignore: cast_nullable_to_non_nullable
as int?,putts: freezed == putts ? _self.putts : putts // ignore: cast_nullable_to_non_nullable
as int?,scoreName: freezed == scoreName ? _self.scoreName : scoreName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScoreUpsertData].
extension ScoreUpsertDataPatterns on ScoreUpsertData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( ScoreUpsertDataData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case ScoreUpsertDataData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( ScoreUpsertDataData value)  $default,){
final _that = this;
switch (_that) {
case ScoreUpsertDataData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( ScoreUpsertDataData value)?  $default,){
final _that = this;
switch (_that) {
case ScoreUpsertDataData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int hole,  int? strokes,  int? putts, @JsonKey(name: 'scoreName')  String? scoreName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case ScoreUpsertDataData() when $default != null:
return $default(_that.hole,_that.strokes,_that.putts,_that.scoreName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int hole,  int? strokes,  int? putts, @JsonKey(name: 'scoreName')  String? scoreName)  $default,) {final _that = this;
switch (_that) {
case ScoreUpsertDataData():
return $default(_that.hole,_that.strokes,_that.putts,_that.scoreName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int hole,  int? strokes,  int? putts, @JsonKey(name: 'scoreName')  String? scoreName)?  $default,) {final _that = this;
switch (_that) {
case ScoreUpsertDataData() when $default != null:
return $default(_that.hole,_that.strokes,_that.putts,_that.scoreName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ScoreUpsertDataData extends ScoreUpsertData {
  const ScoreUpsertDataData({required this.hole, this.strokes, this.putts, @JsonKey(name: 'scoreName') this.scoreName}): super._();
  factory ScoreUpsertDataData.fromJson(Map<String, dynamic> json) => _$ScoreUpsertDataDataFromJson(json);

@override final  int hole;
@override final  int? strokes;
@override final  int? putts;
@override@JsonKey(name: 'scoreName') final  String? scoreName;

/// Create a copy of ScoreUpsertData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreUpsertDataDataCopyWith<ScoreUpsertDataData> get copyWith => _$ScoreUpsertDataDataCopyWithImpl<ScoreUpsertDataData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScoreUpsertDataDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreUpsertDataData&&(identical(other.hole, hole) || other.hole == hole)&&(identical(other.strokes, strokes) || other.strokes == strokes)&&(identical(other.putts, putts) || other.putts == putts)&&(identical(other.scoreName, scoreName) || other.scoreName == scoreName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hole,strokes,putts,scoreName);

@override
String toString() {
  return 'ScoreUpsertData(hole: $hole, strokes: $strokes, putts: $putts, scoreName: $scoreName)';
}


}

/// @nodoc
abstract mixin class $ScoreUpsertDataDataCopyWith<$Res> implements $ScoreUpsertDataCopyWith<$Res> {
  factory $ScoreUpsertDataDataCopyWith(ScoreUpsertDataData value, $Res Function(ScoreUpsertDataData) _then) = _$ScoreUpsertDataDataCopyWithImpl;
@override @useResult
$Res call({
 int hole, int? strokes, int? putts,@JsonKey(name: 'scoreName') String? scoreName
});




}
/// @nodoc
class _$ScoreUpsertDataDataCopyWithImpl<$Res>
    implements $ScoreUpsertDataDataCopyWith<$Res> {
  _$ScoreUpsertDataDataCopyWithImpl(this._self, this._then);

  final ScoreUpsertDataData _self;
  final $Res Function(ScoreUpsertDataData) _then;

/// Create a copy of ScoreUpsertData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hole = null,Object? strokes = freezed,Object? putts = freezed,Object? scoreName = freezed,}) {
  return _then(ScoreUpsertDataData(
hole: null == hole ? _self.hole : hole // ignore: cast_nullable_to_non_nullable
as int,strokes: freezed == strokes ? _self.strokes : strokes // ignore: cast_nullable_to_non_nullable
as int?,putts: freezed == putts ? _self.putts : putts // ignore: cast_nullable_to_non_nullable
as int?,scoreName: freezed == scoreName ? _self.scoreName : scoreName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

RunningScoreEntity _$RunningScoreEntityFromJson(
  Map<String, dynamic> json
) {
    return RunningScoreEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$RunningScoreEntity {

@JsonKey(name: 'totalStrokes') int? get totalStrokes;@JsonKey(name: 'holesPlayed') int? get holesPlayed;@JsonKey(name: 'relativeToPar') int? get relativeToPar;
/// Create a copy of RunningScoreEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RunningScoreEntityCopyWith<RunningScoreEntity> get copyWith => _$RunningScoreEntityCopyWithImpl<RunningScoreEntity>(this as RunningScoreEntity, _$identity);

  /// Serializes this RunningScoreEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunningScoreEntity&&(identical(other.totalStrokes, totalStrokes) || other.totalStrokes == totalStrokes)&&(identical(other.holesPlayed, holesPlayed) || other.holesPlayed == holesPlayed)&&(identical(other.relativeToPar, relativeToPar) || other.relativeToPar == relativeToPar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalStrokes,holesPlayed,relativeToPar);

@override
String toString() {
  return 'RunningScoreEntity(totalStrokes: $totalStrokes, holesPlayed: $holesPlayed, relativeToPar: $relativeToPar)';
}


}

/// @nodoc
abstract mixin class $RunningScoreEntityCopyWith<$Res>  {
  factory $RunningScoreEntityCopyWith(RunningScoreEntity value, $Res Function(RunningScoreEntity) _then) = _$RunningScoreEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'totalStrokes') int? totalStrokes,@JsonKey(name: 'holesPlayed') int? holesPlayed,@JsonKey(name: 'relativeToPar') int? relativeToPar
});




}
/// @nodoc
class _$RunningScoreEntityCopyWithImpl<$Res>
    implements $RunningScoreEntityCopyWith<$Res> {
  _$RunningScoreEntityCopyWithImpl(this._self, this._then);

  final RunningScoreEntity _self;
  final $Res Function(RunningScoreEntity) _then;

/// Create a copy of RunningScoreEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalStrokes = freezed,Object? holesPlayed = freezed,Object? relativeToPar = freezed,}) {
  return _then(_self.copyWith(
totalStrokes: freezed == totalStrokes ? _self.totalStrokes : totalStrokes // ignore: cast_nullable_to_non_nullable
as int?,holesPlayed: freezed == holesPlayed ? _self.holesPlayed : holesPlayed // ignore: cast_nullable_to_non_nullable
as int?,relativeToPar: freezed == relativeToPar ? _self.relativeToPar : relativeToPar // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RunningScoreEntity].
extension RunningScoreEntityPatterns on RunningScoreEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( RunningScoreEntityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case RunningScoreEntityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( RunningScoreEntityData value)  $default,){
final _that = this;
switch (_that) {
case RunningScoreEntityData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( RunningScoreEntityData value)?  $default,){
final _that = this;
switch (_that) {
case RunningScoreEntityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'totalStrokes')  int? totalStrokes, @JsonKey(name: 'holesPlayed')  int? holesPlayed, @JsonKey(name: 'relativeToPar')  int? relativeToPar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case RunningScoreEntityData() when $default != null:
return $default(_that.totalStrokes,_that.holesPlayed,_that.relativeToPar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'totalStrokes')  int? totalStrokes, @JsonKey(name: 'holesPlayed')  int? holesPlayed, @JsonKey(name: 'relativeToPar')  int? relativeToPar)  $default,) {final _that = this;
switch (_that) {
case RunningScoreEntityData():
return $default(_that.totalStrokes,_that.holesPlayed,_that.relativeToPar);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'totalStrokes')  int? totalStrokes, @JsonKey(name: 'holesPlayed')  int? holesPlayed, @JsonKey(name: 'relativeToPar')  int? relativeToPar)?  $default,) {final _that = this;
switch (_that) {
case RunningScoreEntityData() when $default != null:
return $default(_that.totalStrokes,_that.holesPlayed,_that.relativeToPar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class RunningScoreEntityData extends RunningScoreEntity {
  const RunningScoreEntityData({@JsonKey(name: 'totalStrokes') this.totalStrokes, @JsonKey(name: 'holesPlayed') this.holesPlayed, @JsonKey(name: 'relativeToPar') this.relativeToPar}): super._();
  factory RunningScoreEntityData.fromJson(Map<String, dynamic> json) => _$RunningScoreEntityDataFromJson(json);

@override@JsonKey(name: 'totalStrokes') final  int? totalStrokes;
@override@JsonKey(name: 'holesPlayed') final  int? holesPlayed;
@override@JsonKey(name: 'relativeToPar') final  int? relativeToPar;

/// Create a copy of RunningScoreEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RunningScoreEntityDataCopyWith<RunningScoreEntityData> get copyWith => _$RunningScoreEntityDataCopyWithImpl<RunningScoreEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RunningScoreEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunningScoreEntityData&&(identical(other.totalStrokes, totalStrokes) || other.totalStrokes == totalStrokes)&&(identical(other.holesPlayed, holesPlayed) || other.holesPlayed == holesPlayed)&&(identical(other.relativeToPar, relativeToPar) || other.relativeToPar == relativeToPar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalStrokes,holesPlayed,relativeToPar);

@override
String toString() {
  return 'RunningScoreEntity(totalStrokes: $totalStrokes, holesPlayed: $holesPlayed, relativeToPar: $relativeToPar)';
}


}

/// @nodoc
abstract mixin class $RunningScoreEntityDataCopyWith<$Res> implements $RunningScoreEntityCopyWith<$Res> {
  factory $RunningScoreEntityDataCopyWith(RunningScoreEntityData value, $Res Function(RunningScoreEntityData) _then) = _$RunningScoreEntityDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'totalStrokes') int? totalStrokes,@JsonKey(name: 'holesPlayed') int? holesPlayed,@JsonKey(name: 'relativeToPar') int? relativeToPar
});




}
/// @nodoc
class _$RunningScoreEntityDataCopyWithImpl<$Res>
    implements $RunningScoreEntityDataCopyWith<$Res> {
  _$RunningScoreEntityDataCopyWithImpl(this._self, this._then);

  final RunningScoreEntityData _self;
  final $Res Function(RunningScoreEntityData) _then;

/// Create a copy of RunningScoreEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalStrokes = freezed,Object? holesPlayed = freezed,Object? relativeToPar = freezed,}) {
  return _then(RunningScoreEntityData(
totalStrokes: freezed == totalStrokes ? _self.totalStrokes : totalStrokes // ignore: cast_nullable_to_non_nullable
as int?,holesPlayed: freezed == holesPlayed ? _self.holesPlayed : holesPlayed // ignore: cast_nullable_to_non_nullable
as int?,relativeToPar: freezed == relativeToPar ? _self.relativeToPar : relativeToPar // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

NextActionsEntity _$NextActionsEntityFromJson(
  Map<String, dynamic> json
) {
    return NextActionsEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$NextActionsEntity {

 String? get hint; List<String> get actions;
/// Create a copy of NextActionsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NextActionsEntityCopyWith<NextActionsEntity> get copyWith => _$NextActionsEntityCopyWithImpl<NextActionsEntity>(this as NextActionsEntity, _$identity);

  /// Serializes this NextActionsEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NextActionsEntity&&(identical(other.hint, hint) || other.hint == hint)&&const DeepCollectionEquality().equals(other.actions, actions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hint,const DeepCollectionEquality().hash(actions));

@override
String toString() {
  return 'NextActionsEntity(hint: $hint, actions: $actions)';
}


}

/// @nodoc
abstract mixin class $NextActionsEntityCopyWith<$Res>  {
  factory $NextActionsEntityCopyWith(NextActionsEntity value, $Res Function(NextActionsEntity) _then) = _$NextActionsEntityCopyWithImpl;
@useResult
$Res call({
 String? hint, List<String> actions
});




}
/// @nodoc
class _$NextActionsEntityCopyWithImpl<$Res>
    implements $NextActionsEntityCopyWith<$Res> {
  _$NextActionsEntityCopyWithImpl(this._self, this._then);

  final NextActionsEntity _self;
  final $Res Function(NextActionsEntity) _then;

/// Create a copy of NextActionsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hint = freezed,Object? actions = null,}) {
  return _then(_self.copyWith(
hint: freezed == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String?,actions: null == actions ? _self.actions : actions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [NextActionsEntity].
extension NextActionsEntityPatterns on NextActionsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( NextActionsEntityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case NextActionsEntityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( NextActionsEntityData value)  $default,){
final _that = this;
switch (_that) {
case NextActionsEntityData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( NextActionsEntityData value)?  $default,){
final _that = this;
switch (_that) {
case NextActionsEntityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? hint,  List<String> actions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case NextActionsEntityData() when $default != null:
return $default(_that.hint,_that.actions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? hint,  List<String> actions)  $default,) {final _that = this;
switch (_that) {
case NextActionsEntityData():
return $default(_that.hint,_that.actions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? hint,  List<String> actions)?  $default,) {final _that = this;
switch (_that) {
case NextActionsEntityData() when $default != null:
return $default(_that.hint,_that.actions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class NextActionsEntityData extends NextActionsEntity {
  const NextActionsEntityData({this.hint, final  List<String> actions = const []}): _actions = actions,super._();
  factory NextActionsEntityData.fromJson(Map<String, dynamic> json) => _$NextActionsEntityDataFromJson(json);

@override final  String? hint;
 final  List<String> _actions;
@override@JsonKey() List<String> get actions {
  if (_actions is EqualUnmodifiableListView) return _actions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_actions);
}


/// Create a copy of NextActionsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NextActionsEntityDataCopyWith<NextActionsEntityData> get copyWith => _$NextActionsEntityDataCopyWithImpl<NextActionsEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NextActionsEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NextActionsEntityData&&(identical(other.hint, hint) || other.hint == hint)&&const DeepCollectionEquality().equals(other._actions, _actions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hint,const DeepCollectionEquality().hash(_actions));

@override
String toString() {
  return 'NextActionsEntity(hint: $hint, actions: $actions)';
}


}

/// @nodoc
abstract mixin class $NextActionsEntityDataCopyWith<$Res> implements $NextActionsEntityCopyWith<$Res> {
  factory $NextActionsEntityDataCopyWith(NextActionsEntityData value, $Res Function(NextActionsEntityData) _then) = _$NextActionsEntityDataCopyWithImpl;
@override @useResult
$Res call({
 String? hint, List<String> actions
});




}
/// @nodoc
class _$NextActionsEntityDataCopyWithImpl<$Res>
    implements $NextActionsEntityDataCopyWith<$Res> {
  _$NextActionsEntityDataCopyWithImpl(this._self, this._then);

  final NextActionsEntityData _self;
  final $Res Function(NextActionsEntityData) _then;

/// Create a copy of NextActionsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hint = freezed,Object? actions = null,}) {
  return _then(NextActionsEntityData(
hint: freezed == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String?,actions: null == actions ? _self._actions : actions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

FinishRoundResponse _$FinishRoundResponseFromJson(
  Map<String, dynamic> json
) {
    return FinishRoundResponseData.fromJson(
      json
    );
}

/// @nodoc
mixin _$FinishRoundResponse {

 bool get ok; String? get id; RoundSummaryEntity? get summary; NextActionsEntity? get next;
/// Create a copy of FinishRoundResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinishRoundResponseCopyWith<FinishRoundResponse> get copyWith => _$FinishRoundResponseCopyWithImpl<FinishRoundResponse>(this as FinishRoundResponse, _$identity);

  /// Serializes this FinishRoundResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FinishRoundResponse&&(identical(other.ok, ok) || other.ok == ok)&&(identical(other.id, id) || other.id == id)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok,id,summary,next);

@override
String toString() {
  return 'FinishRoundResponse(ok: $ok, id: $id, summary: $summary, next: $next)';
}


}

/// @nodoc
abstract mixin class $FinishRoundResponseCopyWith<$Res>  {
  factory $FinishRoundResponseCopyWith(FinishRoundResponse value, $Res Function(FinishRoundResponse) _then) = _$FinishRoundResponseCopyWithImpl;
@useResult
$Res call({
 bool ok, String? id, RoundSummaryEntity? summary, NextActionsEntity? next
});


$RoundSummaryEntityCopyWith<$Res>? get summary;$NextActionsEntityCopyWith<$Res>? get next;

}
/// @nodoc
class _$FinishRoundResponseCopyWithImpl<$Res>
    implements $FinishRoundResponseCopyWith<$Res> {
  _$FinishRoundResponseCopyWithImpl(this._self, this._then);

  final FinishRoundResponse _self;
  final $Res Function(FinishRoundResponse) _then;

/// Create a copy of FinishRoundResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ok = null,Object? id = freezed,Object? summary = freezed,Object? next = freezed,}) {
  return _then(_self.copyWith(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as RoundSummaryEntity?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as NextActionsEntity?,
  ));
}
/// Create a copy of FinishRoundResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoundSummaryEntityCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $RoundSummaryEntityCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of FinishRoundResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NextActionsEntityCopyWith<$Res>? get next {
    if (_self.next == null) {
    return null;
  }

  return $NextActionsEntityCopyWith<$Res>(_self.next!, (value) {
    return _then(_self.copyWith(next: value));
  });
}
}


/// Adds pattern-matching-related methods to [FinishRoundResponse].
extension FinishRoundResponsePatterns on FinishRoundResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( FinishRoundResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case FinishRoundResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( FinishRoundResponseData value)  $default,){
final _that = this;
switch (_that) {
case FinishRoundResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( FinishRoundResponseData value)?  $default,){
final _that = this;
switch (_that) {
case FinishRoundResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool ok,  String? id,  RoundSummaryEntity? summary,  NextActionsEntity? next)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case FinishRoundResponseData() when $default != null:
return $default(_that.ok,_that.id,_that.summary,_that.next);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool ok,  String? id,  RoundSummaryEntity? summary,  NextActionsEntity? next)  $default,) {final _that = this;
switch (_that) {
case FinishRoundResponseData():
return $default(_that.ok,_that.id,_that.summary,_that.next);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool ok,  String? id,  RoundSummaryEntity? summary,  NextActionsEntity? next)?  $default,) {final _that = this;
switch (_that) {
case FinishRoundResponseData() when $default != null:
return $default(_that.ok,_that.id,_that.summary,_that.next);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class FinishRoundResponseData extends FinishRoundResponse {
  const FinishRoundResponseData({required this.ok, this.id, this.summary, this.next}): super._();
  factory FinishRoundResponseData.fromJson(Map<String, dynamic> json) => _$FinishRoundResponseDataFromJson(json);

@override final  bool ok;
@override final  String? id;
@override final  RoundSummaryEntity? summary;
@override final  NextActionsEntity? next;

/// Create a copy of FinishRoundResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinishRoundResponseDataCopyWith<FinishRoundResponseData> get copyWith => _$FinishRoundResponseDataCopyWithImpl<FinishRoundResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FinishRoundResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FinishRoundResponseData&&(identical(other.ok, ok) || other.ok == ok)&&(identical(other.id, id) || other.id == id)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok,id,summary,next);

@override
String toString() {
  return 'FinishRoundResponse(ok: $ok, id: $id, summary: $summary, next: $next)';
}


}

/// @nodoc
abstract mixin class $FinishRoundResponseDataCopyWith<$Res> implements $FinishRoundResponseCopyWith<$Res> {
  factory $FinishRoundResponseDataCopyWith(FinishRoundResponseData value, $Res Function(FinishRoundResponseData) _then) = _$FinishRoundResponseDataCopyWithImpl;
@override @useResult
$Res call({
 bool ok, String? id, RoundSummaryEntity? summary, NextActionsEntity? next
});


@override $RoundSummaryEntityCopyWith<$Res>? get summary;@override $NextActionsEntityCopyWith<$Res>? get next;

}
/// @nodoc
class _$FinishRoundResponseDataCopyWithImpl<$Res>
    implements $FinishRoundResponseDataCopyWith<$Res> {
  _$FinishRoundResponseDataCopyWithImpl(this._self, this._then);

  final FinishRoundResponseData _self;
  final $Res Function(FinishRoundResponseData) _then;

/// Create a copy of FinishRoundResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ok = null,Object? id = freezed,Object? summary = freezed,Object? next = freezed,}) {
  return _then(FinishRoundResponseData(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as RoundSummaryEntity?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as NextActionsEntity?,
  ));
}

/// Create a copy of FinishRoundResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoundSummaryEntityCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $RoundSummaryEntityCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of FinishRoundResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NextActionsEntityCopyWith<$Res>? get next {
    if (_self.next == null) {
    return null;
  }

  return $NextActionsEntityCopyWith<$Res>(_self.next!, (value) {
    return _then(_self.copyWith(next: value));
  });
}
}

RoundSummaryEntity _$RoundSummaryEntityFromJson(
  Map<String, dynamic> json
) {
    return RoundSummaryEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$RoundSummaryEntity {

@JsonKey(name: 'totalStrokes') int? get totalStrokes;@JsonKey(name: 'relativeToPar') int? get relativeToPar;@JsonKey(name: 'totalPutts') int? get totalPutts;@JsonKey(name: 'fairwaysHit') int? get fairwaysHit;@JsonKey(name: 'fairwaysTotal') int? get fairwaysTotal; int? get gir;@JsonKey(name: 'girTotal') int? get girTotal;@JsonKey(name: 'durationMinutes') int? get durationMinutes;
/// Create a copy of RoundSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundSummaryEntityCopyWith<RoundSummaryEntity> get copyWith => _$RoundSummaryEntityCopyWithImpl<RoundSummaryEntity>(this as RoundSummaryEntity, _$identity);

  /// Serializes this RoundSummaryEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundSummaryEntity&&(identical(other.totalStrokes, totalStrokes) || other.totalStrokes == totalStrokes)&&(identical(other.relativeToPar, relativeToPar) || other.relativeToPar == relativeToPar)&&(identical(other.totalPutts, totalPutts) || other.totalPutts == totalPutts)&&(identical(other.fairwaysHit, fairwaysHit) || other.fairwaysHit == fairwaysHit)&&(identical(other.fairwaysTotal, fairwaysTotal) || other.fairwaysTotal == fairwaysTotal)&&(identical(other.gir, gir) || other.gir == gir)&&(identical(other.girTotal, girTotal) || other.girTotal == girTotal)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalStrokes,relativeToPar,totalPutts,fairwaysHit,fairwaysTotal,gir,girTotal,durationMinutes);

@override
String toString() {
  return 'RoundSummaryEntity(totalStrokes: $totalStrokes, relativeToPar: $relativeToPar, totalPutts: $totalPutts, fairwaysHit: $fairwaysHit, fairwaysTotal: $fairwaysTotal, gir: $gir, girTotal: $girTotal, durationMinutes: $durationMinutes)';
}


}

/// @nodoc
abstract mixin class $RoundSummaryEntityCopyWith<$Res>  {
  factory $RoundSummaryEntityCopyWith(RoundSummaryEntity value, $Res Function(RoundSummaryEntity) _then) = _$RoundSummaryEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'totalStrokes') int? totalStrokes,@JsonKey(name: 'relativeToPar') int? relativeToPar,@JsonKey(name: 'totalPutts') int? totalPutts,@JsonKey(name: 'fairwaysHit') int? fairwaysHit,@JsonKey(name: 'fairwaysTotal') int? fairwaysTotal, int? gir,@JsonKey(name: 'girTotal') int? girTotal,@JsonKey(name: 'durationMinutes') int? durationMinutes
});




}
/// @nodoc
class _$RoundSummaryEntityCopyWithImpl<$Res>
    implements $RoundSummaryEntityCopyWith<$Res> {
  _$RoundSummaryEntityCopyWithImpl(this._self, this._then);

  final RoundSummaryEntity _self;
  final $Res Function(RoundSummaryEntity) _then;

/// Create a copy of RoundSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalStrokes = freezed,Object? relativeToPar = freezed,Object? totalPutts = freezed,Object? fairwaysHit = freezed,Object? fairwaysTotal = freezed,Object? gir = freezed,Object? girTotal = freezed,Object? durationMinutes = freezed,}) {
  return _then(_self.copyWith(
totalStrokes: freezed == totalStrokes ? _self.totalStrokes : totalStrokes // ignore: cast_nullable_to_non_nullable
as int?,relativeToPar: freezed == relativeToPar ? _self.relativeToPar : relativeToPar // ignore: cast_nullable_to_non_nullable
as int?,totalPutts: freezed == totalPutts ? _self.totalPutts : totalPutts // ignore: cast_nullable_to_non_nullable
as int?,fairwaysHit: freezed == fairwaysHit ? _self.fairwaysHit : fairwaysHit // ignore: cast_nullable_to_non_nullable
as int?,fairwaysTotal: freezed == fairwaysTotal ? _self.fairwaysTotal : fairwaysTotal // ignore: cast_nullable_to_non_nullable
as int?,gir: freezed == gir ? _self.gir : gir // ignore: cast_nullable_to_non_nullable
as int?,girTotal: freezed == girTotal ? _self.girTotal : girTotal // ignore: cast_nullable_to_non_nullable
as int?,durationMinutes: freezed == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RoundSummaryEntity].
extension RoundSummaryEntityPatterns on RoundSummaryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( RoundSummaryEntityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case RoundSummaryEntityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( RoundSummaryEntityData value)  $default,){
final _that = this;
switch (_that) {
case RoundSummaryEntityData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( RoundSummaryEntityData value)?  $default,){
final _that = this;
switch (_that) {
case RoundSummaryEntityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'totalStrokes')  int? totalStrokes, @JsonKey(name: 'relativeToPar')  int? relativeToPar, @JsonKey(name: 'totalPutts')  int? totalPutts, @JsonKey(name: 'fairwaysHit')  int? fairwaysHit, @JsonKey(name: 'fairwaysTotal')  int? fairwaysTotal,  int? gir, @JsonKey(name: 'girTotal')  int? girTotal, @JsonKey(name: 'durationMinutes')  int? durationMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case RoundSummaryEntityData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'totalStrokes')  int? totalStrokes, @JsonKey(name: 'relativeToPar')  int? relativeToPar, @JsonKey(name: 'totalPutts')  int? totalPutts, @JsonKey(name: 'fairwaysHit')  int? fairwaysHit, @JsonKey(name: 'fairwaysTotal')  int? fairwaysTotal,  int? gir, @JsonKey(name: 'girTotal')  int? girTotal, @JsonKey(name: 'durationMinutes')  int? durationMinutes)  $default,) {final _that = this;
switch (_that) {
case RoundSummaryEntityData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'totalStrokes')  int? totalStrokes, @JsonKey(name: 'relativeToPar')  int? relativeToPar, @JsonKey(name: 'totalPutts')  int? totalPutts, @JsonKey(name: 'fairwaysHit')  int? fairwaysHit, @JsonKey(name: 'fairwaysTotal')  int? fairwaysTotal,  int? gir, @JsonKey(name: 'girTotal')  int? girTotal, @JsonKey(name: 'durationMinutes')  int? durationMinutes)?  $default,) {final _that = this;
switch (_that) {
case RoundSummaryEntityData() when $default != null:
return $default(_that.totalStrokes,_that.relativeToPar,_that.totalPutts,_that.fairwaysHit,_that.fairwaysTotal,_that.gir,_that.girTotal,_that.durationMinutes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class RoundSummaryEntityData extends RoundSummaryEntity {
  const RoundSummaryEntityData({@JsonKey(name: 'totalStrokes') this.totalStrokes, @JsonKey(name: 'relativeToPar') this.relativeToPar, @JsonKey(name: 'totalPutts') this.totalPutts, @JsonKey(name: 'fairwaysHit') this.fairwaysHit, @JsonKey(name: 'fairwaysTotal') this.fairwaysTotal, this.gir, @JsonKey(name: 'girTotal') this.girTotal, @JsonKey(name: 'durationMinutes') this.durationMinutes}): super._();
  factory RoundSummaryEntityData.fromJson(Map<String, dynamic> json) => _$RoundSummaryEntityDataFromJson(json);

@override@JsonKey(name: 'totalStrokes') final  int? totalStrokes;
@override@JsonKey(name: 'relativeToPar') final  int? relativeToPar;
@override@JsonKey(name: 'totalPutts') final  int? totalPutts;
@override@JsonKey(name: 'fairwaysHit') final  int? fairwaysHit;
@override@JsonKey(name: 'fairwaysTotal') final  int? fairwaysTotal;
@override final  int? gir;
@override@JsonKey(name: 'girTotal') final  int? girTotal;
@override@JsonKey(name: 'durationMinutes') final  int? durationMinutes;

/// Create a copy of RoundSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundSummaryEntityDataCopyWith<RoundSummaryEntityData> get copyWith => _$RoundSummaryEntityDataCopyWithImpl<RoundSummaryEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoundSummaryEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundSummaryEntityData&&(identical(other.totalStrokes, totalStrokes) || other.totalStrokes == totalStrokes)&&(identical(other.relativeToPar, relativeToPar) || other.relativeToPar == relativeToPar)&&(identical(other.totalPutts, totalPutts) || other.totalPutts == totalPutts)&&(identical(other.fairwaysHit, fairwaysHit) || other.fairwaysHit == fairwaysHit)&&(identical(other.fairwaysTotal, fairwaysTotal) || other.fairwaysTotal == fairwaysTotal)&&(identical(other.gir, gir) || other.gir == gir)&&(identical(other.girTotal, girTotal) || other.girTotal == girTotal)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalStrokes,relativeToPar,totalPutts,fairwaysHit,fairwaysTotal,gir,girTotal,durationMinutes);

@override
String toString() {
  return 'RoundSummaryEntity(totalStrokes: $totalStrokes, relativeToPar: $relativeToPar, totalPutts: $totalPutts, fairwaysHit: $fairwaysHit, fairwaysTotal: $fairwaysTotal, gir: $gir, girTotal: $girTotal, durationMinutes: $durationMinutes)';
}


}

/// @nodoc
abstract mixin class $RoundSummaryEntityDataCopyWith<$Res> implements $RoundSummaryEntityCopyWith<$Res> {
  factory $RoundSummaryEntityDataCopyWith(RoundSummaryEntityData value, $Res Function(RoundSummaryEntityData) _then) = _$RoundSummaryEntityDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'totalStrokes') int? totalStrokes,@JsonKey(name: 'relativeToPar') int? relativeToPar,@JsonKey(name: 'totalPutts') int? totalPutts,@JsonKey(name: 'fairwaysHit') int? fairwaysHit,@JsonKey(name: 'fairwaysTotal') int? fairwaysTotal, int? gir,@JsonKey(name: 'girTotal') int? girTotal,@JsonKey(name: 'durationMinutes') int? durationMinutes
});




}
/// @nodoc
class _$RoundSummaryEntityDataCopyWithImpl<$Res>
    implements $RoundSummaryEntityDataCopyWith<$Res> {
  _$RoundSummaryEntityDataCopyWithImpl(this._self, this._then);

  final RoundSummaryEntityData _self;
  final $Res Function(RoundSummaryEntityData) _then;

/// Create a copy of RoundSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalStrokes = freezed,Object? relativeToPar = freezed,Object? totalPutts = freezed,Object? fairwaysHit = freezed,Object? fairwaysTotal = freezed,Object? gir = freezed,Object? girTotal = freezed,Object? durationMinutes = freezed,}) {
  return _then(RoundSummaryEntityData(
totalStrokes: freezed == totalStrokes ? _self.totalStrokes : totalStrokes // ignore: cast_nullable_to_non_nullable
as int?,relativeToPar: freezed == relativeToPar ? _self.relativeToPar : relativeToPar // ignore: cast_nullable_to_non_nullable
as int?,totalPutts: freezed == totalPutts ? _self.totalPutts : totalPutts // ignore: cast_nullable_to_non_nullable
as int?,fairwaysHit: freezed == fairwaysHit ? _self.fairwaysHit : fairwaysHit // ignore: cast_nullable_to_non_nullable
as int?,fairwaysTotal: freezed == fairwaysTotal ? _self.fairwaysTotal : fairwaysTotal // ignore: cast_nullable_to_non_nullable
as int?,gir: freezed == gir ? _self.gir : gir // ignore: cast_nullable_to_non_nullable
as int?,girTotal: freezed == girTotal ? _self.girTotal : girTotal // ignore: cast_nullable_to_non_nullable
as int?,durationMinutes: freezed == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

StartRoundResponse _$StartRoundResponseFromJson(
  Map<String, dynamic> json
) {
    return StartRoundResponseData.fromJson(
      json
    );
}

/// @nodoc
mixin _$StartRoundResponse {

 bool get ok; String? get id; StartRoundData? get round; NextActionsEntity? get next;
/// Create a copy of StartRoundResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartRoundResponseCopyWith<StartRoundResponse> get copyWith => _$StartRoundResponseCopyWithImpl<StartRoundResponse>(this as StartRoundResponse, _$identity);

  /// Serializes this StartRoundResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartRoundResponse&&(identical(other.ok, ok) || other.ok == ok)&&(identical(other.id, id) || other.id == id)&&(identical(other.round, round) || other.round == round)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok,id,round,next);

@override
String toString() {
  return 'StartRoundResponse(ok: $ok, id: $id, round: $round, next: $next)';
}


}

/// @nodoc
abstract mixin class $StartRoundResponseCopyWith<$Res>  {
  factory $StartRoundResponseCopyWith(StartRoundResponse value, $Res Function(StartRoundResponse) _then) = _$StartRoundResponseCopyWithImpl;
@useResult
$Res call({
 bool ok, String? id, StartRoundData? round, NextActionsEntity? next
});


$StartRoundDataCopyWith<$Res>? get round;$NextActionsEntityCopyWith<$Res>? get next;

}
/// @nodoc
class _$StartRoundResponseCopyWithImpl<$Res>
    implements $StartRoundResponseCopyWith<$Res> {
  _$StartRoundResponseCopyWithImpl(this._self, this._then);

  final StartRoundResponse _self;
  final $Res Function(StartRoundResponse) _then;

/// Create a copy of StartRoundResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ok = null,Object? id = freezed,Object? round = freezed,Object? next = freezed,}) {
  return _then(_self.copyWith(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,round: freezed == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as StartRoundData?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as NextActionsEntity?,
  ));
}
/// Create a copy of StartRoundResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StartRoundDataCopyWith<$Res>? get round {
    if (_self.round == null) {
    return null;
  }

  return $StartRoundDataCopyWith<$Res>(_self.round!, (value) {
    return _then(_self.copyWith(round: value));
  });
}/// Create a copy of StartRoundResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NextActionsEntityCopyWith<$Res>? get next {
    if (_self.next == null) {
    return null;
  }

  return $NextActionsEntityCopyWith<$Res>(_self.next!, (value) {
    return _then(_self.copyWith(next: value));
  });
}
}


/// Adds pattern-matching-related methods to [StartRoundResponse].
extension StartRoundResponsePatterns on StartRoundResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( StartRoundResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case StartRoundResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( StartRoundResponseData value)  $default,){
final _that = this;
switch (_that) {
case StartRoundResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( StartRoundResponseData value)?  $default,){
final _that = this;
switch (_that) {
case StartRoundResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool ok,  String? id,  StartRoundData? round,  NextActionsEntity? next)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case StartRoundResponseData() when $default != null:
return $default(_that.ok,_that.id,_that.round,_that.next);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool ok,  String? id,  StartRoundData? round,  NextActionsEntity? next)  $default,) {final _that = this;
switch (_that) {
case StartRoundResponseData():
return $default(_that.ok,_that.id,_that.round,_that.next);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool ok,  String? id,  StartRoundData? round,  NextActionsEntity? next)?  $default,) {final _that = this;
switch (_that) {
case StartRoundResponseData() when $default != null:
return $default(_that.ok,_that.id,_that.round,_that.next);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class StartRoundResponseData extends StartRoundResponse {
  const StartRoundResponseData({required this.ok, this.id, this.round, this.next}): super._();
  factory StartRoundResponseData.fromJson(Map<String, dynamic> json) => _$StartRoundResponseDataFromJson(json);

@override final  bool ok;
@override final  String? id;
@override final  StartRoundData? round;
@override final  NextActionsEntity? next;

/// Create a copy of StartRoundResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartRoundResponseDataCopyWith<StartRoundResponseData> get copyWith => _$StartRoundResponseDataCopyWithImpl<StartRoundResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StartRoundResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartRoundResponseData&&(identical(other.ok, ok) || other.ok == ok)&&(identical(other.id, id) || other.id == id)&&(identical(other.round, round) || other.round == round)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok,id,round,next);

@override
String toString() {
  return 'StartRoundResponse(ok: $ok, id: $id, round: $round, next: $next)';
}


}

/// @nodoc
abstract mixin class $StartRoundResponseDataCopyWith<$Res> implements $StartRoundResponseCopyWith<$Res> {
  factory $StartRoundResponseDataCopyWith(StartRoundResponseData value, $Res Function(StartRoundResponseData) _then) = _$StartRoundResponseDataCopyWithImpl;
@override @useResult
$Res call({
 bool ok, String? id, StartRoundData? round, NextActionsEntity? next
});


@override $StartRoundDataCopyWith<$Res>? get round;@override $NextActionsEntityCopyWith<$Res>? get next;

}
/// @nodoc
class _$StartRoundResponseDataCopyWithImpl<$Res>
    implements $StartRoundResponseDataCopyWith<$Res> {
  _$StartRoundResponseDataCopyWithImpl(this._self, this._then);

  final StartRoundResponseData _self;
  final $Res Function(StartRoundResponseData) _then;

/// Create a copy of StartRoundResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ok = null,Object? id = freezed,Object? round = freezed,Object? next = freezed,}) {
  return _then(StartRoundResponseData(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,round: freezed == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as StartRoundData?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as NextActionsEntity?,
  ));
}

/// Create a copy of StartRoundResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StartRoundDataCopyWith<$Res>? get round {
    if (_self.round == null) {
    return null;
  }

  return $StartRoundDataCopyWith<$Res>(_self.round!, (value) {
    return _then(_self.copyWith(round: value));
  });
}/// Create a copy of StartRoundResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NextActionsEntityCopyWith<$Res>? get next {
    if (_self.next == null) {
    return null;
  }

  return $NextActionsEntityCopyWith<$Res>(_self.next!, (value) {
    return _then(_self.copyWith(next: value));
  });
}
}

StartRoundData _$StartRoundDataFromJson(
  Map<String, dynamic> json
) {
    return StartRoundDataData.fromJson(
      json
    );
}

/// @nodoc
mixin _$StartRoundData {

 String get id;@JsonKey(name: 'courseName') String? get courseName; String? get tee;@JsonKey(name: 'startTime') String? get startTime;
/// Create a copy of StartRoundData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartRoundDataCopyWith<StartRoundData> get copyWith => _$StartRoundDataCopyWithImpl<StartRoundData>(this as StartRoundData, _$identity);

  /// Serializes this StartRoundData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartRoundData&&(identical(other.id, id) || other.id == id)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.tee, tee) || other.tee == tee)&&(identical(other.startTime, startTime) || other.startTime == startTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseName,tee,startTime);

@override
String toString() {
  return 'StartRoundData(id: $id, courseName: $courseName, tee: $tee, startTime: $startTime)';
}


}

/// @nodoc
abstract mixin class $StartRoundDataCopyWith<$Res>  {
  factory $StartRoundDataCopyWith(StartRoundData value, $Res Function(StartRoundData) _then) = _$StartRoundDataCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'courseName') String? courseName, String? tee,@JsonKey(name: 'startTime') String? startTime
});




}
/// @nodoc
class _$StartRoundDataCopyWithImpl<$Res>
    implements $StartRoundDataCopyWith<$Res> {
  _$StartRoundDataCopyWithImpl(this._self, this._then);

  final StartRoundData _self;
  final $Res Function(StartRoundData) _then;

/// Create a copy of StartRoundData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? courseName = freezed,Object? tee = freezed,Object? startTime = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseName: freezed == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String?,tee: freezed == tee ? _self.tee : tee // ignore: cast_nullable_to_non_nullable
as String?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StartRoundData].
extension StartRoundDataPatterns on StartRoundData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( StartRoundDataData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case StartRoundDataData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( StartRoundDataData value)  $default,){
final _that = this;
switch (_that) {
case StartRoundDataData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( StartRoundDataData value)?  $default,){
final _that = this;
switch (_that) {
case StartRoundDataData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'courseName')  String? courseName,  String? tee, @JsonKey(name: 'startTime')  String? startTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case StartRoundDataData() when $default != null:
return $default(_that.id,_that.courseName,_that.tee,_that.startTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'courseName')  String? courseName,  String? tee, @JsonKey(name: 'startTime')  String? startTime)  $default,) {final _that = this;
switch (_that) {
case StartRoundDataData():
return $default(_that.id,_that.courseName,_that.tee,_that.startTime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'courseName')  String? courseName,  String? tee, @JsonKey(name: 'startTime')  String? startTime)?  $default,) {final _that = this;
switch (_that) {
case StartRoundDataData() when $default != null:
return $default(_that.id,_that.courseName,_that.tee,_that.startTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class StartRoundDataData extends StartRoundData {
  const StartRoundDataData({required this.id, @JsonKey(name: 'courseName') this.courseName, this.tee, @JsonKey(name: 'startTime') this.startTime}): super._();
  factory StartRoundDataData.fromJson(Map<String, dynamic> json) => _$StartRoundDataDataFromJson(json);

@override final  String id;
@override@JsonKey(name: 'courseName') final  String? courseName;
@override final  String? tee;
@override@JsonKey(name: 'startTime') final  String? startTime;

/// Create a copy of StartRoundData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartRoundDataDataCopyWith<StartRoundDataData> get copyWith => _$StartRoundDataDataCopyWithImpl<StartRoundDataData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StartRoundDataDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartRoundDataData&&(identical(other.id, id) || other.id == id)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.tee, tee) || other.tee == tee)&&(identical(other.startTime, startTime) || other.startTime == startTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseName,tee,startTime);

@override
String toString() {
  return 'StartRoundData(id: $id, courseName: $courseName, tee: $tee, startTime: $startTime)';
}


}

/// @nodoc
abstract mixin class $StartRoundDataDataCopyWith<$Res> implements $StartRoundDataCopyWith<$Res> {
  factory $StartRoundDataDataCopyWith(StartRoundDataData value, $Res Function(StartRoundDataData) _then) = _$StartRoundDataDataCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'courseName') String? courseName, String? tee,@JsonKey(name: 'startTime') String? startTime
});




}
/// @nodoc
class _$StartRoundDataDataCopyWithImpl<$Res>
    implements $StartRoundDataDataCopyWith<$Res> {
  _$StartRoundDataDataCopyWithImpl(this._self, this._then);

  final StartRoundDataData _self;
  final $Res Function(StartRoundDataData) _then;

/// Create a copy of StartRoundData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? courseName = freezed,Object? tee = freezed,Object? startTime = freezed,}) {
  return _then(StartRoundDataData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseName: freezed == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String?,tee: freezed == tee ? _self.tee : tee // ignore: cast_nullable_to_non_nullable
as String?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
