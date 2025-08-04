import 'package:flutter/material.dart';
import 'package:flutter_practice/flow/widget/chat_view/chat_list.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ChatList(),
    );
  }
}