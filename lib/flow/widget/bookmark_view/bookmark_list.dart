import 'package:flutter/material.dart';
import 'package:flutter_practice/flow/widget/bookmark_view/bookmark_item.dart';

class BookMarkList extends StatefulWidget {
  const BookMarkList({super.key});

  @override
  State<BookMarkList> createState() => _BookMarkListState();
}

class _BookMarkListState extends State<BookMarkList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: 10,
      itemBuilder: (context, index) => BookmarkItem());
  }
}
