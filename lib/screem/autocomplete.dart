import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AutoComplete extends StatefulWidget {
  const AutoComplete({super.key});

  @override
  State<AutoComplete> createState() => _AutoCompleteState();
}

const Duration fakeAPIDuration = Duration(seconds: 1);

class _AutoCompleteState extends State<AutoComplete> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const List<String> _KOption = [
    'Apple',
    'Banana',
    'Mango',
    'Melon',
    'Orange',
  ];

  late Iterable<String> _lastOption = <String>[];

  String? _searchWithQuery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF060606),
        toolbarHeight: 76,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Form Input',
              style: GoogleFonts.grandHotel().copyWith(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Colors.redAccent,
              ),
            ),
          ),
        ),
      ),
      body: Form(
         key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                'Enter below to autocomplete possible results in the phone list',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
              child: Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable.empty();
                  }
                  final result = _KOption.where(
                    (option) => option.toLowerCase().contains(
                      textEditingValue.text.toLowerCase(),
                    ),
                  );
                  return result.isNotEmpty ? result : ['Not found'];
                },
                fieldViewBuilder: (
                  context,
                  textEditingController,
                  focusNode,
                  onFieldSubmitted,
                ) {
                  return TextField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                      hintText: 'Enter a search name',
                      border: OutlineInputBorder(),
                    ),
                  );
                },
                onSelected: (String selection) {
                  debugPrint(
                    'You just selected ( autocomplete - basic) ${selection}',
                  );
                },
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}

class _FakeAPI {
  static const List<String> _option = [
    'Apple',
    'Banana',
    'Mango',
    'Melon',
    'Orange',
  ];

  static Future<Iterable<String>> search(String query) async {
    await Future<void>.delayed(fakeAPIDuration);

    if (query == '') {
      return const Iterable.empty();
    }

    return _option.where((String option) {
      return option.contains(query.toLowerCase());
    });
  }
}

