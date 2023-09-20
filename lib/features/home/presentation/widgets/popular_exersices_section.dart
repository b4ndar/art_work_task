/// packages
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// imports
import '../../../../core/core.dart';
import '../../home.dart';

class PopularExercise extends StatefulWidget {
  const PopularExercise({super.key, required this.exercises});
  final List<ExerciseEntity> exercises;

  @override
  State<PopularExercise> createState() => _PopularExerciseState();
}

class _PopularExerciseState extends State<PopularExercise> {
  int selectedIndex = 0; // Initially, the first icon is selected


  final unSelectedBackground = [
    Colors.white.withOpacity(
      0.05,
    ),
    Colors.white.withOpacity(
      0.05,
    )
  ];
  final gradientWhite = [Colors.white, Colors.white];

  /// to change theme if the selected item
  BoxDecoration _buildIconDecoration(bool isSelected) {
    final gradient = LinearGradient(
      begin: const Alignment(0.0, 1.00),
      end: const Alignment(0, -1),
      colors: gradientColors,
    );

    final white = LinearGradient(
      begin: const Alignment(0.0, 1.00),
      end: const Alignment(0, -1),
      colors: unSelectedBackground,
    );

    return BoxDecoration(
      gradient: isSelected ? gradient : white,
      borderRadius: BorderRadius.circular(20),
    );
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveHelper(context);

    return Column(
      children: [
        SizedBox(
          height: responsive.screenHeight / 6, // Adjust the height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.exercises.length,
            itemBuilder: (BuildContext context, int index) {
              final exercise = widget.exercises[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    decoration: _buildIconDecoration(index == selectedIndex),
                    width: responsive.screenWidth / 4,
                    height: responsive.screenHeight / 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: index == selectedIndex
                                  ? gradientWhite
                                  : gradientColors,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ).createShader(bounds);
                          },
                          child: SvgPicture.asset(
                            /// get icon name and matched with the local assets ,
                            /// ps: i did that just to show case in this task .
                            "assets/${exercise.icon!}",
                            height: MediaQuery.of(context).size.height / 20,
                            color: Colors
                                .white, // This color will be masked by the gradient
                          ),
                        ),
                        Text(
                          exercise.title!.tr(),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20.0), // Space for content below
        // Add your content here
      ],
    );
  }
}
