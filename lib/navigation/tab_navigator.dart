import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/list_page.dart';
import 'package:flutter_practice/pages/root_page.dart';

class TabNavigator extends StatelessWidget {
  final int tabIndex;

  const TabNavigator({super.key, required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/':
            page = RootPage(tabIndex: tabIndex);
            break;
          case '/list':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ListPage()),
            );
            break;
          default:
            page = const Scaffold(body: Center(child: Text('Not founr')));
        }

        return MaterialPageRoute(builder: (_) => RootPage(tabIndex: tabIndex));
      },
    );
  }
}
