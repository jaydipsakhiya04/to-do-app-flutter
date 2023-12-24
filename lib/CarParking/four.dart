import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_widget.dart';

class FourCar extends StatelessWidget {
  const FourCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset('asset/images/car3.png'),
            56.h.verticalSpace,
            Text(
              "Easy Payment",
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFF3B414B)),
            ),
            26.h.verticalSpace,
            Text(
              "Lorem ipsum dolor sit amet,\n consectetur adipiscing elit",
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF757F8C)),
            ),
            104.h.verticalSpace,
            /* MaterialButton(
              minWidth: 343.w,
              height: 56.h,
              color: Color(0XFF613EEA),

              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => FiveCar(),));
              },
            child: Text("Get Started",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700
            ),),
            ),*/
            CustomButton(
              title: "Get Started",
              onTap: () {},
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(50),
            ),
            10.h.verticalSpace,
            CustomButton(
              title: "Get Started",
              onTap: () {},
            ),
            10.h.verticalSpace,
            CustomButton(
              title: "Get Started",
              onTap: () {},
            ),
            36.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
