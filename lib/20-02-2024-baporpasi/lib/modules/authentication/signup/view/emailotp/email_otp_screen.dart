import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:local/modules/authentication/login/controller/forgot_password_controller.dart';
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
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class EmailOTPVefiedScreen extends StatelessWidget {
  EmailOTPVefiedScreen({super.key});

  PinputOTPController pinPutOTPController = Get.put(PinputOTPController());
  ForgotPasswordController forgotPasswordController = Get.find();
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
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: "AppString.enterTheCodeForEmail",
                fontWeight: FontWeight.w500,
                fontSize: 24.sp,
              ),
              CommonText(
                text: "AppString.enterTheCodeForEmailDescription",
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
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
                  CommonText(
                    text: AppString.resendAgain,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.bodyDark,
                  ).paddingOnly(right: 4.w),
                  // CommonText(
                  //   text: "1.23 sec",
                  //   fontWeight: FontWeight.w400,
                  //   fontSize: 14.sp,
                  //   color: AppColors.titleDark,
                  // ),
                  Obx(() {
                    final buttonText = pinPutOTPController.isResendEnabled.value
                        ? 'Resend OTP'
                        : ' ${pinPutOTPController.getFormattedTime(pinPutOTPController.resendDelayInSeconds.value)}';
                    return GestureDetector(
                      onTap: () {
                        if (pinPutOTPController.isResendEnabled.value) {
                          pinPutOTPController.startResendTimer();
                        }
                      },
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
                ],
              ).paddingOnly(bottom: 18.h),

              PinputOTP(),
              CustomButton(
                onTap: () {
                  // forgotPasswordController.emailController.clear();
                  if (pinPutOTPController.validatePin()) {
                    if (forgotPasswordController.isForgotPassword.value) {
                      print("isForgotPassword.value is---> ${forgotPasswordController.isForgotPassword.value}");
                      Navigation.pushNamed(Routes.createNewPass);
                    } else {
                      print("isForgotPassword.value is---> ${forgotPasswordController.isForgotPassword.value}");
                      (splashController.isVandor.value)
                          ? Navigation.pushNamed(Routes.createBusinessAccount)
                          : Navigation.pushNamed(Routes.enterUserDetails);
                      print("vanDor Value ----> PhoneOtp to redirect ---> ${splashController.isVandor.value}");
                      (splashController.isVandor.value)
                          ? print("PhoneOtp to redirect --->vanDor--->createBusinessAccount")
                          : print("PhoneOtp to redirect --->user--->enterUserDetails");
                    }
                  }
                },
                text: AppString.verify,
              ).paddingOnly(top: 26.h, bottom: 40.h),
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
