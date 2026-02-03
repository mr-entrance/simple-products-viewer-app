import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_product_viewer_app/cubits/recently_viewed_product_list_cubit.dart';
import 'package:simple_product_viewer_app/models/product_model.dart';

class RecentlyViewedProductList extends StatelessWidget {
  final bool useSliver;
  const RecentlyViewedProductList({super.key, this.useSliver = false});

  @override
  Widget build(BuildContext context) {
    if (useSliver) {
      return SliverSafeArea(
        top: false,
        sliver: SliverPadding(
          padding: const EdgeInsets.all(12.0),
          sliver: SliverToBoxAdapter(
            child: _RecentlyViewedProductListContent(),
          ),
        ),
      );
    }
    return _RecentlyViewedProductListContent();
  }
}

class _RecentlyViewedProductListContent extends StatelessWidget {
  const _RecentlyViewedProductListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentlyViewedProductListCubit, List<ProductModel>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return const SizedBox.shrink();
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recently Viewed',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 150,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => {context.push('/products/${state[index].id}')},
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: CachedNetworkImage(
                        imageUrl: state[index].mainImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
