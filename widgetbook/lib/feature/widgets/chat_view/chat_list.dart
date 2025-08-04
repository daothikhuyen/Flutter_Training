import 'package:flutter/material.dart';
import 'package:flutter_practice/flow/widget/chat_view/chat_list.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ChatList)
Widget buildChatListUseCase(BuildContext context) {

  return Center(
    child: ChatList(),
  );
}