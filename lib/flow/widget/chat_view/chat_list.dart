import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_practice/flow/widget/chat_view/chat_item.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    final Color profileIconColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    return ListView.builder(
      shrinkWrap: true,
      reverse: true,
      physics: BouncingScrollPhysics(),
      itemCount: 30,
      itemBuilder: (context, index) {
        return ChatItem(profileIconColor);
      },
    );
  }
}