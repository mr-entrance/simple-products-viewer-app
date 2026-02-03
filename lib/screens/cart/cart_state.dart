import 'package:simple_product_viewer_app/models/cart_item.dart';

sealed class CartState {
  const CartState();
}

final class CartLoadInProgress extends CartState {
  const CartLoadInProgress({required this.items});
  final List<CartItem> items;
}

final class CartLoadSuccess extends CartState {
  const CartLoadSuccess({required this.items});
  final List<CartItem> items;
}

final class CartLoadFailure extends CartState {
  const CartLoadFailure({required this.message});
  final String message;
}

extension CartStateX on CartState {
  int totalQuantity() {
    if (this is CartLoadSuccess) {
      final successState = this as CartLoadSuccess;
      return successState.items.fold<int>(
        0,
        (previousValue, element) => previousValue + element.quantity,
      );
    }
    return 0;
  }
}
