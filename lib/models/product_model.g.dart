// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiListResult<T> _$ApiListResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _ApiListResult<T>(
  data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
  result: json['result'] as String,
);

Map<String, dynamic> _$ApiListResultToJson<T>(
  _ApiListResult<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data.map(toJsonT).toList(),
  'result': instance.result,
};

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: json['id'] as String,
      sku: json['SKU'] as String,
      name: json['name'] as String,
      brandName: json['brandName'] as String? ?? '',
      mainImage: json['mainImage'] as String,
      price: PriceModel.fromJson(json['price'] as Map<String, dynamic>),
      sizes: (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
      stockStatus: $enumDecode(_$StockStatusEnumMap, json['stockStatus']),
      colour: json['colour'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'SKU': instance.sku,
      'name': instance.name,
      'brandName': instance.brandName,
      'mainImage': instance.mainImage,
      'price': instance.price,
      'sizes': instance.sizes,
      'stockStatus': _$StockStatusEnumMap[instance.stockStatus]!,
      'colour': instance.colour,
      'description': instance.description,
    };

const _$StockStatusEnumMap = {
  StockStatus.inStock: 'IN STOCK',
  StockStatus.outOfStock: 'OUT OF STOCK',
};

_PriceModel _$PriceModelFromJson(Map<String, dynamic> json) => _PriceModel(
  amount: json['amount'] as String,
  currency: json['currency'] as String,
);

Map<String, dynamic> _$PriceModelToJson(_PriceModel instance) =>
    <String, dynamic>{'amount': instance.amount, 'currency': instance.currency};
