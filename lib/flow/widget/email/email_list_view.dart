import 'package:flutter/material.dart';
import 'package:flutter_practice/data/data.dart' as data;
import 'package:flutter_practice/flow/widget/email/email_widget.dart';
import 'package:flutter_practice/models/user.dart';
import 'package:flutter_practice/widget/search_bar.dart' as search_bar;

class EmailListView extends StatelessWidget {
  const EmailListView({
    super.key,
    this.selectedIndex,
    this.onSelected,
    required this.currentUser,
  });

  final int? selectedIndex;
  final ValueChanged<int>? onSelected;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email'),
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop(context);
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            const SizedBox(height: 8),
            search_bar.SearchBar(currentUser: currentUser),
            const SizedBox(height: 8),
            ...List.generate(data.emails.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: EmailWidget(
                  email: data.emails[index],
                  onSelected: onSelected != null
                      ? () {
                          onSelected!(index);
                        }
                      : null,
                  isSelected: selectedIndex == index,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}