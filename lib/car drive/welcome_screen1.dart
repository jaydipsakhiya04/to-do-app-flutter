import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todoflutter/car%20drive/fill_car_details.dart';

class WelcomeFirst extends StatefulWidget {
  const WelcomeFirst({Key? key}) : super(key: key);

  @override
  State<WelcomeFirst> createState() => _WelcomeFirstState();
}

class _WelcomeFirstState extends State<WelcomeFirst> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          100.h.verticalSpace,
          Image.asset('asset/images/carlogo.png'),
          100.h.verticalSpace,

          /// Widget
          i == 0
              ? Screen1()
              : i == 1
                  ? Screen2()
                  : Screen3(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          i++;
          i == 3
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FillCarDetailsScreen(),
                  ))
              : null;
          setState(() {});
          // Get.to();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            border: Border.all(color: Colors.white70),
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(horizontal: 18.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 20.sp),
              ),
              10.w.horizontalSpace,
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Screen1() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Your no. 1 parking assistant lets make your car safe and feel good",
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Image.asset('asset/images/carbackimage.png'),
      ],
    );
  }

  Widget Screen2() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Your no. 1 parking assistant lets make your car safe and feel good",
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Image.asset('asset/images/carpic.png'),
      ],
    );
  }

  Widget Screen3() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Your no. 1 parking assistant lets make your car safe and feel good",
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Image.asset('asset/images/carpicsecond.png'),
      ],
    );
  }
}
