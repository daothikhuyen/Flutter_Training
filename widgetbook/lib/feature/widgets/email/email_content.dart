import 'package:flutter/material.dart';
import 'package:flutter_practice/data/data.dart' as data;
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:flutter_practice/widget/email/email_content.dart';

@widgetbook.UseCase(name: 'Default', type: EmailContent)
Widget buildEmailContentUseCase(BuildContext context) {
  late final colorScheme = Theme.of(context).colorScheme;
  late final backgroundColor = Color.alphaBlend(
    colorScheme.primary.withAlpha(36),
    colorScheme.surface,
  );

  return Container(
    color: backgroundColor,
    child: Center(
      child: EmailContent(
        email: context.knobs.list(
          label: 'email',
          options: [data.emails[0], data.emails[1], data.emails[2]],
          labelBuilder: (value) => value.sender.name.fullName,
        ),
        isPreview: context.knobs.boolean(
          label: 'isPreview',
          initialValue: true,
        ),
        isThreaded: context.knobs.boolean(
          label: 'isThreaded',
          initialValue: true,
        ),
        isSelected: context.knobs.boolean(
          label: 'isSelected',
          initialValue: true,
        ),
      ),
    ),
  );
}
