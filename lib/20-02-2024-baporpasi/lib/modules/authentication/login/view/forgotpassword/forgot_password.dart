import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/modules/authentication/login/controller/forgot_password_controller.dart';
import 'package:local/modules/authentication/login/view/login_screen.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/widget/appbar.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';
import 'package:local/widget/custom_textfeild.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());

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
        appBar: CustomAppBar(
          onTap: () => Navigation.remove(LoginScreen()),
        ),
        body: Form(
          key: forgotPasswordController.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction, // Enable auto-validation
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w500,
                  text: AppString.forgotPassword,
                ),
                CommonText(
                  height: 1.5,
                  fontSize: 14.sp,
                  color: AppColors.bodyDark,
                  fontWeight: FontWeight.w400,
                  text: AppString.forgotPassDescription,
                ).paddingOnly(top: 12.h, bottom: 18.h),
                Image.asset(
                  width: 271.w,
                  ImagesAsset.waveImage,
                ).paddingOnly(bottom: 40.h),
                CommonText(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  text: AppString.emailAddress,
                ),
                CustomTextField(
                  filled: true,
                  fillColor: AppColors.whiteColor.withOpacity(0.1),
                  controller: forgotPasswordController.emailController,
                  hintText: AppString.enterEmail,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      if (forgotPasswordController.isEmailFieldTouched) {
                        return 'Please enter your email';
                      }
                    } else if (!forgotPasswordController.isEmailValidValue.value && forgotPasswordController.isEmailFieldTouched) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ).paddingOnly(top: 10.h, bottom: 18.h),
                CustomButton(
                  text: AppString.next,
                  onTap: () {
                    if (forgotPasswordController.emailController.text.isNotEmpty) {
                      if (forgotPasswordController.formKey.currentState!.validate()) {
                        print('Email: ${forgotPasswordController.emailController.text}');
                        forgotPasswordController.isForgotPassword.value = true;
                        Navigation.pushNamed(Routes.emailOTP);
                      }
                    }
                  },
                ).paddingOnly(top: 26.h, bottom: 40.h),
              ],
            ).paddingOnly(
              left: 16.w,
              right: 16.w,
              top: 32.h,
            ),
          ),
        ),
      ),
    );
  }
}
