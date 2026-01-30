import 'package:simple_product_viewer_app/models/product_model.dart';

class CartItem {
  final ProductModel product;
  final String selectedSize;
  CartItem({required this.product, this.selectedSize = ''});
}
