import 'package:flutter/material.dart';
import 'package:flutter_practice/flow/fragments/destination_view.dart';
import 'package:flutter_practice/flow/widget/menu_widget.dart';
import 'package:flutter_practice/models/destination.dart';

class HomeViewLarge extends StatefulWidget {
  const HomeViewLarge({super.key, required this.currentIndex, required this.onTapped});

   final int currentIndex;
  final Function(int selectedIndex) onTapped;

  @override
  State<HomeViewLarge> createState() => _HomeViewLargeState();
}

class _HomeViewLargeState extends State<HomeViewLarge> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: MenuWidget(
            selectedIndex: _selectedIndex,
            onTapped: (int selectedIndex) {
              setState(() {
                _selectedIndex = selectedIndex;
              });
            },
          ),
        ),
        Expanded(flex: 3, child: IndexedStack(
          index: _selectedIndex,
          children: destinations.map<Widget>((Destination destination) {
            return DestinationView(destination);
          }).toList(),
        )),
      ],
    );
  }
}
