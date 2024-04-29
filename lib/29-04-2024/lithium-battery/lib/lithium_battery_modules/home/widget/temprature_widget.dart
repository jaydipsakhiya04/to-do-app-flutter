import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/utils/app_colors.dart';
import 'package:flutter_template/widget/common_text.dart';

class TemperatureWidget extends StatelessWidget {
  final String image;
  final String title;
  final String amount;

   TemperatureWidget({Key? key,
     required this.image,
     required this.title,
     required this.amount,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.lightGrey,
            spreadRadius: 0.r,
            blurRadius: 5.r,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w,),
        // contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: EdgeInsets.all(6.r),
          decoration: BoxDecoration(color: AppColors.darkWhite, borderRadius: BorderRadius.circular(2.r)),
          child: SvgPicture.asset(
            image,
            height: 24.h,
            width: 24.h,
          ),
        ),
        title:  CommonText(
          text: title,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.grey,
        ),
        trailing:  CommonText(
          text: amount,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.darkBlue,
        ),
      ),
    );
  }
}
