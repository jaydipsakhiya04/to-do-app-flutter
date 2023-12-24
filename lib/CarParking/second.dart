import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoflutter/CarParking/third.dart';

import 'five.dart';

class SecondCar extends StatelessWidget {
  const SecondCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            183.h.verticalSpace,
            Image.asset('asset/images/carpic.png'),
            64.h.verticalSpace,
            Text(
              "Best Parking Spots",
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
            92.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FiveCar(),));
                }, child: Text(
                  "Skip",style: TextStyle(
                  fontSize: 17.sp,fontWeight: FontWeight.w600,color: Color(0XFF613EEA).withOpacity(0.40)
                ),
                )),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdCar(),));
                }, child: Text(
                  "Next",style: TextStyle(
                    fontSize: 17.sp,fontWeight: FontWeight.w600,color: Color(0XFF613EEA)
                ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
