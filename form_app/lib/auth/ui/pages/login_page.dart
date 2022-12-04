import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_app/model/user.dart';
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

import 'package:form_app/translations/locale_keys.g.dart';
class LoginFormPage extends StatefulWidget {
  const LoginFormPage({super.key});

  @override
  State<LoginFormPage> createState() => _LoginFormPage();
}

class _LoginFormPage extends State<LoginFormPage> {
  bool _hidePass = true;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _emailController = TextEditingController();

  final _passController = TextEditingController();


  final _nameFocus = FocusNode();

  final _passFocus = FocusNode();
  final _idFocus = FocusNode();
  final _genderFocus = FocusNode();

  User newUser = User();

  @override
  void dispose() {


    _emailController.dispose();

    _passController.dispose();



    _passFocus.dispose();


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
        title: Text(LocaleKeys.authorization.tr()),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
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
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: (){Navigator.pushNamed(context,'Enter'); },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                textStyle: const TextStyle(color: Colors.white),
              ),
              child: Text(LocaleKeys.enter.tr()),
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
      log('Email: ${_emailController.text}');
    } else {
      _showMessage(message: LocaleKeys.form_is_not_valid.tr());
    }
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
}
