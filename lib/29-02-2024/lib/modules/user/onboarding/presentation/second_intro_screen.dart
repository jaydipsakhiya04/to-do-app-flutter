import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:local/modules/splash/controller/splash_controller.dart';
import 'package:local/modules/user/onboarding/controller/second_intro_controller.dart';
import 'package:local/modules/user/onboarding/widget/rotated_container.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/app_button.dart';
import 'package:local/widget/common_text.dart';

class SecondIntroScreen extends StatelessWidget {
  SecondIntroScreen({Key? key}) : super(key: key);

  SecondIntroController secondIntroController = Get.put(SecondIntroController());
  SplashController splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        child: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(ImagesAsset.bgImage), fit: BoxFit.cover),
            ),
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: CommonText(
                            text: AppString.welcomeToAskDubai,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: AppColors.bodyDark,
                          ).paddingOnly(bottom: 50.h, top: 16.h, left: 16.w, right: 16.w)),
                      CustomRotatedContainer(
                        angle: -0.05,
                        imageAsset: ImagesAsset.restaurants,
                        title: AppString.restaurants,
                        description: AppString.restaurantsDescription,
                      ).paddingOnly(bottom: 10.h),
                      CustomRotatedContainer(
                        angle: 0.05,
                        imageAsset: ImagesAsset.nightlife,
                        title: AppString.nightlife,
                        description: AppString.nightlifeDescription,
                      ).paddingOnly(bottom: 45.h, left: 10.w),
                      CustomRotatedContainer(
                        angle: -0.05,
                        imageAsset: ImagesAsset.shopping,
                        title: AppString.shopping,
                        description: AppString.shoppingDescription,
                      ).paddingOnly(bottom: 71.h),
                      AppButton(
                        backgroundColor: AppColors.primaryDefaultColor,
                        textColor: AppColors.titleDark,
                        name: AppString.signIn,
                        onPressed: () {
                          Navigation.pushNamed(Routes.signIn);
                        },
                      ).paddingOnly(bottom: 10.h, left: 16.w, right: 16.w),
                      AppButton(
                        side: BorderSide(color: AppColors.primaryDefaultColor),
                        backgroundColor: Colors.transparent,
                        textColor: AppColors.primaryDefaultColor,
                        name: AppString.createAccount,
                        onPressed: () {
                          Navigation.pushNamed(Routes.signUp);
                          print("vanDor Value ----> second Intro to redirect signUp---> ${splashController.isVandor.value}");
                        },
                      ).paddingOnly(bottom: 10.h, left: 16.w, right: 16.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonText(
                            text: AppString.bySigningUpYou,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: AppColors.bodyDark,
                          ).paddingOnly(right: 5.w),
                          // Text(AppString.termsConditions, style: AppTextStyle().hanKenF12W5titleDark),
                        ],
                      ).paddingOnly(bottom: 0.h, left: 16.w, right: 16.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonText(
                            text: AppString.termsConditions,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: AppColors.titleDark,
                          ).paddingOnly(right: 5.w),
                          CommonText(
                            text: "and",
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: AppColors.bodyDark,
                          ).paddingOnly(right: 5.w),
                          CommonText(
                            text: AppString.privacyPolicy,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: AppColors.titleDark,
                          ).paddingOnly(right: 5.w),
                        ],
                      ).paddingOnly(bottom: 0.h, left: 16.w, right: 16.w),
                    ],
                  )),
            )));
  }
}
