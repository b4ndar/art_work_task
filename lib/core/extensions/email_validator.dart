import 'package:easy_localization/easy_localization.dart';

extension FormValidator on String {
  String? passwordValidator() {
    if (this.length < 5) {
      return 'password_is_short'.tr();
    } else {
      return 'True';
    }
  }

  String? emailValidator() {
    RegExp emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    final isEmailValid = emailRegExp.hasMatch(this ?? "");
    return isEmailValid ? null : 'Please enter a valid email';
  }
}

class Bla {}