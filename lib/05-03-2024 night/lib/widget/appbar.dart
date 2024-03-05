import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/assets.dart';
import 'package:local/widget/common_text.dart';
import '../utils/constants.dart'; // Assuming you have a file for your constants like AppColors

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onTap;
  final bool isTrailing;
  final Widget? trailingWidget;

  CustomAppBar({this.onTap, this.isTrailing = false, this.trailingWidget});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Container(
          height: 40.h,
          width: 40.h,
          decoration: BoxDecoration(
            color: AppColors.appColor,
            borderRadius: BorderRadius.circular(8.89.r),
            border: Border.all(
              width: 1.25,
              color: AppColors.borderColor.withOpacity(0.2),
            ),
          ),
          child: Center(
            child: GestureDetector(
              onTap: onTap,
              child: SvgPicture.asset(
                IconAsset.vector,
                height: 15.h,
                width: 9.w,
                alignment: Alignment.center,
                colorFilter: ColorFilter.mode(
                  AppColors.titleDark,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      actions: [
        if (isTrailing && trailingWidget != null)
          GestureDetector(
            child: trailingWidget!,
          ),
      ],
    );
  }
}

class CustomTrailingWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  double? fontSize;
  FontWeight? fontWeight;
  final String imageAsset;

   CustomTrailingWidget({Key? key, this.onTap, required this.text, required this.imageAsset,this.fontSize,this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CommonText(
            text: text,
            fontWeight: fontWeight??FontWeight.w500,
            height: 1.5,
            fontSize: fontSize??16.sp,
            color: AppColors.titleDark,
          ).paddingOnly(right: 2.w),
          Image.asset(
            imageAsset,
            scale: 3,
          ).paddingOnly(right: 16.w),
        ],
      ),
    );
  }
}
