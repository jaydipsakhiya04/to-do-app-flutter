import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/authentication/login/controller/login_controller.dart';
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

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());
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
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(),
        body: Form(
          key: loginController.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction, // Enable auto-validation
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: AppString.welcomeBack,
                  fontWeight: FontWeight.w500,
                  fontSize: 26.sp,
                ),
                CommonText(
                  text: AppString.signInDescription,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
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
                  controller: loginController.emailController,
                  hintText: AppString.enterEmail,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      if (loginController.isEmailFieldTouched) {
                        return 'Please enter your email';
                      }
                    } else if (!loginController.isEmailValidValue.value && loginController.isEmailFieldTouched) {
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
                  controller: loginController.passwordController,
                  hintText: AppString.enterPassword,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      if (loginController.isPasswordFieldTouched) {
                        return 'Please enter your password';
                      }
                    } else if (!loginController.isPasswordValidValue.value && loginController.isPasswordFieldTouched) {
                      return 'Password must contain at least one uppercase letter, one lowercase letter, one digit, and be at least 8 characters long';
                    }
                    return null;
                  },
                ).paddingOnly(top: 10.h, bottom: 18.h),
                GestureDetector(
                  onTap: () {
                    loginController.passwordController.clear();
                    loginController.emailController.clear();
                    Navigation.pushNamed(Routes.forgotPass);
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CommonText(
                      fontSize: 14.sp,
                      text: AppString.forgotPassword,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                CustomButton(
                  onTap: () {
                    if (loginController.emailController.text.isNotEmpty && loginController.passwordController.text.isNotEmpty) {
                      if (loginController.formKey.currentState!.validate()) {
                        print('Email: ${loginController.emailController.text}');
                        print('Password: ${loginController.passwordController.text}');
                        // Navigation.pushNamed(Routes.homeScreen);
                        //
                        (splashController.isVandor.value) ? Navigation.replace(Routes.vanDorDashBoard) : Navigation.replace(Routes.userDashBoard);
                        print("vanDor Value ----> Splash to redirect ---> ${splashController.isVandor.value}");
                        (splashController.isVandor.value) ? print("Login to vanDor ---> vanDorDashBoard") : print("Login to user ---> userDashBoard");
                      }
                    }
                  },
                  text: AppString.signIn,
                ).paddingOnly(top: 26.h, bottom: 40.h),
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
                        print("vanDor Value ----> LogIn to redirect phoneNumber---> ${splashController.isVandor.value}");
                      },
                      image: IconAsset.mobileIcon,
                      buttonColor: AppColors.socialMediaButtonColor,
                    ),
                    SocialButtonWidget(
                      image: IconAsset.facebookIcon,
                      buttonColor: AppColors.socialMediaButtonColor,
                    ),
                    SocialButtonWidget(
                      image: IconAsset.googleIcon,
                      buttonColor: AppColors.socialMediaButtonColor,
                    ),
                    SocialButtonWidget(
                      image: IconAsset.appleIcon,
                      buttonColor: AppColors.socialMediaButtonColor,
                    ),
                  ],
                ).paddingOnly(bottom: 22.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      fontSize: 12.sp,
                      text: AppString.needAnAccount,
                      color: AppColors.bodyDark,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () => Navigation.pushNamed(Routes.signUp),
                      child: CommonText(
                        fontSize: 12.sp,
                        text: AppString.signup,
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
