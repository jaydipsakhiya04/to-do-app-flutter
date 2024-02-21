import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImagesAsset.bgImage),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                ImagesAsset.getStartImage,
                height: 300.h,
              ).paddingOnly(bottom: 48.h),
              CommonText(
                text: AppString.letsGetYou,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                height: 1.4,
                fontSize: 28.sp,
              ),
              CommonText(
                text: AppString.letsGetYouDescription,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                height: 1.5,
                color: AppColors.bodyDark,
                fontSize: 14.sp,
              ).paddingOnly(top: 4.h, bottom: 32.h),
              CustomButton(
                onTap: () {
                  Navigation.pushNamed(Routes.businessHours);
                },
                text: AppString.getStarted,
              ).paddingOnly(bottom: 22.h),
              CommonText(
                text: AppString.noThanksIllDo,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                height: 1.5,
                fontSize: 16.sp,
              )
            ],
          ).paddingOnly(left: 16.w, right: 16.w, top: 32.h),
        ),
      ),
    );
  }
}
