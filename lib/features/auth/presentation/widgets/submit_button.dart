/// packages
import 'package:art_work/core/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/network.dart';
/// imports
import '../../data/models/login_model.dart';
import 'auth_widgets.dart';

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
    isOnline =  await _connectivityHelper.isConnected();
    print(isOnline);
    return isOnline;
  }
  @override
  void initState() {
    // TODO: implement initState
    hasInternetConnection();
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
            onTap: !isOnline ? null: () async{
              /// check form validators
              if (widget._fKey.currentState!.validate()) {
                widget.authProvider.login(LoginCredentials(email: widget.widget.emailController.text, password: widget.widget.paawordController.text));
              }
            },
            child: Container(
              width: 153,
              height: 40,
              decoration: ShapeDecoration(
                gradient:  LinearGradient(
                  begin: const Alignment(0.00, 1.00),
                  end: const Alignment(0, -1),
                  colors: !isOnline ? disableGradientColor : gradientColors,
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