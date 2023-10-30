import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TimeLineWidget extends StatelessWidget {
  const TimeLineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 55,
          height: 55,
          decoration:  ShapeDecoration(
            color: Colors.white.withOpacity(0.05),
            shape: const CircleBorder(),
          ),
          child: SvgPicture.asset(
            'assets/crossFit.svg',
            alignment: Alignment.center,
            width: 40,
            height: 40,
            fit: BoxFit.scaleDown, // Ensure the SVG scales to fit the container
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Opacity(
            opacity: 0.05,
            child: Container(
              width: 1,
              height: 70,
              decoration: const BoxDecoration(color: Colors.white),
            ),
          ),
        ),

      ],
    );
  }
}