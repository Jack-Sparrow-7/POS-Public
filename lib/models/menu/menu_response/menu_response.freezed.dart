// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuResponse {

 String get status; String get message; MenuData get data;
/// Create a copy of MenuResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuResponseCopyWith<MenuResponse> get copyWith => _$MenuResponseCopyWithImpl<MenuResponse>(this as MenuResponse, _$identity);

  /// Serializes this MenuResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'MenuResponse(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $MenuResponseCopyWith<$Res>  {
  factory $MenuResponseCopyWith(MenuResponse value, $Res Function(MenuResponse) _then) = _$MenuResponseCopyWithImpl;
@useResult
$Res call({
 String status, String message, MenuData data
});


$MenuDataCopyWith<$Res> get data;

}
/// @nodoc
class _$MenuResponseCopyWithImpl<$Res>
    implements $MenuResponseCopyWith<$Res> {
  _$MenuResponseCopyWithImpl(this._self, this._then);

  final MenuResponse _self;
  final $Res Function(MenuResponse) _then;

/// Create a copy of MenuResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MenuData,
  ));
}
/// Create a copy of MenuResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuDataCopyWith<$Res> get data {
  
  return $MenuDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [MenuResponse].
extension MenuResponsePatterns on MenuResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuResponse value)  $default,){
final _that = this;
switch (_that) {
case _MenuResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MenuResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  String message,  MenuData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuResponse() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  String message,  MenuData data)  $default,) {final _that = this;
switch (_that) {
case _MenuResponse():
return $default(_that.status,_that.message,_that.data);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  String message,  MenuData data)?  $default,) {final _that = this;
switch (_that) {
case _MenuResponse() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuResponse implements MenuResponse {
  const _MenuResponse({required this.status, required this.message, required this.data});
  factory _MenuResponse.fromJson(Map<String, dynamic> json) => _$MenuResponseFromJson(json);

@override final  String status;
@override final  String message;
@override final  MenuData data;

/// Create a copy of MenuResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuResponseCopyWith<_MenuResponse> get copyWith => __$MenuResponseCopyWithImpl<_MenuResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'MenuResponse(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$MenuResponseCopyWith<$Res> implements $MenuResponseCopyWith<$Res> {
  factory _$MenuResponseCopyWith(_MenuResponse value, $Res Function(_MenuResponse) _then) = __$MenuResponseCopyWithImpl;
@override @useResult
$Res call({
 String status, String message, MenuData data
});


@override $MenuDataCopyWith<$Res> get data;

}
/// @nodoc
class __$MenuResponseCopyWithImpl<$Res>
    implements _$MenuResponseCopyWith<$Res> {
  __$MenuResponseCopyWithImpl(this._self, this._then);

  final _MenuResponse _self;
  final $Res Function(_MenuResponse) _then;

/// Create a copy of MenuResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? data = null,}) {
  return _then(_MenuResponse(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MenuData,
  ));
}

/// Create a copy of MenuResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuDataCopyWith<$Res> get data {
  
  return $MenuDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$MenuData {

 MenuStore get store; List<MenuCategory> get categories; List<MenuProduct> get products;
/// Create a copy of MenuData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuDataCopyWith<MenuData> get copyWith => _$MenuDataCopyWithImpl<MenuData>(this as MenuData, _$identity);

  /// Serializes this MenuData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuData&&(identical(other.store, store) || other.store == store)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.products, products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,store,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'MenuData(store: $store, categories: $categories, products: $products)';
}


}

/// @nodoc
abstract mixin class $MenuDataCopyWith<$Res>  {
  factory $MenuDataCopyWith(MenuData value, $Res Function(MenuData) _then) = _$MenuDataCopyWithImpl;
@useResult
$Res call({
 MenuStore store, List<MenuCategory> categories, List<MenuProduct> products
});


$MenuStoreCopyWith<$Res> get store;

}
/// @nodoc
class _$MenuDataCopyWithImpl<$Res>
    implements $MenuDataCopyWith<$Res> {
  _$MenuDataCopyWithImpl(this._self, this._then);

  final MenuData _self;
  final $Res Function(MenuData) _then;

/// Create a copy of MenuData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? store = null,Object? categories = null,Object? products = null,}) {
  return _then(_self.copyWith(
store: null == store ? _self.store : store // ignore: cast_nullable_to_non_nullable
as MenuStore,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<MenuCategory>,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<MenuProduct>,
  ));
}
/// Create a copy of MenuData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuStoreCopyWith<$Res> get store {
  
  return $MenuStoreCopyWith<$Res>(_self.store, (value) {
    return _then(_self.copyWith(store: value));
  });
}
}


/// Adds pattern-matching-related methods to [MenuData].
extension MenuDataPatterns on MenuData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuData value)  $default,){
final _that = this;
switch (_that) {
case _MenuData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuData value)?  $default,){
final _that = this;
switch (_that) {
case _MenuData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MenuStore store,  List<MenuCategory> categories,  List<MenuProduct> products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuData() when $default != null:
return $default(_that.store,_that.categories,_that.products);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MenuStore store,  List<MenuCategory> categories,  List<MenuProduct> products)  $default,) {final _that = this;
switch (_that) {
case _MenuData():
return $default(_that.store,_that.categories,_that.products);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MenuStore store,  List<MenuCategory> categories,  List<MenuProduct> products)?  $default,) {final _that = this;
switch (_that) {
case _MenuData() when $default != null:
return $default(_that.store,_that.categories,_that.products);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuData implements MenuData {
  const _MenuData({required this.store, required final  List<MenuCategory> categories, required final  List<MenuProduct> products}): _categories = categories,_products = products;
  factory _MenuData.fromJson(Map<String, dynamic> json) => _$MenuDataFromJson(json);

@override final  MenuStore store;
 final  List<MenuCategory> _categories;
@override List<MenuCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<MenuProduct> _products;
@override List<MenuProduct> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of MenuData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuDataCopyWith<_MenuData> get copyWith => __$MenuDataCopyWithImpl<_MenuData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuData&&(identical(other.store, store) || other.store == store)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._products, _products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,store,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'MenuData(store: $store, categories: $categories, products: $products)';
}


}

/// @nodoc
abstract mixin class _$MenuDataCopyWith<$Res> implements $MenuDataCopyWith<$Res> {
  factory _$MenuDataCopyWith(_MenuData value, $Res Function(_MenuData) _then) = __$MenuDataCopyWithImpl;
@override @useResult
$Res call({
 MenuStore store, List<MenuCategory> categories, List<MenuProduct> products
});


@override $MenuStoreCopyWith<$Res> get store;

}
/// @nodoc
class __$MenuDataCopyWithImpl<$Res>
    implements _$MenuDataCopyWith<$Res> {
  __$MenuDataCopyWithImpl(this._self, this._then);

  final _MenuData _self;
  final $Res Function(_MenuData) _then;

/// Create a copy of MenuData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? store = null,Object? categories = null,Object? products = null,}) {
  return _then(_MenuData(
store: null == store ? _self.store : store // ignore: cast_nullable_to_non_nullable
as MenuStore,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<MenuCategory>,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<MenuProduct>,
  ));
}

/// Create a copy of MenuData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuStoreCopyWith<$Res> get store {
  
  return $MenuStoreCopyWith<$Res>(_self.store, (value) {
    return _then(_self.copyWith(store: value));
  });
}
}

// dart format on
