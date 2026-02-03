import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_product_viewer_app/injection_container.dart';
import 'package:simple_product_viewer_app/models/cart_item.dart';
import 'package:simple_product_viewer_app/screens/cart/cart_cubit.dart';
import 'package:simple_product_viewer_app/models/product_model.dart';
import 'package:simple_product_viewer_app/widgets/recently_viewed_product_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartCubit, List<CartItem>>(
        builder: (context, cartProducts) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(title: Text('Cart')),
              if (cartProducts.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: Text('Your cart is empty')),
                )
              else
                SliverList.builder(
                  itemCount: cartProducts.length,
                  itemBuilder: (context, index) {
                    final product = cartProducts[index].product;
                    final selectedSize = cartProducts[index].selectedSize;
                    return Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: product.mainImage,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                  if (selectedSize.isNotEmpty)
                                    Text(
                                      'Size: $selectedSize',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                  Text(
                                    product.price.formattedAmount,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _showRemoveConfirmDialog(
                                context: context,
                                product: product,
                              );
                            },
                            icon: Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              RecentlyViewedProductList(useSliver: true),
            ],
          );
        },
      ),
    );
  }

  void _showRemoveConfirmDialog({
    required BuildContext context,
    required ProductModel product,
  }) {
    showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Text('Remove Item'),
          content: Text(
            'Are you sure you want to remove this item from the cart?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            if (Platform.isAndroid)
              TextButton(
                onPressed: () async {
                  _onRemovePressed(context, product);
                },
                child: Text('Remove'),
              )
            else
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  _onRemovePressed(context, product);
                },
                child: Text('Remove'),
              ),
          ],
        );
      },
    );
  }

  void _onRemovePressed(BuildContext context, ProductModel product) {
    sl<CartCubit>().removeProduct(product);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Removing item from cart')));
    Navigator.of(context).pop();
  }
}
