import 'package:flutter/material.dart';
import 'package:flutter_practice/flow/widget/bookmark_view/bookmark_list.dart';

class BookmarkView extends StatelessWidget {
  const BookmarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BookMarkList(),
    );
  }
}
