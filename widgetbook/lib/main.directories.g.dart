// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/feature/pages/feed.dart' as _i2;
import 'package:widgetbook_workspace/feature/pages/responsive_layout_page.dart'
    as _i3;
import 'package:widgetbook_workspace/feature/widgets/email/email_content.dart'
    as _i5;
import 'package:widgetbook_workspace/feature/widgets/start_button.dart' as _i4;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'pages',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'Feed',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i2.buildFeedUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ResponsiveLayoutPage',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i3.buildListPageUseCase,
        ),
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'widget',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'StarButton',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i4.buildStartButtonUseCase,
        ),
      ),
      _i1.WidgetbookFolder(
        name: 'email',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'EmailContent',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i5.buildEmailContentUseCase,
            ),
          ),
        ],
      ),
    ],
  ),
];
