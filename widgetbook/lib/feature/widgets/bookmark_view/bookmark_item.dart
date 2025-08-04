import 'package:flutter/material.dart';
import 'package:flutter_practice/flow/widget/bookmark_view/bookmark_item.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: BookmarkItem)
Widget buildBookMarkItemUseCase(BuildContext context) {

  return SafeArea(
    child: BookmarkItem(),
  );
}