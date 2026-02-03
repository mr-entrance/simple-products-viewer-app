import 'package:simple_product_viewer_app/models/cart_item.dart';
import 'package:simple_product_viewer_app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_product_viewer_app/screens/cart/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartLoadSuccess(items: []));

  Future<void> addProduct({
    required ProductModel product,
    String selectedSize = '',
  }) async {
    try {
      final currentState = state as CartLoadSuccess;
      final cartItems = currentState.items;
      emit(CartLoadInProgress(items: cartItems));
      await Future.delayed(const Duration(seconds: 1)); // mock api delay
      // check
      if (product.sizes.isNotEmpty && !product.sizes.contains(selectedSize)) {
        emit(
          CartLoadFailure(message: 'Selected product size is not available.'),
        );
        return;
      }
      final sameSizedExist = cartItems.any(
        (p) => p.product.id == product.id && p.selectedSize == selectedSize,
      );
      if (sameSizedExist) {
        final currentQuantity = cartItems
            .firstWhere(
              (p) =>
                  p.product.id == product.id && p.selectedSize == selectedSize,
            )
            .quantity;
        final updatedList = cartItems.map((item) {
          if (item.product.id == product.id &&
              item.selectedSize == selectedSize) {
            return CartItem(
              product: item.product,
              quantity: currentQuantity + 1,
              selectedSize: item.selectedSize,
            );
          }
          return item;
        }).toList();
        emit(CartLoadSuccess(items: updatedList));
        return;
      }
      final newItem = CartItem(
        product: product,
        quantity: 1,
        selectedSize: selectedSize,
      );
      // Add the product to the front of the list
      final updatedList = [newItem, ...cartItems];
      emit(CartLoadSuccess(items: updatedList));
    } catch (e) {
      emit(CartLoadFailure(message: e.toString()));
    }
  }

  Future<void> removeProduct({
    required ProductModel product,
    String selectedSize = '',
  }) async {
    try {
      // check
      if (product.sizes.isNotEmpty && !product.sizes.contains(selectedSize)) {
        throw Exception('Selected product size is not available.');
      }
      final currentState = state as CartLoadSuccess;
      final cartItems = currentState.items;
      emit(CartLoadInProgress(items: cartItems));
      await Future.delayed(const Duration(seconds: 1)); // mock api delay
      final currentList = List<CartItem>.from(currentState.items);
      // Remove the product from the list
      currentList.removeWhere(
        (p) => p.product.id == product.id && p.selectedSize == selectedSize,
      );
      emit(CartLoadSuccess(items: currentList));
    } catch (e) {
      emit(CartLoadFailure(message: e.toString()));
    }
  }

  Future<void> decreaseQuantity({
    required ProductModel product,
    String selectedSize = '',
  }) async {
    try {
      // check
      if (product.sizes.isNotEmpty && !product.sizes.contains(selectedSize)) {
        throw Exception('Selected product size is not available.');
      }
      final currentState = state as CartLoadSuccess;
      final cartItems = currentState.items;
      emit(CartLoadInProgress(items: cartItems));
      await Future.delayed(const Duration(seconds: 1)); // mock api delay
      final currentItem = currentState.items.firstWhere(
        (p) => p.product.id == product.id && p.selectedSize == selectedSize,
      );
      if (currentItem.quantity > 1) {
        final updatedList = currentState.items.map((item) {
          if (item.product.id == product.id &&
              item.selectedSize == selectedSize) {
            return CartItem(
              product: item.product,
              quantity: item.quantity - 1,
              selectedSize: item.selectedSize,
            );
          }
          return item;
        }).toList();
        emit(CartLoadSuccess(items: updatedList));
      }
    } catch (e) {
      emit(CartLoadFailure(message: e.toString()));
    }
  }
}
