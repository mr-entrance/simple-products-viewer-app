import 'package:simple_product_viewer_app/models/cart_item.dart';
import 'package:simple_product_viewer_app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<List<CartItem>> {
  CartCubit() : super([]);

  Future<void> addProduct({
    required ProductModel product,
    String selectedSize = '',
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    final newItem = CartItem(product: product, selectedSize: selectedSize);
    // Add the product to the front of the list
    final updatedList = [newItem, ...state];
    emit(updatedList);
  }

  Future<void> removeProduct(ProductModel product) async {
    await Future.delayed(const Duration(seconds: 1));
    final currentList = state;
    // Remove the product from the list
    currentList.removeWhere((p) => p.product.id == product.id);
    emit(List.from(currentList));
  }
}
