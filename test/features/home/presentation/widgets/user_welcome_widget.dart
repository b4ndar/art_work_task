import 'package:art_work/core/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserWelcomeWidget extends StatefulWidget {
  const UserWelcomeWidget({
    super.key,
    this.user,
  });

  final User? user;

  @override
  State<UserWelcomeWidget> createState() => _UserWelcomeWidgetState();
}

class _UserWelcomeWidgetState extends State<UserWelcomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.80,
          child: Text(
            '${'hello'.tr()},${widget.user?.email ?? ""}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
        Text(
          'lets_get_exercise'.tr(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ],
    );
  }
}


class MenuButtonWelcome extends StatelessWidget {
  const MenuButtonWelcome({super.key, this.userName});
  final String? userName;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text:  TextSpan(
        children: [
          const TextSpan(
            text: "Welcome back ",
            style: TextStyle(
              color: Colors.black, // Color for "Welcome back"
              fontSize: 18, // Adjust the font size as needed
            ),
          ),
          TextSpan(
            text: "$userName",
            style: const TextStyle(
              color: AppColors.primaryColor, // Color for "Ahmed"
              fontSize: 18, // Adjust the font size as needed
            ),
          ),
        ],
      ),
    );
  }
}
