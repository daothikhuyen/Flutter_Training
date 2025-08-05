import 'package:flutter/material.dart';
import 'package:flutter_practice/state_management.dart';
import 'package:flutter_practice/switch_lifecycle.dart';
import 'package:provider/provider.dart';

/// This is a reimplementation of the default Flutter application using provider + [ChangeNotifier].

void main() {
  runApp(
    MultiProvider(
      providers: [
        // provider data for all app
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: const MyApp(),
    ),
  );
  // runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: StateManagement());
  }
}

