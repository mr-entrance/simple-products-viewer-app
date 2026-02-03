import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_product_viewer_app/injection_container.dart';
import 'package:simple_product_viewer_app/models/cart_item.dart';
import 'package:simple_product_viewer_app/screens/cart/cart_cubit.dart';
import 'package:simple_product_viewer_app/models/product_model.dart';
import 'package:simple_product_viewer_app/screens/cart/cart_state.dart';
import 'package:simple_product_viewer_app/widgets/recently_viewed_product_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) => {
          if (state is CartLoadFailure)
            {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message))),
            },
        },
        builder: (context, cartProducts) {
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(title: Text('Cart')),
                  if (cartProducts is CartLoadSuccess &&
                      cartProducts.items.isEmpty)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(child: Text('Your cart is empty')),
                    )
                  else if (cartProducts is CartLoadSuccess)
                    _buildCartItemList(items: cartProducts.items)
                  else if (cartProducts is CartLoadInProgress)
                    _buildCartItemList(
                      items: cartProducts.items,
                      isLoading: true,
                    ),
                  RecentlyViewedProductList(useSliver: true),
                ],
              ),
              if (cartProducts is CartLoadInProgress)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCartItemList({
    required List<CartItem> items,
    bool isLoading = false,
  }) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final cartItem = items[index];
        final product = cartItem.product;
        final selectedSize = cartItem.selectedSize;
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
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      if (selectedSize.isNotEmpty)
                        Text(
                          'Size: $selectedSize',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      Text(
                        product.price.formattedAmount,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (cartItem.quantity <= 1) {
                            _showRemoveConfirmDialog(
                              context: context,
                              cartItem: cartItem,
                            );
                            return;
                          }
                          sl<CartCubit>().decreaseQuantity(
                            product: cartItem.product,
                            selectedSize: cartItem.selectedSize,
                          );
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text('${cartItem.quantity}'),
                      IconButton(
                        onPressed: () {
                          sl<CartCubit>().addProduct(
                            product: cartItem.product,
                            selectedSize: cartItem.selectedSize,
                          );
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      _showRemoveConfirmDialog(
                        context: context,
                        cartItem: cartItem,
                      );
                    },
                    icon: Icon(Icons.delete_outline),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showRemoveConfirmDialog({
    required BuildContext context,
    required CartItem cartItem,
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
                  _onRemovePressed(context, cartItem);
                },
                child: Text('Remove'),
              )
            else
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  _onRemovePressed(context, cartItem);
                },
                child: Text('Remove'),
              ),
          ],
        );
      },
    );
  }

  void _onRemovePressed(BuildContext context, CartItem cartItem) {
    sl<CartCubit>().removeProduct(
      product: cartItem.product,
      selectedSize: cartItem.selectedSize,
    );
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Removing item from cart')));
    Navigator.of(context).pop();
  }
}
