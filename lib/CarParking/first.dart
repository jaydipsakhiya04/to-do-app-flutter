import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoflutter/CarParking/page_swipe.dart';

class FirstCar extends StatefulWidget {
  const FirstCar({Key? key}) : super(key: key);

  @override
  State<FirstCar> createState() => _FirstCarState();
}

class _FirstCarState extends State<FirstCar> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => PageSwipe()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            226.h.verticalSpace,
            Image.asset('asset/images/carlogo.png'),
            54.h.verticalSpace,
            Text(
              "Your no. 1 parking assistant",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
            ),
            Spacer(),
            Image.asset('asset/images/carbackimage.png'),
          ],
        ),
      ),
    );
  }
}
