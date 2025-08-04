import 'package:flutter/material.dart';
import 'package:flutter_practice/data/data.dart';
import 'package:flutter_practice/flow/fragments/bookmark_view.dart';
import 'package:flutter_practice/flow/fragments/chat_view.dart';
import 'package:flutter_practice/flow/widget/email/email_list_view.dart';
import 'package:flutter_practice/models/destination.dart';

class DestinationView extends StatelessWidget {
  final Destination destination;

  const DestinationView(this.destination, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: destination.id == 0
            ? BookmarkView()
            : destination.id == 1
            ? ChatView()
            : destination.id == 4
            ? EmailListView(currentUser: user_0,)
            : BookmarkView(),
      ),
    );
  }
}