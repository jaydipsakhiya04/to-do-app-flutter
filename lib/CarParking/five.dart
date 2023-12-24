import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/assets.dart';

class FiveCar extends StatelessWidget {
  const FiveCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: Column(
          children: [
            83.h.verticalSpace,
            Image.asset(AppImages.carLogo),
            138.h.verticalSpace,
            TextField(
              decoration: InputDecoration(
                  hintText: "Phone number",
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.purple,
                  )),
            ),
            43.h.verticalSpace,
            TextField(
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF757F8C),
                  )),
            ),
            22.h.verticalSpace,
            Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
