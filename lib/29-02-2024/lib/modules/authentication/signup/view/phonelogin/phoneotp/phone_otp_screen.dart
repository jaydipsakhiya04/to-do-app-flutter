import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/authentication/widget/pinput_otp.dart';
import 'package:local/modules/splash/controller/splash_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/appbar.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';

class PhoneOTPVefiedScreen extends StatelessWidget {
  PhoneOTPVefiedScreen({super.key});

  PinputOTPController pinPutOTPController = Get.put(PinputOTPController());
  SplashController splashController = Get.find();

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
        appBar: CustomAppBar(),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: AppString.enterTheCodeForPhone,
                fontWeight: FontWeight.w500,
                fontSize: 24.sp,
              ).marginOnly(right: 28.w),
              CommonText(
                text: AppString.enterTheCodeForPhoneDescription,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                height: 1.5,
                color: AppColors.bodyDark,
              ).paddingOnly(top: 12.h, bottom: 18.h),
              Image.asset(
                ImagesAsset.waveImage,
                width: 271.w,
              ).paddingOnly(bottom: 40.h),
              CommonText(
                text: AppString.didNotReceiveCode,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColors.bodyDark,
              ),
              Row(
                children: [
                  Obx(() {
                    return GestureDetector(
                        onTap: () {
                          if (pinPutOTPController.isResendEnabled.value) {
                            pinPutOTPController.startResendTimer();
                          }
                        },
                        child: pinPutOTPController.isResendEnabled.value?
                        const Text(
                          AppString.resendAgain,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ):
                        RichText(
                            text: TextSpan(
                            text: "Resend again in ",
                            style: TextStyle(
                              color: AppColors.bodyDark,
                            ),
                            children: [
                              TextSpan(
                                text: '${pinPutOTPController.getFormattedTime(pinPutOTPController.resendDelayInSeconds.value)} Sec',
                                style: TextStyle(
                                  color: AppColors.red,
                                ),
                              )
                            ]
                        ))
                    );
                  }),
                ],
              ).paddingOnly(bottom: 40.h),

              PinputOTP().paddingOnly(bottom: 24.h),

              CustomButton(
                onTap: () async {
                  // forgotPasswordController.emailController.clear();
                  // pinPutOTPController.validatePin();
                  if (pinPutOTPController.validatePin()) {
                    // (splashController.isVandor.value) ? Navigation.replace(Routes.createBusinessAccount) : Navigation.replace(Routes.firstIntro);
                    (splashController.isVandor.value)
                        ? Navigation.replace(Routes.createBusinessAccount)
                        : Navigation.replace(Routes.enterUserDetails);
                    print("vanDor Value ----> PhoneOtp to redirect ---> ${splashController.isVandor.value}");
                    (splashController.isVandor.value)
                        ? print("PhoneOtp to redirect --->vanDor--->createBusinessAccount")
                        : print("PhoneOtp to redirect --->user--->enterUserDetails");
                  }
                },
                text: AppString.verify,
              ).paddingOnly(bottom: 40.h),
              // CustomButton(
              //   onTap: () {},
              //   text: AppString.submit,
              // ).paddingOnly(top: 26.h, bottom: 40.h),
            ],
          ).paddingOnly(left: 16.w, right: 16.w, top: 32.h),
        ),
      ),
    );
    ;
  }
}
