import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_product_viewer_app/screens/product_list/product_list_cubit.dart';
import 'package:simple_product_viewer_app/screens/product_list/product_list_state.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductListCubit, ProductListState>(
        builder: (context, state) {
          switch (state) {
            case ProductListLoadInProgress():
              return const Center(child: CircularProgressIndicator());
            case ProductListLoadSuccess():
              final products = state.products;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: EdgeInsets.all(12),
                      title: Text("Product List"),
                    ),
                  ),
                  SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // two items per row
                          childAspectRatio: 0.6,
                        ),
                    itemCount: products.length,
                    itemBuilder: (c, i) {
                      final product = products[i];
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Expanded(
                                child: CachedNetworkImage(
                                  imageUrl: product.mainImage,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Container(
                                color: Colors.grey[200],
                                padding: const EdgeInsets.all(6.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(product.brandName),
                                    const SizedBox(height: 4),
                                    Text(
                                      product.name +
                                          product.name +
                                          product.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text('\$${product.price.amount}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            case ProductListLoadFailure():
              return const Center(child: Text('Failed to load products'));
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
