import 'package:flutter/material.dart';
import 'package:flutter_practice/flow/fragments/home/home_view_large.dart';
import 'package:flutter_practice/flow/fragments/home/home_view_small.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
         if (constraints.maxWidth < 600) {
            return HomeViewSmall(currentIndex: _currentIndex , onTapped: (index){
              setState(() {
                _currentIndex = index;
              });
            });
          } else {
            return HomeViewLarge(currentIndex: _currentIndex, onTapped: (index){
              setState(() {
                _currentIndex = index;
              });
            });
          }
      },),
    );
  }
}