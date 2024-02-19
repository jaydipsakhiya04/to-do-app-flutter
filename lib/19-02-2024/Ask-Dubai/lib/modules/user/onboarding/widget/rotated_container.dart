import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/widget/common_text.dart';

class RotatedContainer extends StatelessWidget {
  final double angle;
  final Alignment alignment;
  final Widget child;

  RotatedContainer({
    required this.angle,
    required this.alignment,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      alignment: alignment,
      child: Center(
        child: child,
      ),
    );
  }
}

class CustomRotatedContainer extends StatelessWidget {
  final double angle;
  final String imageAsset;
  final String title;
  final String description;

  CustomRotatedContainer({
    required this.angle,
    required this.imageAsset,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedContainer(
      angle: angle,
      alignment: Alignment.topLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: Colors.white),
          color: Colors.white.withOpacity(0.12),
        ),
        width: 343.w,
        height: 120.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6.5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Image.asset(
                    imageAsset,
                    height: 24.h,
                    width: 24.h,
                    fit: BoxFit.fill,
                  ),
                ).paddingOnly(right: 11.h),
                CommonText(
                  text: title,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.titleDark,
                ),
              ],
            ).paddingOnly(bottom: 10.h),
            CommonText(
              text: description,
              fontWeight: FontWeight.w500,
              fontSize: 11.sp,
              color: AppColors.titleDark,
            ),
          ],
        ).paddingSymmetric(horizontal: 15.h, vertical: 15.h),
      ),
    );
  }
}
