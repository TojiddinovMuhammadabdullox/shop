// main.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hometask/controllers/cart_controller.dart';
import 'package:hometask/controllers/product_controller.dart';
import 'package:hometask/views/screens/cart_page.dart';
import 'package:hometask/views/screens/home_page.dart';
import 'package:hometask/views/screens/product_detail_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartController()),
        ChangeNotifierProvider(create: (_) => ProductController()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartPage(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return ProductDetailPage(id: id);
      },
    ),
  ],
);
