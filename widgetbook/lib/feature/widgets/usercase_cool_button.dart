import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook/widgetbook.dart';
import 'package:flutter_practice/widget/cool_button.dart';
import 'package:widgetbook_workspace/l10n/app_localizations.dart';

@widgetbook.UseCase(name: 'Default', type: CoolButton)
Widget buildCoolButtonUseCase(BuildContext context) {
  final localizations = AppLocalizations.of(context)!;
  return Center(
    child: CoolButton(
      nameButton: context.knobs.string(
        label: 'nameButton',
        initialValue: localizations.submit,
      ),
    ),
  );
}
