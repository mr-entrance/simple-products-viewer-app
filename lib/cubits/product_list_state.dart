import 'package:simple_product_viewer_app/models/product_model.dart';

sealed class ProductListState {
  const ProductListState();
}

final class ProductListInitial extends ProductListState {
  const ProductListInitial();
}

final class ProductListLoadInProgress extends ProductListState {
  const ProductListLoadInProgress();
}

final class ProductListLoadSuccess extends ProductListState {
  const ProductListLoadSuccess({required this.products});
  final List<ProductModel> products;
}

final class ProductListLoadFailure extends ProductListState {
  const ProductListLoadFailure({required this.exception});
  final Exception exception;
}
