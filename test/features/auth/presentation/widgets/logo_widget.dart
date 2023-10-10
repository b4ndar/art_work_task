import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 120.51,
        height: 98.49,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Shape.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}