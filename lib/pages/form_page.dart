import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _emailInput = TextEditingController();
  final TextEditingController _nameInput = TextEditingController();
  // ignore: unused_field
  String _eventText = "";
  bool state = false;
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
      appBar: AppBar(
         backgroundColor: Color(0xFFf0eddc),
        // toolbarHeight: 76,
        title:Text(
              'Form Input',
            ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: Icon(Icons.arrow_back, ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: KeyboardListener(
          focusNode: _focusNode,
          onKeyEvent: (value) {
            // final key = value.logicalKey;
            if (value is KeyDownEvent) {
              if (_formKey.currentState!.validate()) {
                _updateText(_emailInput.text, _nameInput.text);
              }
            }
          },
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    obscureText: true,
                    autofocus: true,
                    controller: _emailInput,
                    decoration: InputDecoration(
                      labelText: 'Enter email',
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
                      border: OutlineInputBorder(),
                      labelText: 'Enter name'
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  // Pointer
                  FormField<String>(
                    validator:
                        (value) => value != null ? null : 'Please select gender',
                    builder: (FormFieldState<String> field) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Gender: ',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    Radio<String>(
                                      value: 'male',
                                      groupValue: field.value,
                                      onChanged: (val) {
                                        field.didChange(val);
                                      },
                                    ),
                                    Text('Male'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio<String>(
                                      value: 'female',
                                      groupValue: field.value,
                                      onChanged: (val) {
                                        field.didChange(val);
                                      },
                                    ),
                                    Text('female'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio<String>(
                                      value: 'other',
                                      groupValue: field.value,
                                      onChanged: (val) {
                                        field.didChange(val);
                                      },
                                    ),
                                    Text('Other'),
                                  ],
                                ),
                              ],
                            ),
                            if (field.hasError)
                              Text(
                                field.errorText!,
                                style: TextStyle(color: Colors.red),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                  FormField<bool>(
                    initialValue: false,
                    validator:
                        (value) => value == true ? null : 'Please select agree',
                    builder: (FormFieldState<bool> field) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: field.value,
                                onChanged: (val) {
                                  field.didChange(val); // cập nhật giá trị nội bộ
                                },
                              ),
                              Text('I agree to your privacy policy'),
                            ],
                          ),
                          if (field.hasError)
                            Text(
                              field.errorText!,
                              style: TextStyle(color: Colors.red),
                            ),
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SizedBox(
                      height: 40,
                      width: double.infinity,
                      // Gestures
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                           context.go('/ShopMeo');
                            
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.redAccent, // Màu nền nút
                            borderRadius: BorderRadius.circular(
                              12,
                            ), // Bo góc tròn
                            border: Border.all(
                              color: Colors.red,
                            ), // Viền xanh đậm
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(2, 2), // Đổ bóng
                              ),
                            ],
                          ),
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
          ),
        ),
      ),
    );
  }
}

