import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class AwesomeSnackBar {
  static void showSnackBar(
      BuildContext context, {
        required String title,
        required String message,
        required ContentType contentType,
        Color? backgroundColor,
      }) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor ?? Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}