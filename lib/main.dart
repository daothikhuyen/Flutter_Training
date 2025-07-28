import 'package:flutter/material.dart';
import 'package:flutter_practice/material_widgaets.dart';
import 'package:google_fonts/google_fonts.dart';

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
        scaffoldBackgroundColor: Color(0xFFfffcf3),
        // textTheme: GoogleFonts.grandHotelTextTheme(),
      ),
      home: const MaterialWidgaets()
    );
  }
}
