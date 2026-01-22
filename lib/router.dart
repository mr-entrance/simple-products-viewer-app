import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_product_viewer_app/screens/product_detail_screen.dart';
import 'package:simple_product_viewer_app/screens/product_list_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/products',
  routes: <RouteBase>[
    GoRoute(
      path: '/products',
      builder: (BuildContext context, GoRouterState state) {
        return const ProductListScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return ProductDetailScreen();
          },
        ),
      ],
    ),
  ],
);
