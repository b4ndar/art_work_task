import 'package:art_work/core/constants.dart';
import 'package:flutter/material.dart';


class CourseDetails extends StatelessWidget {
  const CourseDetails({
    super.key,
    required this.currentTime,
    required this.upcomingTime,
    required this.title,
    required this.content,
  });

  final String? currentTime;
  final String? upcomingTime;
  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// time icon , current and upcoming time
          Padding(
            padding: const EdgeInsets.only(bottom: 15,top: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// gradient container icon
                Container(
                  width: 30,
                  height: 30,
                  decoration: const ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, 1.00),
                      end: Alignment(0, -1),
                      colors: AppColors.primaryGradient,
                    ),
                    shape: OvalBorder(),
                  ),
                  child: const Icon(Icons.access_time,color: Colors.white,size: 18,),
                ),
                /// Current Time
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  child: Text(
                    '$currentTime',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                /// Upcoming time
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  child: Text(
                    '$upcomingTime',
                    style:  TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 14,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          /// container of title and content
          Container(
            width: double.infinity,
            height: 73,
            padding: const EdgeInsets.all(15),
            decoration: ShapeDecoration(
              color: const Color(0xff31334D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  '$content',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 15,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}