import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook/widgetbook.dart';
import 'package:flutter_practice/widget/cool_button.dart';

@widgetbook.UseCase(name: 'Default', type: CoolButton)
Widget buildCoolButtonUseCase(BuildContext context) {
  return Center(child: CoolButton(nameButton: context.knobs.string(label: 'nameButton', initialValue: 'Sign In')));
}
