import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormData extends StatefulWidget {
  final void Function(Locale) onChangeLanguage;
  final Locale currentLocale;

  const FormData({
    super.key,
    required this.onChangeLanguage,
    required this.currentLocale,
  });

  @override
  State<FormData> createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _emailInput = TextEditingController();
  final TextEditingController _nameInput = TextEditingController();
  String? selectedLanguage;
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

  void _handleLanguageChange(bool? value) {
    setState(() {
      if (selectedLanguage == 'vi') {
        widget.onChangeLanguage(const Locale('en'));
        selectedLanguage = 'en';
      } else {
        widget.onChangeLanguage(const Locale('vi'));
        selectedLanguage = 'vi';
      }
      
    });
  }

  @override
  void initState() {
    super.initState();
    selectedLanguage = widget.currentLocale.languageCode;
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
              AppLocalizations.of(context).title,
              style: GoogleFonts.grandHotel().copyWith(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Colors.redAccent,
              ),
            ),
          ),
        ),
      ),
      body: KeyboardListener(
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
                Row(
                  children: [
                    Checkbox(
                      value: selectedLanguage == 'vi' ? true : false,
                      onChanged: (value) {
                        _handleLanguageChange(value);
                      },
                    ),
                    Text(AppLocalizations.of(context).vietnam),
                    SizedBox(width: 20),
                    Checkbox(
                      value: selectedLanguage == 'en' ? true : false,
                      onChanged: (value) {
                        _handleLanguageChange(value);
                      },
                    ),
                    Text(AppLocalizations.of(context).english),
                  ],
                ),
                TextFormField(
                  autofocus: true,
                  controller: _emailInput,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).enter_email,
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
                    hintText: AppLocalizations.of(context).enter_name,
                    border: OutlineInputBorder(),
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
                                AppLocalizations.of(context).gender + ": ",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  Radio<String>(
                                    value: AppLocalizations.of(context).male,
                                    groupValue: field.value,
                                    onChanged: (val) {
                                      field.didChange(val);
                                    },
                                  ),
                                  Text(AppLocalizations.of(context).male),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio<String>(
                                    value: AppLocalizations.of(context).female,
                                    groupValue: field.value,
                                    onChanged: (val) {
                                      field.didChange(val);
                                    },
                                  ),
                                  Text(AppLocalizations.of(context).female),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio<String>(
                                    value: AppLocalizations.of(context).other,
                                    groupValue: field.value,
                                    onChanged: (val) {
                                      field.didChange(val);
                                    },
                                  ),
                                  Text(AppLocalizations.of(context).other),
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
                            Text(AppLocalizations.of(context).checkbox_agree),
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
                          _updateText(_emailInput.text, _nameInput.text);
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
                          AppLocalizations.of(context)!.submit,
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
    );
  }
}
