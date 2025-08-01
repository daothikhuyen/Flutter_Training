import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/responsive_layout_page.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ResponsiveLayoutPage)
Widget buildListPageUseCase(BuildContext context) {

  return Center(
    child: ResponsiveLayoutPage(),
  );
}