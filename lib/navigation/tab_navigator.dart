// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_practice/data/data.dart';
import 'package:flutter_practice/flow/fragments/bookmark_view.dart';
import 'package:flutter_practice/flow/widget/chat_view/chat_list.dart';
import 'package:flutter_practice/flow/widget/email/email_list_view.dart';

class TabNavigator extends StatelessWidget {
  final int tabIndex;
  const TabNavigator({
    super.key,
    required this.tabIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            break;
          case '/chat':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ChatList()),
            );
          case '/email':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => EmailListView(currentUser: user_0)),
            );
            break;
          default:
            const Scaffold(body: Center(child: Text('Not found')));
        }

        return MaterialPageRoute(builder: (_) => BookmarkView());
      },
    );
  }
}
