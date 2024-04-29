import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/utils/app_colors.dart';
import 'package:flutter_template/utils/app_string.dart';
import 'package:flutter_template/utils/images.dart';
import 'package:flutter_template/utils/navigation_utils/navigation.dart';
import 'package:flutter_template/utils/navigation_utils/routes.dart';
import 'package:flutter_template/widget/common_text.dart';
import 'package:flutter_template/widget/custom_button.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Container(
      height: Get.height,
      width: Get.width,
      color: Colors.transparent,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomButton(
          onTap: (){
            Navigation.replaceAll(Routes.languageScreen);
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

          },
          padding: EdgeInsets.symmetric(vertical: 15.h),
          buttonColor: AppColors.orange,
          textColor: AppColors.white,
          text: "letsStart".tr,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ).marginSymmetric(horizontal: 16.w),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset(ImageAsset.onboardingImage,height: 530.h,width: double.infinity,fit: BoxFit.cover,),
                  Positioned(
                    top: 45 .h,
                    left: 14.w,
                    child: CommonText(
                      text: '${"welcomeToPowerace".tr}✨',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              20.h.verticalSpace,
              CommonText(
                text: "manageYourPower".tr,
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.darkBlue,
              ),
              10.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CommonText(
                      softWrap: true,
                        maxLine: 2,
                        text: "enjoyYourHolidayWithTheLithiumBatteriesFromPowerace".tr,
                        textAlign: TextAlign.center,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 18.w),
            ],
          ),
        ),
      ),
    );
  }
}
