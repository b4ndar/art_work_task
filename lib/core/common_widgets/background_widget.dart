/// packages
import 'dart:ui';
import 'package:flutter/material.dart';
/// imports
import '../helpers/helpers.dart';

class CommonBackground extends StatelessWidget {
  const CommonBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveHelper(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.0, 1.00),
          end: Alignment(0, -1),
          colors: [Color(0xFF212338), Color(0xFF363667)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: responsive.screenWidth/2.5,
            top: -responsive.screenHeight *0.25,
            child: Opacity(
              opacity: 0.4,
              child: Transform(
                transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(0.75),
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 70, sigmaY: 30),
                  child: Container(
                    width: responsive.screenWidth,
                    height: responsive.screenHeight/2,
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(-0.54, -0.84),
                        end: Alignment(0.54, 0.84),
                        colors: [Color(0xFFFFC6AA),Color(0xFFFF34C6)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}