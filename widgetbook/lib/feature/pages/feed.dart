import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/feed.dart';
import 'package:flutter_practice/data/data.dart' as data;
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: Feed)
Widget buildFeedUseCase(BuildContext context) {

  return Center(
    child: Feed(currentUser:  data.user_0),
  );
}