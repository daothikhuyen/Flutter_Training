import 'package:flutter/material.dart';
import 'package:flutter_practice/models/destination.dart';
import 'package:flutter_practice/flow/fragments/destination_view.dart';
import 'package:flutter_practice/flow/res/custom_color.dart';
import 'package:flutter_practice/flow/widget/menu_widget.dart';

class HomeViewSmall extends StatefulWidget {
  const HomeViewSmall({super.key, required this.currentIndex, required this.onTapped});

  final int currentIndex;
  final Function(int selectedIndex) onTapped;
  @override
  State<HomeViewSmall> createState() => _HomeViewSmallState();
}

class _HomeViewSmallState extends State<HomeViewSmall> {

    int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1a3045),
        title: Text(
          'Flow',
          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                setState(() {
                  Scaffold.of(context).openDrawer();
                });
              },
              icon: Icon(Icons.menu, color: Colors.white),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircleAvatar(backgroundColor: Colors.greenAccent),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: MenuWidget(
          selectedIndex: _selectedIndex,
          onTapped: (int selectedIndex) {
            setState(() {
              _selectedIndex = selectedIndex;
            });
          },
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(color: Colors.white),
          ),
        ),
        child: NavigationBar(
          elevation: 0,
          selectedIndex: _selectedIndex,
          backgroundColor: CustomColors.blue_gray,
          indicatorColor: CustomColors.neon_green,
          onDestinationSelected: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          destinations:
              destinations.map<NavigationDestination>((d) {
                return NavigationDestination(
                  icon: Icon(d.icon, color: Colors.white),
                  label: d.label,
                );
              }).toList(),
        ),
      ),
      body: IndexedStack(
        index : _selectedIndex,
        children: destinations.map<Widget>((Destination destination) {
            return DestinationView(destination);
          }).toList(),
      ),
    );
  }
}
