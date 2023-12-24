import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'five.dart';
import 'four.dart';

class ThirdCar extends StatelessWidget {
  const ThirdCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            178.h.verticalSpace,
            Image.asset('asset/images/carpicsecond.png'),
            55.h.verticalSpace,
            Text("Quick Navigation",style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: Color(0XFF3B414B)
            ),
            ),
            26.h.verticalSpace,
            Text("Lorem ipsum dolor sit amet,\n consectetur adipiscing elit",style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: Color(0XFF757F8C)
            ),),
            50.h.verticalSpace,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FourCar(),));
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
