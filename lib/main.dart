import 'package:flutter/material.dart';
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
      home: DraggableCard(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 5, color: Colors.black12),
            borderRadius: const BorderRadius.all(Radius.circular(8)),

          ),
          child: Image(
            image: AssetImage('assets/images/cat_one.jpg'),
            width: 128,
            height: 128,
          ),
        ),
      ),
    );
  }
}
