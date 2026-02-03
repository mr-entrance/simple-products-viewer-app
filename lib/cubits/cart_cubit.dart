import 'package:simple_product_viewer_app/models/cart_item.dart';
import 'package:simple_product_viewer_app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_product_viewer_app/cubits/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartLoadSuccess(items: []));

  Future<void> addProduct({
    required ProductModel product,
    String selectedSize = '',
  }) async {
    final cartItems = _getCurrentCartItems();
    if (cartItems == null) return;
    try {
      _validateSize(product, selectedSize);
      emit(CartLoadInProgress(items: cartItems));
      await Future.delayed(const Duration(seconds: 1)); // mock api delay
      final existingItem = _findCartItem(cartItems, product.id, selectedSize);
      if (existingItem != null) {
        final updatedList = cartItems.map((item) {
          if (item.product.id == product.id &&
              item.selectedSize == selectedSize) {
            return CartItem(
              product: item.product,
              quantity: item.quantity + 1,
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
      emit(CartLoadFailure(items: cartItems, message: e.toString()));
    }
  }

  Future<void> removeProduct({
    required ProductModel product,
    String selectedSize = '',
  }) async {
    final cartItems = _getCurrentCartItems();
    if (cartItems == null) return;
    try {
      _validateSize(product, selectedSize);
      emit(CartLoadInProgress(items: cartItems));
      await Future.delayed(const Duration(seconds: 1)); // mock api delay
      final currentList = List<CartItem>.from(cartItems);
      // Remove the product from the list
      currentList.removeWhere(
        (p) => p.product.id == product.id && p.selectedSize == selectedSize,
      );
      emit(CartLoadSuccess(items: currentList));
    } catch (e) {
      emit(CartLoadFailure(items: cartItems, message: e.toString()));
    }
  }

  Future<void> decreaseQuantity({
    required ProductModel product,
    String selectedSize = '',
  }) async {
    final cartItems = _getCurrentCartItems();
    if (cartItems == null) return;
    try {
      _validateSize(product, selectedSize);
      emit(CartLoadInProgress(items: cartItems));
      await Future.delayed(const Duration(seconds: 1)); // mock api delay
      final currentItem = _findCartItem(cartItems, product.id, selectedSize);
      // call remove product if quantity is 1 so block is not duplicated
      if (currentItem != null && currentItem.quantity > 1) {
        final updatedList = cartItems.map((item) {
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
      emit(CartLoadFailure(items: cartItems, message: e.toString()));
    }
  }

  void _validateSize(ProductModel product, String selectedSize) {
    if (product.sizes.isNotEmpty && !product.sizes.contains(selectedSize)) {
      throw Exception('Selected product size is not available.');
    }
  }

  List<CartItem>? _getCurrentCartItems() {
    return switch (state) {
      CartLoadSuccess(:final items) => items,
      CartLoadFailure(:final items) => items,
      _ => null,
    };
  }

  CartItem? _findCartItem(List<CartItem> items, String productId, String size) {
    try {
      return items.firstWhere(
        (item) => item.product.id == productId && item.selectedSize == size,
      );
    } catch (_) {
      return null; // 見つからない場合
    }
  }
}
