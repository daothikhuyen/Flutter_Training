import 'package:flutter/material.dart';
import 'package:flutter_practice/models/example_destination.dart';
import 'package:flutter_practice/pages/form_page.dart';
import 'package:flutter_practice/pages/list_page.dart';
import 'package:flutter_practice/navigation/tab_navigator.dart';

class MaterialWidgaets extends StatefulWidget {
  const MaterialWidgaets({super.key});

  @override
  State<MaterialWidgaets> createState() => _MaterialWidgaetsState();
}

const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination('Home', Icon(Icons.home_outlined), Icon(Icons.home)),
  ExampleDestination(
    'Notifications',
    Icon(Icons.notifications_outlined),
    Icon(Icons.notifications),
  ),
  ExampleDestination('Edit', Icon(Icons.edit_outlined), Icon(Icons.edit)),
];

class _MaterialWidgaetsState extends State<MaterialWidgaets> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late bool showNavigationDrawer;
  int selectedIndex = 0;

  final List<Widget> _screens = [
    const TabNavigator(tabIndex: 0), // Home
    const ListPage(), // Search tab chuyển qua ListPage
    const FormPage(), // Profile tab chuyển qua FormPage
  ];

  Widget buildBottomBarScaffold() {
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        destinations:
            destinations.map((ExampleDestination destination) {
              return NavigationDestination(
                label: destination.label,
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
                tooltip: destination.label,
              );
            }).toList(),
      ),
    );
  }

  Widget buildDrawerScaffold(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        bottom: false,
        top: false,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: NavigationRail(
                minWidth: 50,
                destinations:
                    destinations.map((ExampleDestination destination) {
                      return NavigationRailDestination(
                        label: Text(destination.label),
                        icon: destination.icon,
                        selectedIcon: destination.selectedIcon,
                      );
                    }).toList(),
                selectedIndex: selectedIndex,
                useIndicator: true,
                onDestinationSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: _screens[selectedIndex]),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showNavigationDrawer = MediaQuery.of(context).size.width >= 450;
  }

  @override
  Widget build(BuildContext context) {
    return showNavigationDrawer
        ? buildDrawerScaffold(context)
        : buildBottomBarScaffold();
  }
}
