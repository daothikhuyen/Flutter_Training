import 'package:flutter/material.dart';
import 'package:flutter_practice/flow/widget/chat_view/chat_item.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ChatItem)
Widget buildBookMarkItemUseCase(BuildContext context) {

  return Center(
    child: ChatItem(Colors.black12),
  );
}