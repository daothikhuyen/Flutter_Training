import 'package:flutter/material.dart';
import 'package:flutter_practice/data/data.dart';
import 'package:flutter_practice/flow/widget/email/email_list_view.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: EmailListView)
Widget buildChatListUseCase(BuildContext context) {

  return Center(
    child: EmailListView(currentUser: user_0),
  );
}