/// imports
import 'auth_widgets.dart';
/// packages
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CustomForm extends StatefulWidget {
  const CustomForm(
      {super.key,
        this.isPassword = true,
        required this.emailController,
        required this.paawordController, this.authenticationProvider});

  final TextEditingController emailController;
  final TextEditingController paawordController;
  final bool? isPassword;
  final AuthenticationProvider? authenticationProvider;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {

  final _fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);
    /// login form
    return Form(
      key: _fKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            /// Email field
            LoginTextField(
              label: 'email'.tr(),
              controller: widget.emailController,
              isPassword: false,
            ),
            /// Password Field
            LoginTextField(
              label: 'password'.tr(),
              controller: widget.paawordController,
              isPassword: true,
            ),
            /// Submit Button
            SubmitButton(fKey: _fKey, authProvider: authProvider, widget: widget,),
          ],
        ),
      ),
    );
  }
}