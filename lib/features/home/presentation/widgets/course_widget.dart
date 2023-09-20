import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../exercise.dart';
import 'course_details.dart';

class CourseSection extends StatelessWidget {
  const CourseSection({
    super.key, this.currentTime, this.upcomingTime, this.title, this.content,
  });
  
  final String? currentTime,upcomingTime,title,content;
  
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveHelper(context);
    return SizedBox(
      width: responsive.screenWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TimeLineWidget(),
          const SizedBox(width: 20,),
          CourseDetails(currentTime: currentTime, upcomingTime: upcomingTime, title: title, content: content),
        ],
      ),
    );
  }
}