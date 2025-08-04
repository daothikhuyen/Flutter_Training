import 'package:flutter/material.dart';
import 'package:flutter_practice/flow/widget/bookmark_view/bookmark_list.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: BookMarkList)
Widget buildBookMarkListUseCase(BuildContext context) {

  return SafeArea(
    child: BookMarkList(),
  );
}