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
import 'package:widgetbook_workspace/feature/pages/home_page.dart' as _i6;
import 'package:widgetbook_workspace/feature/pages/responsive_layout_page.dart'
    as _i7;
import 'package:widgetbook_workspace/feature/widgets/bookmark_view/bookmark_item.dart'
    as _i3;
import 'package:widgetbook_workspace/feature/widgets/bookmark_view/bookmark_list.dart'
    as _i2;
import 'package:widgetbook_workspace/feature/widgets/chat_view/chat_item.dart'
    as _i4;
import 'package:widgetbook_workspace/feature/widgets/chat_view/chat_list.dart'
    as _i5;
import 'package:widgetbook_workspace/feature/widgets/email/email_content.dart'
    as _i9;
import 'package:widgetbook_workspace/feature/widgets/email/email_list_view.dart'
    as _i10;
import 'package:widgetbook_workspace/feature/widgets/start_button.dart' as _i8;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'flow',
    children: [
      _i1.WidgetbookFolder(
        name: 'widget',
        children: [
          _i1.WidgetbookFolder(
            name: 'bookmark_view',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'BookMarkList',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i2.buildBookMarkListUseCase,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'BookmarkItem',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i3.buildBookMarkItemUseCase,
                ),
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'chat_view',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'ChatItem',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i4.buildBookMarkItemUseCase,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'ChatList',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Default',
                  builder: _i5.buildChatListUseCase,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'pages',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'HomePage',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i6.buildFeedUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ResponsiveLayoutPage',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i7.buildListPageUseCase,
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
          builder: _i8.buildStartButtonUseCase,
        ),
      ),
      _i1.WidgetbookFolder(
        name: 'email',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'EmailContent',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i9.buildEmailContentUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'EmailListView',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i10.buildChatListUseCase,
            ),
          ),
        ],
      ),
    ],
  ),
];
