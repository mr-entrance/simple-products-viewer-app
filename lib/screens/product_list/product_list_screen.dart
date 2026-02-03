import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_product_viewer_app/models/cart_item.dart';
import 'package:simple_product_viewer_app/models/product_model.dart';
import 'package:simple_product_viewer_app/cubits/cart_cubit.dart';
import 'package:simple_product_viewer_app/cubits/product_list_cubit.dart';
import 'package:simple_product_viewer_app/cubits/cart_state.dart';
import 'package:simple_product_viewer_app/cubits/product_list_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:simple_product_viewer_app/widgets/recently_viewed_product_list.dart';

class ProductListScreen extends HookWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<ProductListCubit>().fetchProducts();
      return null;
    }, []);
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
                          icon: BlocBuilder<CartCubit, CartState>(
                            builder: (context, state) {
                              final icon = const Icon(Icons.shopping_cart);
                              switch (state) {
                                case CartLoadSuccess():
                                  if (state.items.isEmpty) {
                                    return icon;
                                  }
                                  return Badge(
                                    label: Text('${state.totalQuantity()}'),
                                    child: icon,
                                  );
                                default:
                                  return icon;
                              }
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
                    RecentlyViewedProductList(useSliver: true),
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
