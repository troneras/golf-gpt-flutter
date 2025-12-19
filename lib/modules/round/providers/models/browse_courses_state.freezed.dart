// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'browse_courses_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BrowseCoursesState {

 BrowseCoursesTab get currentTab; List<Course> get nearbyCourses; List<Course> get recentCourses; List<Course> get searchResults; String get searchQuery; bool get isLoadingNearby; bool get isLoadingRecent; bool get isLoadingSearch; String? get nearbyError; String? get recentError; String? get searchError;
/// Create a copy of BrowseCoursesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrowseCoursesStateCopyWith<BrowseCoursesState> get copyWith => _$BrowseCoursesStateCopyWithImpl<BrowseCoursesState>(this as BrowseCoursesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrowseCoursesState&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&const DeepCollectionEquality().equals(other.nearbyCourses, nearbyCourses)&&const DeepCollectionEquality().equals(other.recentCourses, recentCourses)&&const DeepCollectionEquality().equals(other.searchResults, searchResults)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isLoadingNearby, isLoadingNearby) || other.isLoadingNearby == isLoadingNearby)&&(identical(other.isLoadingRecent, isLoadingRecent) || other.isLoadingRecent == isLoadingRecent)&&(identical(other.isLoadingSearch, isLoadingSearch) || other.isLoadingSearch == isLoadingSearch)&&(identical(other.nearbyError, nearbyError) || other.nearbyError == nearbyError)&&(identical(other.recentError, recentError) || other.recentError == recentError)&&(identical(other.searchError, searchError) || other.searchError == searchError));
}


@override
int get hashCode => Object.hash(runtimeType,currentTab,const DeepCollectionEquality().hash(nearbyCourses),const DeepCollectionEquality().hash(recentCourses),const DeepCollectionEquality().hash(searchResults),searchQuery,isLoadingNearby,isLoadingRecent,isLoadingSearch,nearbyError,recentError,searchError);

@override
String toString() {
  return 'BrowseCoursesState(currentTab: $currentTab, nearbyCourses: $nearbyCourses, recentCourses: $recentCourses, searchResults: $searchResults, searchQuery: $searchQuery, isLoadingNearby: $isLoadingNearby, isLoadingRecent: $isLoadingRecent, isLoadingSearch: $isLoadingSearch, nearbyError: $nearbyError, recentError: $recentError, searchError: $searchError)';
}


}

/// @nodoc
abstract mixin class $BrowseCoursesStateCopyWith<$Res>  {
  factory $BrowseCoursesStateCopyWith(BrowseCoursesState value, $Res Function(BrowseCoursesState) _then) = _$BrowseCoursesStateCopyWithImpl;
@useResult
$Res call({
 BrowseCoursesTab currentTab, List<Course> nearbyCourses, List<Course> recentCourses, List<Course> searchResults, String searchQuery, bool isLoadingNearby, bool isLoadingRecent, bool isLoadingSearch, String? nearbyError, String? recentError, String? searchError
});




}
/// @nodoc
class _$BrowseCoursesStateCopyWithImpl<$Res>
    implements $BrowseCoursesStateCopyWith<$Res> {
  _$BrowseCoursesStateCopyWithImpl(this._self, this._then);

  final BrowseCoursesState _self;
  final $Res Function(BrowseCoursesState) _then;

/// Create a copy of BrowseCoursesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentTab = null,Object? nearbyCourses = null,Object? recentCourses = null,Object? searchResults = null,Object? searchQuery = null,Object? isLoadingNearby = null,Object? isLoadingRecent = null,Object? isLoadingSearch = null,Object? nearbyError = freezed,Object? recentError = freezed,Object? searchError = freezed,}) {
  return _then(_self.copyWith(
currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as BrowseCoursesTab,nearbyCourses: null == nearbyCourses ? _self.nearbyCourses : nearbyCourses // ignore: cast_nullable_to_non_nullable
as List<Course>,recentCourses: null == recentCourses ? _self.recentCourses : recentCourses // ignore: cast_nullable_to_non_nullable
as List<Course>,searchResults: null == searchResults ? _self.searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<Course>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isLoadingNearby: null == isLoadingNearby ? _self.isLoadingNearby : isLoadingNearby // ignore: cast_nullable_to_non_nullable
as bool,isLoadingRecent: null == isLoadingRecent ? _self.isLoadingRecent : isLoadingRecent // ignore: cast_nullable_to_non_nullable
as bool,isLoadingSearch: null == isLoadingSearch ? _self.isLoadingSearch : isLoadingSearch // ignore: cast_nullable_to_non_nullable
as bool,nearbyError: freezed == nearbyError ? _self.nearbyError : nearbyError // ignore: cast_nullable_to_non_nullable
as String?,recentError: freezed == recentError ? _self.recentError : recentError // ignore: cast_nullable_to_non_nullable
as String?,searchError: freezed == searchError ? _self.searchError : searchError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BrowseCoursesState].
extension BrowseCoursesStatePatterns on BrowseCoursesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( BrowseCoursesStateData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case BrowseCoursesStateData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( BrowseCoursesStateData value)  $default,){
final _that = this;
switch (_that) {
case BrowseCoursesStateData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( BrowseCoursesStateData value)?  $default,){
final _that = this;
switch (_that) {
case BrowseCoursesStateData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BrowseCoursesTab currentTab,  List<Course> nearbyCourses,  List<Course> recentCourses,  List<Course> searchResults,  String searchQuery,  bool isLoadingNearby,  bool isLoadingRecent,  bool isLoadingSearch,  String? nearbyError,  String? recentError,  String? searchError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case BrowseCoursesStateData() when $default != null:
return $default(_that.currentTab,_that.nearbyCourses,_that.recentCourses,_that.searchResults,_that.searchQuery,_that.isLoadingNearby,_that.isLoadingRecent,_that.isLoadingSearch,_that.nearbyError,_that.recentError,_that.searchError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BrowseCoursesTab currentTab,  List<Course> nearbyCourses,  List<Course> recentCourses,  List<Course> searchResults,  String searchQuery,  bool isLoadingNearby,  bool isLoadingRecent,  bool isLoadingSearch,  String? nearbyError,  String? recentError,  String? searchError)  $default,) {final _that = this;
switch (_that) {
case BrowseCoursesStateData():
return $default(_that.currentTab,_that.nearbyCourses,_that.recentCourses,_that.searchResults,_that.searchQuery,_that.isLoadingNearby,_that.isLoadingRecent,_that.isLoadingSearch,_that.nearbyError,_that.recentError,_that.searchError);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BrowseCoursesTab currentTab,  List<Course> nearbyCourses,  List<Course> recentCourses,  List<Course> searchResults,  String searchQuery,  bool isLoadingNearby,  bool isLoadingRecent,  bool isLoadingSearch,  String? nearbyError,  String? recentError,  String? searchError)?  $default,) {final _that = this;
switch (_that) {
case BrowseCoursesStateData() when $default != null:
return $default(_that.currentTab,_that.nearbyCourses,_that.recentCourses,_that.searchResults,_that.searchQuery,_that.isLoadingNearby,_that.isLoadingRecent,_that.isLoadingSearch,_that.nearbyError,_that.recentError,_that.searchError);case _:
  return null;

}
}

}

/// @nodoc


class BrowseCoursesStateData extends BrowseCoursesState {
  const BrowseCoursesStateData({this.currentTab = BrowseCoursesTab.nearby, final  List<Course> nearbyCourses = const [], final  List<Course> recentCourses = const [], final  List<Course> searchResults = const [], this.searchQuery = '', this.isLoadingNearby = false, this.isLoadingRecent = false, this.isLoadingSearch = false, this.nearbyError, this.recentError, this.searchError}): _nearbyCourses = nearbyCourses,_recentCourses = recentCourses,_searchResults = searchResults,super._();
  

@override@JsonKey() final  BrowseCoursesTab currentTab;
 final  List<Course> _nearbyCourses;
@override@JsonKey() List<Course> get nearbyCourses {
  if (_nearbyCourses is EqualUnmodifiableListView) return _nearbyCourses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nearbyCourses);
}

 final  List<Course> _recentCourses;
@override@JsonKey() List<Course> get recentCourses {
  if (_recentCourses is EqualUnmodifiableListView) return _recentCourses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentCourses);
}

 final  List<Course> _searchResults;
@override@JsonKey() List<Course> get searchResults {
  if (_searchResults is EqualUnmodifiableListView) return _searchResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResults);
}

@override@JsonKey() final  String searchQuery;
@override@JsonKey() final  bool isLoadingNearby;
@override@JsonKey() final  bool isLoadingRecent;
@override@JsonKey() final  bool isLoadingSearch;
@override final  String? nearbyError;
@override final  String? recentError;
@override final  String? searchError;

/// Create a copy of BrowseCoursesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrowseCoursesStateDataCopyWith<BrowseCoursesStateData> get copyWith => _$BrowseCoursesStateDataCopyWithImpl<BrowseCoursesStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrowseCoursesStateData&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&const DeepCollectionEquality().equals(other._nearbyCourses, _nearbyCourses)&&const DeepCollectionEquality().equals(other._recentCourses, _recentCourses)&&const DeepCollectionEquality().equals(other._searchResults, _searchResults)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isLoadingNearby, isLoadingNearby) || other.isLoadingNearby == isLoadingNearby)&&(identical(other.isLoadingRecent, isLoadingRecent) || other.isLoadingRecent == isLoadingRecent)&&(identical(other.isLoadingSearch, isLoadingSearch) || other.isLoadingSearch == isLoadingSearch)&&(identical(other.nearbyError, nearbyError) || other.nearbyError == nearbyError)&&(identical(other.recentError, recentError) || other.recentError == recentError)&&(identical(other.searchError, searchError) || other.searchError == searchError));
}


@override
int get hashCode => Object.hash(runtimeType,currentTab,const DeepCollectionEquality().hash(_nearbyCourses),const DeepCollectionEquality().hash(_recentCourses),const DeepCollectionEquality().hash(_searchResults),searchQuery,isLoadingNearby,isLoadingRecent,isLoadingSearch,nearbyError,recentError,searchError);

@override
String toString() {
  return 'BrowseCoursesState(currentTab: $currentTab, nearbyCourses: $nearbyCourses, recentCourses: $recentCourses, searchResults: $searchResults, searchQuery: $searchQuery, isLoadingNearby: $isLoadingNearby, isLoadingRecent: $isLoadingRecent, isLoadingSearch: $isLoadingSearch, nearbyError: $nearbyError, recentError: $recentError, searchError: $searchError)';
}


}

/// @nodoc
abstract mixin class $BrowseCoursesStateDataCopyWith<$Res> implements $BrowseCoursesStateCopyWith<$Res> {
  factory $BrowseCoursesStateDataCopyWith(BrowseCoursesStateData value, $Res Function(BrowseCoursesStateData) _then) = _$BrowseCoursesStateDataCopyWithImpl;
@override @useResult
$Res call({
 BrowseCoursesTab currentTab, List<Course> nearbyCourses, List<Course> recentCourses, List<Course> searchResults, String searchQuery, bool isLoadingNearby, bool isLoadingRecent, bool isLoadingSearch, String? nearbyError, String? recentError, String? searchError
});




}
/// @nodoc
class _$BrowseCoursesStateDataCopyWithImpl<$Res>
    implements $BrowseCoursesStateDataCopyWith<$Res> {
  _$BrowseCoursesStateDataCopyWithImpl(this._self, this._then);

  final BrowseCoursesStateData _self;
  final $Res Function(BrowseCoursesStateData) _then;

/// Create a copy of BrowseCoursesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentTab = null,Object? nearbyCourses = null,Object? recentCourses = null,Object? searchResults = null,Object? searchQuery = null,Object? isLoadingNearby = null,Object? isLoadingRecent = null,Object? isLoadingSearch = null,Object? nearbyError = freezed,Object? recentError = freezed,Object? searchError = freezed,}) {
  return _then(BrowseCoursesStateData(
currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as BrowseCoursesTab,nearbyCourses: null == nearbyCourses ? _self._nearbyCourses : nearbyCourses // ignore: cast_nullable_to_non_nullable
as List<Course>,recentCourses: null == recentCourses ? _self._recentCourses : recentCourses // ignore: cast_nullable_to_non_nullable
as List<Course>,searchResults: null == searchResults ? _self._searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<Course>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isLoadingNearby: null == isLoadingNearby ? _self.isLoadingNearby : isLoadingNearby // ignore: cast_nullable_to_non_nullable
as bool,isLoadingRecent: null == isLoadingRecent ? _self.isLoadingRecent : isLoadingRecent // ignore: cast_nullable_to_non_nullable
as bool,isLoadingSearch: null == isLoadingSearch ? _self.isLoadingSearch : isLoadingSearch // ignore: cast_nullable_to_non_nullable
as bool,nearbyError: freezed == nearbyError ? _self.nearbyError : nearbyError // ignore: cast_nullable_to_non_nullable
as String?,recentError: freezed == recentError ? _self.recentError : recentError // ignore: cast_nullable_to_non_nullable
as String?,searchError: freezed == searchError ? _self.searchError : searchError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
