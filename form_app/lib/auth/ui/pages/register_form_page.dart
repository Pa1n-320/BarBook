import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_app/auth/ui/pages/user_info.dart';
import 'package:form_app/model/user.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:form_app/translations/locale_keys.g.dart';



class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({super.key});

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePass = true;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _idController = TextEditingController();
  final _genderController = TextEditingController();

  final List<String> _countries = [LocaleKeys.russia.tr(), LocaleKeys.ukraine.tr(), LocaleKeys.germany.tr(), LocaleKeys.france.tr(), LocaleKeys.kazakhstan.tr()];
  String _selectedCountry = LocaleKeys.russia.tr();
  final List<String> _genders = [LocaleKeys.male.tr(),LocaleKeys.female.tr()];
  String _selectedGender = LocaleKeys.male.tr();

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();
  final _idFocus = FocusNode();
  final _genderFocus = FocusNode();

  User newUser = User();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passController.dispose();
    _idController.dispose();
    _genderController.dispose();
    _confirmPassController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    _idFocus.dispose();
    _genderFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(LocaleKeys.registration.tr()),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            TextFormField(
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _nameFocus, _phoneFocus);
              },
              controller: _nameController,
              decoration: InputDecoration(
                hintText: LocaleKeys.name.tr(),
                prefixIcon: const Icon(Icons.messenger),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _nameController.clear();
                  },
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              validator: validateName,
              onSaved: (value) => newUser.name = value!,
            ),
            const SizedBox(height: 10),
            TextFormField(
              focusNode: _phoneFocus,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _phoneFocus, _passFocus);
              },
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: LocaleKeys.phone_number.tr(),
                hintText: 'Where can we reach you?',
                helperText: LocaleKeys.phone_format.tr(),
                prefixIcon: const Icon(Icons.call),
                suffixIcon: GestureDetector(
                  onLongPress: () {
                    _phoneController.clear();
                  },
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                // FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'),
                    allow: true),
              ],
              validator: (value) => validatePhoneNumber(value!)
                  ? null
                  : LocaleKeys.phone_format.tr(),

              onSaved: (value) => newUser.phone = value!,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: LocaleKeys.email_address.tr(),
                hintText: LocaleKeys.enter_email.tr(),
                icon: Icon(Icons.mail),
              ),
              keyboardType: TextInputType.emailAddress,
              // validator: _validateEmail,
              onSaved: (value) => newUser.email = value!,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.map),
                  labelText: LocaleKeys.country.tr()),
              items: _countries.map((country) {
                return DropdownMenuItem(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (country) {
                setState(() {
                  _selectedCountry = country as String;
                  newUser.country = country;
                });
              },
              value: _selectedCountry,
              // validator: (val) {
              //   return val == null ? 'Please select a country' : null;
              // },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _storyController,
              decoration: InputDecoration(
                labelText: LocaleKeys.life_story.tr(),
                hintText: LocaleKeys.tell_about.tr(),
                helperText: LocaleKeys.keep_it_short.tr(),
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              inputFormatters: [
                LengthLimitingTextInputFormatter(100),
              ],
              onSaved: (value) => newUser.story = value!,
            ),
            const SizedBox(height: 10),
            TextFormField(
              focusNode: _passFocus,
              controller: _passController,
              obscureText: _hidePass,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: LocaleKeys.password.tr(),
                hintText: LocaleKeys.enter_password.tr(),
                suffixIcon: IconButton(
                  icon:
                  Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                ),
                icon: const Icon(Icons.security),
              ),
              validator: _validatePassword,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _confirmPassController,
              obscureText: _hidePass,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: LocaleKeys.confirm.tr(),
                hintText: LocaleKeys.confirm_password.tr(),
                icon: Icon(Icons.border_color),
              ),
              validator: _validatePassword,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _idController,
              decoration: InputDecoration(
                labelText: LocaleKeys.barcode.tr(),
                hintText: LocaleKeys.your_barcode.tr(),
                border: OutlineInputBorder(),
              ),
              maxLength: 7,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                // FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'),
                    allow: true),
              ],
              onSaved: (value) => newUser.id = value!,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.map),
                  labelText: LocaleKeys.gender.tr()),
              items: _genders.map((gender) {
                return DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (gender) {
                setState(() {
                  _selectedGender = gender as String;
                  newUser.Gender = gender;
                });
              },
              value: _selectedGender,
              // validator: (val) {
              //   return val == null ? 'Please select a country' : null;
              // },
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                textStyle: const TextStyle(color: Colors.white),
              ),
              child: Text(LocaleKeys.submit.tr()),
              //color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      const url = 'https://flutterprojectsergei-default-rtdb.firebaseio.com/user.json';
      http.post(Uri.parse(url), body: jsonEncode({
        'Name': _nameController.text,
        'Phone': _phoneController.text,
        'Email': _emailController.text,
        'Story': _storyController.text,
      }
      ),
      ).then((response){
        print(json.decode(response.body));
        String userName = json.decode(response.body)['name'];
        _showDialog(name: '$userName');
      });
      _showDialog(name: _nameController.text);
      log('Name: ${_nameController.text}');
      log('Phone: ${_phoneController.text}');
      log('Email: ${_emailController.text}');
      Navigator.pushNamed(context, 'Submit');
    } else {
      _showMessage(message: LocaleKeys.form_is_not_valid.tr());
    }
  }

  String? validateName(String? value) {
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value == null) {
      return LocaleKeys.name_is_required.tr();
    } else if (!nameExp.hasMatch(value)) {
      return LocaleKeys.please_enter.tr();
    } else {
      return null;
    }
  }
  bool validatePhoneNumber(String input) {
    final phoneExp = RegExp(r'^\d\d\d\-\d\d\d\-\d\d\d\d$');
    return phoneExp.hasMatch(input);
  }
  bool validateID(String input) {
    final idExp = RegExp(r'^\(\s\s\s\s\s\s\s$');
    return idExp.hasMatch(input);
  }

  String? validateEmail(String? value) {
    if (value == null) {
      return LocaleKeys.email_empty.tr();
    } else if (!_emailController.text.contains('@')) {
      return LocaleKeys.invalid_email.tr();
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (_passController.text.length != 8) {
      return LocaleKeys.password_required.tr();
    } else if (_confirmPassController.text != _passController.text) {
      return LocaleKeys.password_doesnt.tr();
    } else {
      return null;
    }
  }

    void _showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.red,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
        ),
      ),
    );
    // До Flutter 2.0
    // _scaffoldKey.currentState.showSnackBar(
    //   SnackBar(
    //     duration: Duration(seconds: 5),
    //     backgroundColor: Colors.red,
    //     content: Text(
    //       message,
    //       style: TextStyle(
    //         color: Colors.black,
    //         fontWeight: FontWeight.w600,
    //         fontSize: 18.0,
    //       ),
    //     ),
    //   ),
    // );
  }

  void _showDialog({required String name}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            LocaleKeys.registration_is_successful.tr(),
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          content: Text(
            '$name is now a verified register form',
              style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserInfoPage(
                      userInfo: newUser,
                    ),
                  ),
                );
              },
              child: Text(
                LocaleKeys.submit.tr(),
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}


