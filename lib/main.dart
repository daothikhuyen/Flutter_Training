import 'package:flutter/material.dart';
import 'package:flutter_practice/screem/action_shortcuts.dart';
import 'package:flutter_practice/screem/draggable_card.dart';
import 'package:flutter_practice/screem/gestures.dart';
import 'package:flutter_practice/screem/interactivity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // textTheme: GoogleFonts.grandHotelTextTheme(),
      ),
      home: ActionShortcuts()
    );
  }
}
