import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_product_viewer_app/logger.dart';
import 'package:simple_product_viewer_app/models/product_model.dart';
import 'package:simple_product_viewer_app/screens/product_list/product_list_state.dart';
import 'package:simple_product_viewer_app/services/product_service.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final ProductService _productService;
  ProductListCubit(ProductService productService)
    : _productService = productService,
      super(const ProductListInitial());

  void fetchProducts() async {
    emit(const ProductListLoadInProgress());
    try {
      final products = await _productService.fetchProductList();
      emit(ProductListLoadSuccess(products: products));
    } catch (e) {
      logger.e('Error fetching products: $e');
      emit(
        ProductListLoadFailure(exception: Exception('Failed to load products')),
      );
    }
  }

  Future<ProductModel> fetchProduct({required String id}) async {
    try {
      final list = state is ProductListLoadSuccess
          ? (state as ProductListLoadSuccess).products
          : await _productService.fetchProductList();
      return list.firstWhere((product) => product.id == id);
    } catch (e) {
      logger.e('Error fetching product: $e');
      throw Exception('Failed to load product');
    }
  }
}
