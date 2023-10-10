/// packages
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// imports
import '../../data/models/login_model.dart';
import 'auth_widgets.dart';
import '../../../../core/core.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({
    super.key,
    required GlobalKey<FormState> fKey,
    required this.authProvider,
    required this.widget,
  }) : _fKey = fKey;

  final GlobalKey<FormState> _fKey;
  final AuthenticationProvider authProvider;
  final CustomForm widget;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  final ConnectivityHelper _connectivityHelper = ConnectivityHelper();
  bool isOnline = true;

  Future<bool> hasInternetConnection() async {
    isOnline = await _connectivityHelper.isConnected();
    print(isOnline);
    return isOnline;
  }


  /// handle login
  Future<void> handleLogin() async {
    if (!isOnline) return;

    if (widget._fKey.currentState!.validate()) {
      final result = await widget.authProvider.login(
        LoginCredentials(
          email: widget.widget.emailController.text,
          password: widget.widget.paawordController.text,
        ),
      );

      result.fold(
            (failure) {
              AwesomeSnackBar.showSnackBar(
                context,
                title: 'Login Failed',
                message: 'Authentication failed: ${failure.message}',
                contentType: ContentType.failure,
                backgroundColor: Colors.transparent, // Optional, provide a custom background color
              );
        },
            (user) {
          // Handle successful authentication if needed
        },
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    hasInternetConnection();
    // Subscribe to connectivity changes
    _connectivityHelper.onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        print("what");
        print(result);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: handleLogin,
            child: Container(
              width: 153,
              height: 40,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.00, 1.00),
                  end: const Alignment(0, -1),
                  colors: !isOnline
                      ? AppColors.disableGradientColor
                      : AppColors.primaryGradient,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                  child: Text(
                "login".tr(),
                style: const TextStyle(color: Colors.white),
              )),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "reset_password".tr(),
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
