import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todoflutter/CarParking/second.dart';
import 'package:todoflutter/CarParking/third.dart';

import 'four.dart';

class PageSwipe extends StatefulWidget {
  const PageSwipe({Key? key}) : super(key: key);

  @override
  State<PageSwipe> createState() => _PageSwipeState();
}

class _PageSwipeState extends State<PageSwipe> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: const [
               SecondCar(),
               ThirdCar(),
               FourCar(),
            ],
          ),
          Positioned(
            bottom: 104,
            right : 170,
            child: SmoothPageIndicator(
              controller: pageController,
              count:  3,
              axisDirection: Axis.horizontal,
              effect:  const SlideEffect(
                  spacing:  8.0,
                  radius:  500.0,
                  dotWidth:  10.0,
                  dotHeight:  10.0,
                  paintStyle:  PaintingStyle.stroke,
                  strokeWidth:  1.5,
                  dotColor:  Colors.grey,
                  activeDotColor:  Colors.indigo
              ),
            ),
          )
        ],
      ),
    );
  }
}
