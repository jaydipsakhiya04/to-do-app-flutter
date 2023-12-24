import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/assets.dart';

class CustomButton extends StatelessWidget {
  String title;
  void Function()? onTap;
  Color? color;
  BorderRadiusGeometry? borderRadius;
  EdgeInsetsGeometry? padding;

  CustomButton(
      {Key? key,
      required this.title,
      this.onTap,
      this.padding,
      this.color,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 56.h,
        // width: 343.w,
        alignment: Alignment.center,

        /// ?? pella ni value no aapvi to ee automatic ?? pachhini value by default lai ley
        padding: padding ?? EdgeInsets.symmetric(vertical: 14.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
            color: color ?? AppColors.purple,
            borderRadius: borderRadius ?? BorderRadius.circular(6.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0XFF613EEA).withOpacity(0.32),
                offset: const Offset(0, 8),
                blurRadius: 20.r,
              )
            ]),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
