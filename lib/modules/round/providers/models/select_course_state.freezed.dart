// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_course_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectCourseState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectCourseState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SelectCourseState()';
}


}

/// @nodoc
class $SelectCourseStateCopyWith<$Res>  {
$SelectCourseStateCopyWith(SelectCourseState _, $Res Function(SelectCourseState) __);
}


/// Adds pattern-matching-related methods to [SelectCourseState].
extension SelectCourseStatePatterns on SelectCourseState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SelectCourseStateLoading value)?  loading,TResult Function( SelectCourseStateLoaded value)?  loaded,TResult Function( SelectCourseStateNoCourseFound value)?  noCourseFound,TResult Function( SelectCourseStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SelectCourseStateLoading() when loading != null:
return loading(_that);case SelectCourseStateLoaded() when loaded != null:
return loaded(_that);case SelectCourseStateNoCourseFound() when noCourseFound != null:
return noCourseFound(_that);case SelectCourseStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SelectCourseStateLoading value)  loading,required TResult Function( SelectCourseStateLoaded value)  loaded,required TResult Function( SelectCourseStateNoCourseFound value)  noCourseFound,required TResult Function( SelectCourseStateError value)  error,}){
final _that = this;
switch (_that) {
case SelectCourseStateLoading():
return loading(_that);case SelectCourseStateLoaded():
return loaded(_that);case SelectCourseStateNoCourseFound():
return noCourseFound(_that);case SelectCourseStateError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SelectCourseStateLoading value)?  loading,TResult? Function( SelectCourseStateLoaded value)?  loaded,TResult? Function( SelectCourseStateNoCourseFound value)?  noCourseFound,TResult? Function( SelectCourseStateError value)?  error,}){
final _that = this;
switch (_that) {
case SelectCourseStateLoading() when loading != null:
return loading(_that);case SelectCourseStateLoaded() when loaded != null:
return loaded(_that);case SelectCourseStateNoCourseFound() when noCourseFound != null:
return noCourseFound(_that);case SelectCourseStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( Course course,  Tee? selectedTee,  bool isManuallySelected)?  loaded,TResult Function()?  noCourseFound,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SelectCourseStateLoading() when loading != null:
return loading();case SelectCourseStateLoaded() when loaded != null:
return loaded(_that.course,_that.selectedTee,_that.isManuallySelected);case SelectCourseStateNoCourseFound() when noCourseFound != null:
return noCourseFound();case SelectCourseStateError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( Course course,  Tee? selectedTee,  bool isManuallySelected)  loaded,required TResult Function()  noCourseFound,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case SelectCourseStateLoading():
return loading();case SelectCourseStateLoaded():
return loaded(_that.course,_that.selectedTee,_that.isManuallySelected);case SelectCourseStateNoCourseFound():
return noCourseFound();case SelectCourseStateError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( Course course,  Tee? selectedTee,  bool isManuallySelected)?  loaded,TResult? Function()?  noCourseFound,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case SelectCourseStateLoading() when loading != null:
return loading();case SelectCourseStateLoaded() when loaded != null:
return loaded(_that.course,_that.selectedTee,_that.isManuallySelected);case SelectCourseStateNoCourseFound() when noCourseFound != null:
return noCourseFound();case SelectCourseStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class SelectCourseStateLoading extends SelectCourseState {
  const SelectCourseStateLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectCourseStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SelectCourseState.loading()';
}


}




/// @nodoc


class SelectCourseStateLoaded extends SelectCourseState {
  const SelectCourseStateLoaded({required this.course, this.selectedTee, this.isManuallySelected = false}): super._();
  

 final  Course course;
 final  Tee? selectedTee;
@JsonKey() final  bool isManuallySelected;

/// Create a copy of SelectCourseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectCourseStateLoadedCopyWith<SelectCourseStateLoaded> get copyWith => _$SelectCourseStateLoadedCopyWithImpl<SelectCourseStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectCourseStateLoaded&&(identical(other.course, course) || other.course == course)&&(identical(other.selectedTee, selectedTee) || other.selectedTee == selectedTee)&&(identical(other.isManuallySelected, isManuallySelected) || other.isManuallySelected == isManuallySelected));
}


@override
int get hashCode => Object.hash(runtimeType,course,selectedTee,isManuallySelected);

@override
String toString() {
  return 'SelectCourseState.loaded(course: $course, selectedTee: $selectedTee, isManuallySelected: $isManuallySelected)';
}


}

/// @nodoc
abstract mixin class $SelectCourseStateLoadedCopyWith<$Res> implements $SelectCourseStateCopyWith<$Res> {
  factory $SelectCourseStateLoadedCopyWith(SelectCourseStateLoaded value, $Res Function(SelectCourseStateLoaded) _then) = _$SelectCourseStateLoadedCopyWithImpl;
@useResult
$Res call({
 Course course, Tee? selectedTee, bool isManuallySelected
});


$CourseCopyWith<$Res> get course;$TeeCopyWith<$Res>? get selectedTee;

}
/// @nodoc
class _$SelectCourseStateLoadedCopyWithImpl<$Res>
    implements $SelectCourseStateLoadedCopyWith<$Res> {
  _$SelectCourseStateLoadedCopyWithImpl(this._self, this._then);

  final SelectCourseStateLoaded _self;
  final $Res Function(SelectCourseStateLoaded) _then;

/// Create a copy of SelectCourseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? course = null,Object? selectedTee = freezed,Object? isManuallySelected = null,}) {
  return _then(SelectCourseStateLoaded(
course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as Course,selectedTee: freezed == selectedTee ? _self.selectedTee : selectedTee // ignore: cast_nullable_to_non_nullable
as Tee?,isManuallySelected: null == isManuallySelected ? _self.isManuallySelected : isManuallySelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SelectCourseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseCopyWith<$Res> get course {
  
  return $CourseCopyWith<$Res>(_self.course, (value) {
    return _then(_self.copyWith(course: value));
  });
}/// Create a copy of SelectCourseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeeCopyWith<$Res>? get selectedTee {
    if (_self.selectedTee == null) {
    return null;
  }

  return $TeeCopyWith<$Res>(_self.selectedTee!, (value) {
    return _then(_self.copyWith(selectedTee: value));
  });
}
}

/// @nodoc


class SelectCourseStateNoCourseFound extends SelectCourseState {
  const SelectCourseStateNoCourseFound(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectCourseStateNoCourseFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SelectCourseState.noCourseFound()';
}


}




/// @nodoc


class SelectCourseStateError extends SelectCourseState {
  const SelectCourseStateError({required this.message}): super._();
  

 final  String message;

/// Create a copy of SelectCourseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectCourseStateErrorCopyWith<SelectCourseStateError> get copyWith => _$SelectCourseStateErrorCopyWithImpl<SelectCourseStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectCourseStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SelectCourseState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $SelectCourseStateErrorCopyWith<$Res> implements $SelectCourseStateCopyWith<$Res> {
  factory $SelectCourseStateErrorCopyWith(SelectCourseStateError value, $Res Function(SelectCourseStateError) _then) = _$SelectCourseStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SelectCourseStateErrorCopyWithImpl<$Res>
    implements $SelectCourseStateErrorCopyWith<$Res> {
  _$SelectCourseStateErrorCopyWithImpl(this._self, this._then);

  final SelectCourseStateError _self;
  final $Res Function(SelectCourseStateError) _then;

/// Create a copy of SelectCourseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SelectCourseStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
