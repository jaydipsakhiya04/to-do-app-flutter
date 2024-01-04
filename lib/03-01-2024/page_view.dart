import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Screen1 extends StatefulWidget {
  Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                screenCard(
                    image: "assets/images/undraw_city_driver_jh2h 1 (1).png",
                    title: "TItle TItle 1",
                    subTitle:
                        ",style: TextStyle(fontSize: 24,color: Colors.black)"),
                screenCard(
                    image: "assets/images/undraw_Map_light_3hjy 1 (1).png",
                    title: "TItle TItle 2",
                    subTitle:
                        ",style: TextStyle(fontSize: 24,color: Colors.black)"),
                screenCard(
                    image: "assets/images/undraw_mobile_payments_edgf 1.png",
                    title: "TItle TItle 3",
                    subTitle:
                        ",style: TextStyle(fontSize: 24,color: Colors.black)"),
              ],
            ),
          ),
          Container(
            color: Colors.indigoAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      pageController.animateToPage(2,
                          duration: const Duration(microseconds: 100),
                          curve: Curves.ease);

                      setState(() {});
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.grey),
                    )),
                SmoothPageIndicator(controller: pageController, count: 3),
                TextButton(
                    onPressed: () {
                      pageController.nextPage(
                          duration: const Duration(microseconds: 100),
                          curve: Curves.ease);

                      if (pageController.page == 2) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Second()));
                      }

                      // index++;
                      setState(() {});
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget screenCard({
    required String image,
    required String title,
    required String subTitle,
    // required int index,
  }) {
    return Column(
      children: [
        Image.asset(image),
        240.h.verticalSpace,
        Expanded(
          child: Container(
            width: 1.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  topLeft: Radius.circular(20.r)),
              color: Colors.indigoAccent,
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 24.sp, color: Colors.black),
                ),
                20.h.verticalSpace,
                Text(subTitle,
                    style: TextStyle(fontSize: 17.sp, color: Colors.white)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
