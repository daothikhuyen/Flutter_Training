import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_practice/data/data.dart';
import 'package:flutter_practice/flow/widget/email/email_list_view.dart';

class BookmarkItem extends StatefulWidget {
  const BookmarkItem({super.key});

  @override
  State<BookmarkItem> createState() => _BookmarkItemState();
}

class _BookmarkItemState extends State<BookmarkItem> {
  // ignore: deprecated_member_use
  Color profileColor = Color(
    (math.Random().nextDouble() * 0xFFFFFF).toInt(),
  ).withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          bottom: 8.0,
          left: 16.0,
          right: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(radius: 30, backgroundColor: profileColor),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.bottomLeft,
                    widthFactor: 0.4,
                    child: Container(
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.8,
                    child: Container(
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EmailListView(currentUser: user_0),
                  ),
                );
              },
              child: Icon(Icons.bookmark, color: Colors.grey[400], size: 24),
            ),
          ],
        ),
      ),
    );
  }
}
