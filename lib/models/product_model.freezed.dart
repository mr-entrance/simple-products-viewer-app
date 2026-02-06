// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiListResult<T> {

 List<T> get data; String get result;
/// Create a copy of ApiListResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiListResultCopyWith<T, ApiListResult<T>> get copyWith => _$ApiListResultCopyWithImpl<T, ApiListResult<T>>(this as ApiListResult<T>, _$identity);

  /// Serializes this ApiListResult to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiListResult<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),result);

@override
String toString() {
  return 'ApiListResult<$T>(data: $data, result: $result)';
}


}

/// @nodoc
abstract mixin class $ApiListResultCopyWith<T,$Res>  {
  factory $ApiListResultCopyWith(ApiListResult<T> value, $Res Function(ApiListResult<T>) _then) = _$ApiListResultCopyWithImpl;
@useResult
$Res call({
 List<T> data, String result
});




}
/// @nodoc
class _$ApiListResultCopyWithImpl<T,$Res>
    implements $ApiListResultCopyWith<T, $Res> {
  _$ApiListResultCopyWithImpl(this._self, this._then);

  final ApiListResult<T> _self;
  final $Res Function(ApiListResult<T>) _then;

/// Create a copy of ApiListResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? result = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<T>,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiListResult].
extension ApiListResultPatterns<T> on ApiListResult<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiListResult<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiListResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiListResult<T> value)  $default,){
final _that = this;
switch (_that) {
case _ApiListResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiListResult<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ApiListResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> data,  String result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiListResult() when $default != null:
return $default(_that.data,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> data,  String result)  $default,) {final _that = this;
switch (_that) {
case _ApiListResult():
return $default(_that.data,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> data,  String result)?  $default,) {final _that = this;
switch (_that) {
case _ApiListResult() when $default != null:
return $default(_that.data,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _ApiListResult<T> implements ApiListResult<T> {
  const _ApiListResult({required final  List<T> data, required this.result}): _data = data;
  factory _ApiListResult.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ApiListResultFromJson(json,fromJsonT);

 final  List<T> _data;
@override List<T> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  String result;

/// Create a copy of ApiListResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiListResultCopyWith<T, _ApiListResult<T>> get copyWith => __$ApiListResultCopyWithImpl<T, _ApiListResult<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ApiListResultToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiListResult<T>&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),result);

@override
String toString() {
  return 'ApiListResult<$T>(data: $data, result: $result)';
}


}

/// @nodoc
abstract mixin class _$ApiListResultCopyWith<T,$Res> implements $ApiListResultCopyWith<T, $Res> {
  factory _$ApiListResultCopyWith(_ApiListResult<T> value, $Res Function(_ApiListResult<T>) _then) = __$ApiListResultCopyWithImpl;
@override @useResult
$Res call({
 List<T> data, String result
});




}
/// @nodoc
class __$ApiListResultCopyWithImpl<T,$Res>
    implements _$ApiListResultCopyWith<T, $Res> {
  __$ApiListResultCopyWithImpl(this._self, this._then);

  final _ApiListResult<T> _self;
  final $Res Function(_ApiListResult<T>) _then;

/// Create a copy of ApiListResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? result = null,}) {
  return _then(_ApiListResult<T>(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProductModel {

 String get id;@JsonKey(name: 'SKU') String get sku; String get name; String? get brandName; String get mainImage; PriceModel get price; List<String> get sizes; StockStatus get stockStatus; String get colour; String get description;
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModelCopyWith<ProductModel> get copyWith => _$ProductModelCopyWithImpl<ProductModel>(this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.mainImage, mainImage) || other.mainImage == mainImage)&&(identical(other.price, price) || other.price == price)&&const DeepCollectionEquality().equals(other.sizes, sizes)&&(identical(other.stockStatus, stockStatus) || other.stockStatus == stockStatus)&&(identical(other.colour, colour) || other.colour == colour)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sku,name,brandName,mainImage,price,const DeepCollectionEquality().hash(sizes),stockStatus,colour,description);

@override
String toString() {
  return 'ProductModel(id: $id, sku: $sku, name: $name, brandName: $brandName, mainImage: $mainImage, price: $price, sizes: $sizes, stockStatus: $stockStatus, colour: $colour, description: $description)';
}


}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res>  {
  factory $ProductModelCopyWith(ProductModel value, $Res Function(ProductModel) _then) = _$ProductModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'SKU') String sku, String name, String? brandName, String mainImage, PriceModel price, List<String> sizes, StockStatus stockStatus, String colour, String description
});


$PriceModelCopyWith<$Res> get price;

}
/// @nodoc
class _$ProductModelCopyWithImpl<$Res>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sku = null,Object? name = null,Object? brandName = freezed,Object? mainImage = null,Object? price = null,Object? sizes = null,Object? stockStatus = null,Object? colour = null,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brandName: freezed == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String?,mainImage: null == mainImage ? _self.mainImage : mainImage // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as PriceModel,sizes: null == sizes ? _self.sizes : sizes // ignore: cast_nullable_to_non_nullable
as List<String>,stockStatus: null == stockStatus ? _self.stockStatus : stockStatus // ignore: cast_nullable_to_non_nullable
as StockStatus,colour: null == colour ? _self.colour : colour // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PriceModelCopyWith<$Res> get price {
  
  return $PriceModelCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'SKU')  String sku,  String name,  String? brandName,  String mainImage,  PriceModel price,  List<String> sizes,  StockStatus stockStatus,  String colour,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.sku,_that.name,_that.brandName,_that.mainImage,_that.price,_that.sizes,_that.stockStatus,_that.colour,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'SKU')  String sku,  String name,  String? brandName,  String mainImage,  PriceModel price,  List<String> sizes,  StockStatus stockStatus,  String colour,  String description)  $default,) {final _that = this;
switch (_that) {
case _ProductModel():
return $default(_that.id,_that.sku,_that.name,_that.brandName,_that.mainImage,_that.price,_that.sizes,_that.stockStatus,_that.colour,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'SKU')  String sku,  String name,  String? brandName,  String mainImage,  PriceModel price,  List<String> sizes,  StockStatus stockStatus,  String colour,  String description)?  $default,) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.sku,_that.name,_that.brandName,_that.mainImage,_that.price,_that.sizes,_that.stockStatus,_that.colour,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductModel implements ProductModel {
   _ProductModel({required this.id, @JsonKey(name: 'SKU') required this.sku, required this.name, this.brandName, required this.mainImage, required this.price, required final  List<String> sizes, required this.stockStatus, required this.colour, required this.description}): _sizes = sizes;
  factory _ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'SKU') final  String sku;
@override final  String name;
@override final  String? brandName;
@override final  String mainImage;
@override final  PriceModel price;
 final  List<String> _sizes;
@override List<String> get sizes {
  if (_sizes is EqualUnmodifiableListView) return _sizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sizes);
}

@override final  StockStatus stockStatus;
@override final  String colour;
@override final  String description;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductModelCopyWith<_ProductModel> get copyWith => __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.mainImage, mainImage) || other.mainImage == mainImage)&&(identical(other.price, price) || other.price == price)&&const DeepCollectionEquality().equals(other._sizes, _sizes)&&(identical(other.stockStatus, stockStatus) || other.stockStatus == stockStatus)&&(identical(other.colour, colour) || other.colour == colour)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sku,name,brandName,mainImage,price,const DeepCollectionEquality().hash(_sizes),stockStatus,colour,description);

@override
String toString() {
  return 'ProductModel(id: $id, sku: $sku, name: $name, brandName: $brandName, mainImage: $mainImage, price: $price, sizes: $sizes, stockStatus: $stockStatus, colour: $colour, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res> implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(_ProductModel value, $Res Function(_ProductModel) _then) = __$ProductModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'SKU') String sku, String name, String? brandName, String mainImage, PriceModel price, List<String> sizes, StockStatus stockStatus, String colour, String description
});


@override $PriceModelCopyWith<$Res> get price;

}
/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sku = null,Object? name = null,Object? brandName = freezed,Object? mainImage = null,Object? price = null,Object? sizes = null,Object? stockStatus = null,Object? colour = null,Object? description = null,}) {
  return _then(_ProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brandName: freezed == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String?,mainImage: null == mainImage ? _self.mainImage : mainImage // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as PriceModel,sizes: null == sizes ? _self._sizes : sizes // ignore: cast_nullable_to_non_nullable
as List<String>,stockStatus: null == stockStatus ? _self.stockStatus : stockStatus // ignore: cast_nullable_to_non_nullable
as StockStatus,colour: null == colour ? _self.colour : colour // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PriceModelCopyWith<$Res> get price {
  
  return $PriceModelCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}


/// @nodoc
mixin _$PriceModel {

 String get amount; String get currency;
/// Create a copy of PriceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PriceModelCopyWith<PriceModel> get copyWith => _$PriceModelCopyWithImpl<PriceModel>(this as PriceModel, _$identity);

  /// Serializes this PriceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PriceModel&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,currency);

@override
String toString() {
  return 'PriceModel(amount: $amount, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $PriceModelCopyWith<$Res>  {
  factory $PriceModelCopyWith(PriceModel value, $Res Function(PriceModel) _then) = _$PriceModelCopyWithImpl;
@useResult
$Res call({
 String amount, String currency
});




}
/// @nodoc
class _$PriceModelCopyWithImpl<$Res>
    implements $PriceModelCopyWith<$Res> {
  _$PriceModelCopyWithImpl(this._self, this._then);

  final PriceModel _self;
  final $Res Function(PriceModel) _then;

/// Create a copy of PriceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? currency = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PriceModel].
extension PriceModelPatterns on PriceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PriceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PriceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PriceModel value)  $default,){
final _that = this;
switch (_that) {
case _PriceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PriceModel value)?  $default,){
final _that = this;
switch (_that) {
case _PriceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String amount,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PriceModel() when $default != null:
return $default(_that.amount,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String amount,  String currency)  $default,) {final _that = this;
switch (_that) {
case _PriceModel():
return $default(_that.amount,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String amount,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _PriceModel() when $default != null:
return $default(_that.amount,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PriceModel implements PriceModel {
   _PriceModel({required this.amount, required this.currency});
  factory _PriceModel.fromJson(Map<String, dynamic> json) => _$PriceModelFromJson(json);

@override final  String amount;
@override final  String currency;

/// Create a copy of PriceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PriceModelCopyWith<_PriceModel> get copyWith => __$PriceModelCopyWithImpl<_PriceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PriceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PriceModel&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,currency);

@override
String toString() {
  return 'PriceModel(amount: $amount, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$PriceModelCopyWith<$Res> implements $PriceModelCopyWith<$Res> {
  factory _$PriceModelCopyWith(_PriceModel value, $Res Function(_PriceModel) _then) = __$PriceModelCopyWithImpl;
@override @useResult
$Res call({
 String amount, String currency
});




}
/// @nodoc
class __$PriceModelCopyWithImpl<$Res>
    implements _$PriceModelCopyWith<$Res> {
  __$PriceModelCopyWithImpl(this._self, this._then);

  final _PriceModel _self;
  final $Res Function(_PriceModel) _then;

/// Create a copy of PriceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? currency = null,}) {
  return _then(_PriceModel(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
