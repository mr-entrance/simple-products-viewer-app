import 'package:simple_product_viewer_app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentlyViewedProductListCubit extends Cubit<List<ProductModel>> {
  static const int maxRecentlyViewedLength = 10;
  RecentlyViewedProductListCubit() : super([]);

  void addProduct(ProductModel product) {
    final currentList = state;
    // Remove the product if it already exists to avoid duplicates
    currentList.removeWhere((p) => p.id == product.id);
    // Add the product to the front of the list
    final updatedList = [product, ...currentList];
    // Limit the list to the most recent 10 products
    if (updatedList.length > maxRecentlyViewedLength) {
      updatedList.removeLast();
    }
    emit(updatedList);
  }
}
