import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:flutter_practice/pages/detail_page.dart';

@widgetbook.UseCase(name: 'Default', type: DetailPage, path: 'pages/detailpage/default')
Widget buildCoolButtonUseCase(BuildContext context) {
  return Center(
      child: DetailPage(
        title: context.knobs.string(
          label: 'title',
          initialValue: 'Picture three_03',
        ),
        image: context.knobs.stringOrNull(
          label: 'image',
          initialValue: 'assets/images/cat_three.jpg',
        ),
      ),
    );
}
