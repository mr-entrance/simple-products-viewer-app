import 'package:simple_product_viewer_app/models/product_model.dart';

sealed class ProductDetailState {
  const ProductDetailState();
}

final class ProductDetailInitial extends ProductDetailState {
  const ProductDetailInitial();
}

final class ProductDetailLoadInProgress extends ProductDetailState {
  const ProductDetailLoadInProgress();
}

final class ProductDetailLoadSuccess extends ProductDetailState {
  const ProductDetailLoadSuccess({required this.product});
  final ProductModel product;
}

final class ProductDetailLoadFailure extends ProductDetailState {
  const ProductDetailLoadFailure({required this.exception});
  final Exception exception;
}
