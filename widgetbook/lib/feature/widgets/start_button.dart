import 'package:flutter/material.dart';
import 'package:flutter_practice/widget/start_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: StarButton)
Widget buildStartButtonUseCase(BuildContext context) {

  return Center(
    child: StarButton(),
  );
}