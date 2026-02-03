import 'package:simple_product_viewer_app/models/product_model.dart';

class CartItem {
  final ProductModel product;
  final String selectedSize;
  final int quantity;
  CartItem({
    required this.product,
    required this.quantity,
    this.selectedSize = '',
  });
}
