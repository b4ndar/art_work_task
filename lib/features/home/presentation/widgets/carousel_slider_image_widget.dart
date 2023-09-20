import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class CarouselSliderImage extends StatefulWidget {
  const CarouselSliderImage({super.key});

  @override
  State<CarouselSliderImage> createState() => _CarouselSliderImageState();
}

class _CarouselSliderImageState extends State<CarouselSliderImage> {

  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveHelper(context);

    return SizedBox(
      height: responsive.screenHeight / 3,
      width: responsive.screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
              viewportFraction: 0.9,
              enableInfiniteScroll: false,
              reverse: false,
            ),
            items: exerciseImages
                .map((item) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                ),
              ),
            ))
                .toList(),
          ),
      const SizedBox(height: 10,),
      /// Custom CarouselSlider controller
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(exerciseImages.length,
              (index) {
            return InkWell(
              onTap: () {
                setState(() {_currentIndex = index;
                _carouselController.animateToPage(index);});
              },
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? const Color(0xffFF76B9) // Active indicator color
                      : const Color(0xff593D67), // Inactive indicator color
                ),
              ),
            );
          },
        ),),
        ],
      ),
    );
  }
}
