import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionShortcuts extends StatefulWidget {
  const ActionShortcuts({super.key});

  @override
  State<ActionShortcuts> createState() => _ActionShortcutsState();
}

class _ActionShortcutsState extends State<ActionShortcuts> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailInput = TextEditingController();
  final TextEditingController _nameInput = TextEditingController();
  // ignore: unused_field
  String _eventText = "";
  bool isFemale = false;
  bool isMale = false;
  bool isOther = false;

  void _updateText(String email, String name) {
    setState(() {
      _eventText = 'Name : $name and email: $email';
    });
  }

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
      body: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.enter): const ActivateIntent(),
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyS):
              const ActivateIntent(),
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyA):
              const SelectAllIntent(),
        },
        child: Actions(
          dispatcher: LoggingActionDispatcher(), // log of all called actions
          actions: <Type, Action<Intent>>{
            ActivateIntent: CallbackAction<ActivateIntent>(
              onInvoke: (Intent intent) {
                if (_formKey.currentState!.validate()) {
                _updateText(_emailInput.text, _nameInput.text);
                }
                return null;
              },
            ),
            SelectAllIntent: SelectAllAction(_emailInput)
          },
          child: Focus(
            autofocus: true,
            child: Builder(
              builder: (context) {
                return Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _emailInput,
                          decoration: InputDecoration(
                            hintText: 'Enter email',
                            border: OutlineInputBorder(),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: _nameInput,
                          decoration: InputDecoration(
                            hintText: 'Enter name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: isFemale,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isFemale = value!;
                                      });
                                    },
                                  ),
                                  Text('Female'),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: isMale,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isMale = value!;
                                      });
                                    },
                                  ),
                                  Text('Male'),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: isOther,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isOther = value!;
                                      });
                                    },
                                  ),
                                  Text('Other'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[500],
                            ),
                            onPressed: () {
                               Actions.invoke(context, const ActivateIntent());
                            },
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white, // Chữ trắng
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(_eventText),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class LoggingActionDispatcher extends ActionDispatcher {
  @override
  Object? invokeAction(
    covariant Action<Intent> action,
    covariant Intent intent, [
    BuildContext? context,
  ]) {
    print('Action invoked: $action($intent) from $context');
    super.invokeAction(action, intent, context);

    return null;
  }
}

// copy all 
class SelectAllIntent extends Intent {
  const SelectAllIntent();
}

class SelectAllAction extends Action<SelectAllIntent> {
  SelectAllAction(this.controller);

  final TextEditingController controller;

  @override
  Object? invoke(covariant SelectAllIntent intent) {
    controller.selection = controller.selection.copyWith(
      baseOffset: 0,
      extentOffset: controller.text.length,
      affinity: controller.selection.affinity,
    );

    return null;
  }
}

