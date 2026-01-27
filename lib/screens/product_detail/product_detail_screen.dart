import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:simple_product_viewer_app/models/product_model.dart';
import 'package:simple_product_viewer_app/screens/product_detail/product_detail_cubit.dart';
import 'package:simple_product_viewer_app/screens/product_detail/product_detail_state.dart';

class ProductDetailScreen extends HookWidget {
  final String id;
  const ProductDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final selectedSize = useState('');
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      builder: (context, state) {
        switch (state) {
          case ProductDetailLoadInProgress():
            return const Center(child: CircularProgressIndicator());
          case ProductDetailLoadSuccess():
            final product = state.product;
            final buttonEnabled =
                product.sizes.isEmpty ||
                (product.sizes.isNotEmpty && selectedSize.value.isNotEmpty);
            return Scaffold(
              appBar: AppBar(title: Text('Product Detail')),
              body: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: product.mainImage,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Text(
                              product.brandName,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Spacer(),
                            Text(
                              product.price.formattedAmount,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        if (product.sizes.isNotEmpty) ...[
                          Text(
                            'Select Sizes',
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 12,
                            children: product.sizes
                                .map(
                                  (size) => RawMaterialButton(
                                    onPressed: () {
                                      selectedSize.value = size;
                                    },
                                    elevation: 2.0,
                                    fillColor: Colors.white,
                                    padding: EdgeInsets.all(15.0),
                                    shape: CircleBorder(
                                      side: BorderSide(
                                        width: size == selectedSize.value
                                            ? 3
                                            : 1,
                                        color: size == selectedSize.value
                                            ? Colors.indigo
                                            : Colors.grey,
                                      ),
                                    ),
                                    child: Text(
                                      size,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: size == selectedSize.value
                                            ? Colors.indigo
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          SizedBox(height: 12),
                        ],
                        Text(product.description),
                        SizedBox(height: 8),
                        _buildProductInfo(product),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: buttonEnabled
                        ? () {
                            // Add to cart action
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text('Add to Cart'),
                  ),
                ),
              ),
            );
          case ProductDetailLoadFailure():
            return Center(child: Text('Failed to load product details'));
          default:
            return Container();
        }
      },
    );
  }

  Widget _buildProductInfo(ProductModel product) {
    final titleStyle = TextStyle(color: Colors.grey[600]);
    final contentStyle = TextStyle(fontWeight: FontWeight.w600);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('colour:', style: titleStyle),
        SizedBox(width: 4),
        Text(product.colour, style: contentStyle),
        SizedBox(width: 8),
        Text('status:', style: titleStyle),
        SizedBox(width: 4),
        Text(
          product.stockStatus == StockStatus.inStock
              ? 'In Stock'
              : 'Out of Stock',
          style: contentStyle,
        ),
        SizedBox(width: 8),
        Text('SKU:', style: titleStyle),
        SizedBox(width: 4),
        Text(product.sku, style: contentStyle),
      ],
    );
  }
}
