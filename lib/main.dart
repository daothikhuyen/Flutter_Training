import 'package:flutter/material.dart';
import 'package:flutter_practice/screem/form_data.dart';
import 'package:flutter_practice/screem/navigation_routing.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}
/// This handles '/' and '/details'.
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => FormData(),
      routes: [
        GoRoute(
          path: 'ShopMeo',
          builder: (_, __) => Navigation_Routing()
        ),
      ],
    ),
  ],
);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router,);
  }
}
