import 'package:flutter/material.dart';
import '../../../../core/helpers/helpers.dart';
import 'course_widget.dart';

class TodayCourse extends StatefulWidget {
  const TodayCourse({super.key});

  @override
  State<TodayCourse> createState() => _TodayCourseState();
}

class _TodayCourseState extends State<TodayCourse> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveHelper(context);

    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: responsive.screenWidth,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CourseSection(
            currentTime: '9:30',
            upcomingTime: '10:30',
            title: 'Morning Yoga',
            content: 'Sport Club United Gym',
          ),
          CourseSection(
            currentTime: '10:45',
            upcomingTime: '11:45',
            title: 'Morning Yoga',
            content: 'Sport Club United Gym',
          ),
        ],
      ),
    );
  }
}
