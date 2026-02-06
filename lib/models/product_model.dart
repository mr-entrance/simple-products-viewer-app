import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class ApiListResult<T> with _$ApiListResult<T> {
  const factory ApiListResult({required List<T> data, required String result}) =
      _ApiListResult<T>;

  factory ApiListResult.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ApiListResultFromJson(json, fromJsonT);
}

@freezed
abstract class ProductModel with _$ProductModel {
  factory ProductModel({
    required String id,
    @JsonKey(name: 'SKU') required String sku,
    required String name,
    String? brandName,
    required String mainImage,
    required PriceModel price,
    required List<String> sizes,
    required StockStatus stockStatus,
    required String colour,
    required String description,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, Object?> json) =>
      _$ProductModelFromJson(json);
}

@freezed
abstract class PriceModel with _$PriceModel {
  factory PriceModel({required String amount, required String currency}) =
      _PriceModel;

  factory PriceModel.fromJson(Map<String, Object?> json) =>
      _$PriceModelFromJson(json);
}

extension PriceModelX on PriceModel {
  String get formattedAmount =>
      NumberFormat.simpleCurrency(name: currency).format(double.parse(amount));
}

enum StockStatus {
  @JsonValue('IN STOCK')
  inStock,
  @JsonValue('OUT OF STOCK')
  outOfStock,
}
