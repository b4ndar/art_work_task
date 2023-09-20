import 'package:flutter/material.dart';

import '../helpers/helpers.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveHelper(context);
    return Container(
      width: double.infinity,
      height: 120,
      color: Color(0xFF212338),
      // Color(0xFF212338), Color(0xFF363667)
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// container
            Positioned(
              bottom: 0,
              child: Container(
                width: responsive.screenWidth,
                height: 100,
                decoration: const ShapeDecoration(
                  color: Color(0xFF373856),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: 70,
                height: 70,
                decoration: const ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.54, 0.84),
                    end: Alignment(-0.54, -0.84),
                    colors: [Color(0xFFFF34C6), Color(0xFFFFC6AA)],
                  ),
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 10,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFF24263D),
                    ),
                  ),
                ),
                child: const Icon(Icons.home,color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}