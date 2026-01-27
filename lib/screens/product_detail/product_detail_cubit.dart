import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_product_viewer_app/logger.dart';
import 'package:simple_product_viewer_app/screens/product_detail/product_detail_state.dart';
import 'package:simple_product_viewer_app/services/product_service.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final ProductService _productService;
  ProductDetailCubit(ProductService productService)
    : _productService = productService,
      super(const ProductDetailInitial());
  void fetchProduct({required String id}) async {
    emit(const ProductDetailLoadInProgress());
    try {
      final product = await _productService.fetchProduct(id);
      emit(ProductDetailLoadSuccess(product: product));
    } catch (e) {
      logger.e('Error fetching products: $e');
      emit(
        ProductDetailLoadFailure(
          exception: Exception('Failed to load products'),
        ),
      );
    }
  }
}
