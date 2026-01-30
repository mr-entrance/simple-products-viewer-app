import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_product_viewer_app/models/cart_item.dart';
import 'package:simple_product_viewer_app/models/product_model.dart';
import 'package:simple_product_viewer_app/screens/cart/cart_cubit.dart';
import 'package:simple_product_viewer_app/screens/product_list/product_list_cubit.dart';
import 'package:simple_product_viewer_app/screens/product_list/product_list_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:simple_product_viewer_app/widgets/recently_viewed_product_list.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

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
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<ProductListCubit>().fetchProducts();
                },
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      flexibleSpace: FlexibleSpaceBar(
                        titlePadding: EdgeInsets.all(12),
                        title: Text("Product List"),
                      ),
                      actions: [
                        IconButton(
                          icon: BlocBuilder<CartCubit, List<CartItem>>(
                            builder: (context, cartProducts) {
                              final icon = const Icon(Icons.shopping_cart);
                              if (cartProducts.isEmpty) {
                                return icon;
                              }
                              return Badge(
                                label: Text('${cartProducts.length}'),
                                child: icon,
                              );
                            },
                          ),
                          onPressed: () {
                            context.push('/cart');
                          },
                        ),
                      ],
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
                          onTap: () {
                            context.push('/products/${product.id}');
                          },
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
                                  padding: const EdgeInsets.all(6.0),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(product.brandName),
                                      const SizedBox(height: 4),
                                      Text(
                                        product.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        product.price.formattedAmount,
                                        style: const TextStyle(
                                          color: Colors.indigo,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SliverSafeArea(
                      top: false,
                      sliver: SliverPadding(
                        padding: const EdgeInsets.all(12.0),
                        sliver: SliverToBoxAdapter(
                          child: RecentlyViewedProductList(),
                        ),
                      ),
                    ),
                  ],
                ),
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
