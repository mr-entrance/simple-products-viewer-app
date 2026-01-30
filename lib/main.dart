import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_product_viewer_app/cubits/recently_viewed_product_list_cubit.dart';
import 'package:simple_product_viewer_app/injection_container.dart' as di;
import 'package:simple_product_viewer_app/router.dart';
import 'package:simple_product_viewer_app/screens/cart/cart_cubit.dart';

void main() async {
  di.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<RecentlyViewedProductListCubit>()),
        BlocProvider(create: (_) => di.sl<CartCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.indigo,
          seedColor: Colors.black,
          secondary: Colors.green,
          surface: Colors.grey[100]!,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          surfaceTintColor: Colors.indigo,
        ),
        textTheme: const TextTheme(
          labelLarge: TextStyle(color: Colors.black),
          titleLarge: TextStyle(color: Colors.black),
          displayLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          bodyLarge: TextStyle(color: Colors.black),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(foregroundColor: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            disabledBackgroundColor: Colors.grey,
            disabledForegroundColor: Colors.white70,
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}
