import 'package:flutter/material.dart';
import 'package:simple_product_viewer_app/injection_container.dart' as di;
import 'package:simple_product_viewer_app/router.dart';

void main() async {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}
