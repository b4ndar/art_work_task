/// imports

import 'package:art_work/features/home/presentation/exercise.dart';

import '../../../../core/core.dart';
import '../widgets/auth_widgets.dart';
/// packages
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = "";
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveHelper(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CommonBackground(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: responsive.screenHeight,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  // const UserWelcomeWidget(),
                  SizedBox(
                    height: responsive.screenHeight / 10,
                  ),
                  const LogoWidget(),
                  SizedBox(
                    height: responsive.screenHeight / 17,
                  ),
                  SizedBox(
                    height: responsive.screenHeight/2,
                    child: CustomForm(
                      emailController: _controllerEmail,
                      paawordController: _controllerPassword,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
