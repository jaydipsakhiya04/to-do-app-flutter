import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/splash/controller/splash_controller.dart';
import 'package:local/modules/user/onboarding/controller/first_intro_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/app_text_style.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/app_button.dart';
import 'package:local/widget/common_text.dart';

class FirstIntroScreen extends StatelessWidget {
  FirstIntroScreen({Key? key}) : super(key: key);

  FirstIntroController firstIntroController = Get.put(FirstIntroController());
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
                        color: AppColors.titleDark,
                      ).paddingOnly(top: 16.h),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        ImagesAsset.splashImage,
                        height: 275.h,
                        width: 276.h,
                        fit: BoxFit.fill,
                      ),
                    ).paddingOnly(top: 50.h, bottom: 76.h),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CommonText(
                          text: AppString.discoverAll,
                          fontWeight: FontWeight.w600,
                          fontSize: 28.sp,
                          color: AppColors.titleDark,
                        ).paddingOnly(bottom: 16.h)),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CommonText(
                          text: AppString.effortlesslyExplore,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: AppColors.bodyDark,
                        ).paddingOnly(bottom: 50.h)),
                    AppButton(
                      backgroundColor: AppColors.primaryDefaultColor,
                      textColor: AppColors.titleDark,
                      name: AppString.letsGo,
                      onPressed: () {
                        Navigation.replace(Routes.secondIntro);
                        print("vanDor Value ----> first Intro to redirect ---> ${splashController.isVandor.value}");
                      },
                    ),
                  ],
                ).paddingOnly(left: 16.h, right: 16.h),
              ),
            )));
  }
}
