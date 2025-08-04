import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/home_page.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: HomePage)
Widget buildFeedUseCase(BuildContext context) {

  return HomePage();
}