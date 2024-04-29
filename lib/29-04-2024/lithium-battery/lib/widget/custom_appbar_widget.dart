import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/utils/app_colors.dart';
import 'package:flutter_template/utils/images.dart';
import 'package:flutter_template/utils/navigation_utils/navigation.dart';
import 'package:flutter_template/widget/common_text.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final bool? isSimpleAppBar;
  final String? title;
  final Color? statusBarColor;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final Widget? flexibleSpace;
  final double? toolbarHeight;
  final Brightness? statusBarIconBrightness;

  CustomAppBar({
    Key? key,
    this.title,
    this.actions,
    this.statusBarColor,
    this.backgroundColor,
    this.bottom,
    this.flexibleSpace,
    this.toolbarHeight,
    this.statusBarIconBrightness,
    this.isSimpleAppBar = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(68.h),
      child: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness:Brightness.dark,
        ),
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor??AppColors.white,
        elevation: 0,
        flexibleSpace: flexibleSpace,
        title: (isSimpleAppBar ?? false)
            ? GestureDetector(
                onTap: () {
                  Navigation.pop();
                },
                child: Container(
                  height: 40.h,
                  width: 40.h,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey2,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: SvgPicture.asset(
                    ImageAsset.left,
                    height: 24.h,
                    width: 24.h,
                  ),
                ),
              )
            : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigation.pop();
                    },
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey2,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: SvgPicture.asset(
                        ImageAsset.left,
                        height: 24.h,
                        width: 24.h,
                      ),
                    ),
                  ),
                  12.w.horizontalSpace,
                  CommonText(
                    text: title ?? "",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkBlue,
                  ),
                ],
              ).paddingOnly(bottom: 0.h, top: 14.h),
        actions: actions,
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(68.h); // Increase the height here
}
