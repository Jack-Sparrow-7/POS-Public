// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuProduct {

 String get id; String get name; String? get description; int get price; String? get imageUrl; String get categoryId; bool get isAvailable;
/// Create a copy of MenuProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuProductCopyWith<MenuProduct> get copyWith => _$MenuProductCopyWithImpl<MenuProduct>(this as MenuProduct, _$identity);

  /// Serializes this MenuProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,imageUrl,categoryId,isAvailable);

@override
String toString() {
  return 'MenuProduct(id: $id, name: $name, description: $description, price: $price, imageUrl: $imageUrl, categoryId: $categoryId, isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class $MenuProductCopyWith<$Res>  {
  factory $MenuProductCopyWith(MenuProduct value, $Res Function(MenuProduct) _then) = _$MenuProductCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, int price, String? imageUrl, String categoryId, bool isAvailable
});




}
/// @nodoc
class _$MenuProductCopyWithImpl<$Res>
    implements $MenuProductCopyWith<$Res> {
  _$MenuProductCopyWithImpl(this._self, this._then);

  final MenuProduct _self;
  final $Res Function(MenuProduct) _then;

/// Create a copy of MenuProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? price = null,Object? imageUrl = freezed,Object? categoryId = null,Object? isAvailable = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuProduct].
extension MenuProductPatterns on MenuProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuProduct value)  $default,){
final _that = this;
switch (_that) {
case _MenuProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuProduct value)?  $default,){
final _that = this;
switch (_that) {
case _MenuProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  int price,  String? imageUrl,  String categoryId,  bool isAvailable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuProduct() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.imageUrl,_that.categoryId,_that.isAvailable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  int price,  String? imageUrl,  String categoryId,  bool isAvailable)  $default,) {final _that = this;
switch (_that) {
case _MenuProduct():
return $default(_that.id,_that.name,_that.description,_that.price,_that.imageUrl,_that.categoryId,_that.isAvailable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  int price,  String? imageUrl,  String categoryId,  bool isAvailable)?  $default,) {final _that = this;
switch (_that) {
case _MenuProduct() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.imageUrl,_that.categoryId,_that.isAvailable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuProduct implements MenuProduct {
  const _MenuProduct({required this.id, required this.name, this.description, required this.price, this.imageUrl, required this.categoryId, required this.isAvailable});
  factory _MenuProduct.fromJson(Map<String, dynamic> json) => _$MenuProductFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  int price;
@override final  String? imageUrl;
@override final  String categoryId;
@override final  bool isAvailable;

/// Create a copy of MenuProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuProductCopyWith<_MenuProduct> get copyWith => __$MenuProductCopyWithImpl<_MenuProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,imageUrl,categoryId,isAvailable);

@override
String toString() {
  return 'MenuProduct(id: $id, name: $name, description: $description, price: $price, imageUrl: $imageUrl, categoryId: $categoryId, isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class _$MenuProductCopyWith<$Res> implements $MenuProductCopyWith<$Res> {
  factory _$MenuProductCopyWith(_MenuProduct value, $Res Function(_MenuProduct) _then) = __$MenuProductCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, int price, String? imageUrl, String categoryId, bool isAvailable
});




}
/// @nodoc
class __$MenuProductCopyWithImpl<$Res>
    implements _$MenuProductCopyWith<$Res> {
  __$MenuProductCopyWithImpl(this._self, this._then);

  final _MenuProduct _self;
  final $Res Function(_MenuProduct) _then;

/// Create a copy of MenuProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? price = null,Object? imageUrl = freezed,Object? categoryId = null,Object? isAvailable = null,}) {
  return _then(_MenuProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
