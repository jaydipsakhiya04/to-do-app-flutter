import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/authentication/login/controller/forgot_password_controller.dart';
import 'package:local/modules/authentication/login/controller/login_controller.dart';
import 'package:local/modules/authentication/signup/controller/sign_up_controller.dart';
import 'package:local/modules/authentication/widget/social_button_widget.dart';
import 'package:local/modules/splash/controller/splash_controller.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/appbar.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';
import 'package:local/widget/custom_textfeild.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final SignUpController signUpController = Get.put(SignUpController());
  SplashController splashController = Get.find();
  final ForgotPasswordController forgotPasswordController = Get.find();
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
        body: Form(
          key: signUpController.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: AppString.greatCreateYourAccount,
                  fontWeight: FontWeight.w500,
                  fontSize: 26.sp,
                ),
                CommonText(
                  text: AppString.greatCreateYourAccountDescription,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  height: 1.5.h,
                  color: AppColors.bodyDark,
                ).paddingOnly(top: 12.h, bottom: 18.h),
                Image.asset(
                  ImagesAsset.waveImage,
                  width: 271.h,
                  fit: BoxFit.fill,
                ).paddingOnly(bottom: 40.h),
                CommonText(
                  text: AppString.emailAddress,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
                CustomTextField(
                  filled: true,
                  fillColor: AppColors.whiteColor.withOpacity(0.1),
                  controller: signUpController.emailController,
                  hintText: AppString.enterEmail,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      if (signUpController.isEmailFieldTouched) {
                        return 'Please enter your email';
                      }
                    } else if (!signUpController.isEmailValidValue.value && signUpController.isEmailFieldTouched) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ).paddingOnly(top: 10.h, bottom: 18.h),
                CommonText(
                  fontSize: 12.sp,
                  text: AppString.password,
                  fontWeight: FontWeight.w600,
                ),
                CustomTextField(
                  filled: true,
                  fillColor: AppColors.whiteColor.withOpacity(0.1),
                  controller: signUpController.passwordController,
                  hintText: AppString.enterPassword,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      if (signUpController.isPasswordFieldTouched) {
                        return 'Please enter your password';
                      }
                    } else if (!signUpController.isPasswordValidValue.value && signUpController.isPasswordFieldTouched) {
                      return 'Password must contain at least one uppercase letter, one lowercase letter, one digit, and be at least 8 characters long';
                    }
                    return null;
                  },
                ).paddingOnly(top: 10.h, bottom: 24.h),
                CustomButton(
                  onTap: () {
                    if (signUpController.emailController.text.isNotEmpty && signUpController.passwordController.text.isNotEmpty) {
                      if (signUpController.formKey.currentState!.validate()) {
                        print('Email: ${signUpController.emailController.text}');
                        print('Password: ${signUpController.passwordController.text}');
                        Navigation.pushNamed(Routes.emailOTP);
                        //
                        print("vanDor Value ----> SignUp to redirect emailOTP ---> ${splashController.isVandor.value}");
                      }
                    }
                  },
                  text: AppString.Continue,
                ).paddingOnly(bottom: 40.h),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: AppColors.secondaryTextColor),
                    ),
                    CommonText(
                      fontSize: 16.sp,
                      text: AppString.or,
                      color: AppColors.secondaryTextColor,
                      fontWeight: FontWeight.w600,
                    ).paddingSymmetric(horizontal: 8.w),
                    Expanded(
                      child: Divider(color: AppColors.secondaryTextColor),
                    )
                  ],
                ).paddingOnly(bottom: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialButtonWidget(
                      onTap: () {
                        Navigation.pushNamed(Routes.phoneNumber);
                        print("vanDor Value ----> SingUp to redirect phoneNumber---> ${splashController.isVandor.value}");
                      },
                      image: ImagesAsset.phone,
                      buttonColor: AppColors.socialMediaButtonColor,
                    ),
                    SocialButtonWidget(
                      image: ImagesAsset.facebook,
                      buttonColor: AppColors.socialMediaButtonColor,
                    ),
                    SocialButtonWidget(
                      image: ImagesAsset.google,
                      buttonColor: AppColors.socialMediaButtonColor,
                    ),
                    SocialButtonWidget(
                      image: ImagesAsset.apple,
                      buttonColor: AppColors.socialMediaButtonColor,
                    ),
                  ],
                ).paddingOnly(bottom: 22.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      fontSize: 12.sp,
                      text: AppString.alreadyHaveAccount,
                      color: AppColors.bodyDark,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigation.pushNamed(Routes.signIn);
                      },
                      child: CommonText(
                        fontSize: 12.sp,
                        text: AppString.signIn,
                        color: AppColors.titleDark,
                        fontWeight: FontWeight.w600,
                      ).paddingOnly(left: 10.w),
                    )
                  ],
                )
              ],
            ).paddingOnly(left: 16.w, right: 16.w, top: 32.h),
          ),
        ),
      ),
    );
  }
}
