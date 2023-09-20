/// packages
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField(
      {super.key,
      required this.label,
      required this.controller,
      required this.isPassword});

  final String? label;
  final TextEditingController controller;
  final bool? isPassword;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {

  /// validator for password length
  String? passwordValidator(String? password) {
    if (password!.length <= 5) {
      return 'password_is_short'.tr();
    } else {
      return null;
    }
  }

  /// validator to check the email format
  String? emailValidator(String? email) {
    RegExp emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    final isEmailValid = emailRegExp.hasMatch(email ?? "");
    return isEmailValid ? null : 'Please enter a valid email ';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TextField Label
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              widget.label!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
          TextFormField(
            obscureText: widget.isPassword!,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator:
                widget.isPassword! ? passwordValidator : emailValidator,
            controller: widget.controller,
            decoration: buildInputDecoration(),
          ),
        ],
      ),
    );
  }

  /// textField decoration
  InputDecoration buildInputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.all(20.0),
      fillColor: const Color(0xFF363758),
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.green),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
      hintText: '',
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
