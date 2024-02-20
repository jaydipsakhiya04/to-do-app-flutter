import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local/modules/authentication/login/controller/create_new_password_controller.dart';
import 'package:local/modules/authentication/login/controller/forgot_password_controller.dart';
import 'package:local/modules/authentication/login/controller/login_controller.dart';
import 'package:local/modules/authentication/widget/social_button_widget.dart';
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

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({Key? key}) : super(key: key);
  final CreateNewPasswordController createNewPasswordController = Get.put(CreateNewPasswordController());
  final ForgotPasswordController forgotPasswordController = Get.find();
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
          key: createNewPasswordController.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction, // Enable auto-validation
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: AppString.createNewPassword,
                  fontWeight: FontWeight.w500,
                  fontSize: 26.sp,
                ),
                CommonText(
                  text: AppString.createNewPasswordDescription,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.bodyDark,
                ).paddingOnly(
                  top: 12.h,
                  bottom: 18.h,
                ),
                Image.asset(
                  ImagesAsset.waveImage,
                  width: 271.h,
                  fit: BoxFit.fill,
                ).paddingOnly(
                  bottom: 40.h,
                ),
                CommonText(
                  text: AppString.newPassword,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
                CustomTextField(
                  filled: true,
                  fillColor: AppColors.whiteColor.withOpacity(0.1),
                  controller: createNewPasswordController.newPasswordController,
                  hintText: AppString.enterNewPassword,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      if (createNewPasswordController.isNewPasswordFieldTouched) {
                        return 'Please enter your password';
                      }
                    } else if (!createNewPasswordController.isNewPasswordValidValue.value && createNewPasswordController.isNewPasswordFieldTouched) {
                      return 'Password must contain at least one uppercase letter, one lowercase letter, one digit, and be at least 8 characters long';
                    }
                    return null;
                  },
                ).paddingOnly(
                  top: 10.h,
                  bottom: 18.h,
                ),
                CommonText(
                  fontSize: 12.sp,
                  text: AppString.confirmPassword,
                  fontWeight: FontWeight.w600,
                ),
                CustomTextField(
                  filled: true,
                  fillColor: AppColors.whiteColor.withOpacity(0.1),
                  controller: createNewPasswordController.confirmPasswordController,
                  hintText: AppString.enterConfirmNewPassword,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      if (createNewPasswordController.isConfirmPasswordFieldTouched) {
                        return 'Please enter your password';
                      }
                    } else if (!createNewPasswordController.isConfirmPasswordValidValue.value &&
                        createNewPasswordController.isConfirmPasswordFieldTouched) {
                      return 'Password must contain at least one uppercase letter, one lowercase letter, one digit, and be at least 8 characters long';
                    }
                    return null;
                  },
                ).paddingOnly(
                  top: 10.h,
                  bottom: 18.h,
                ),
                CustomButton(
                  onTap: () {
                    if (createNewPasswordController.formKey.currentState!.validate()) {
                      print('Password: ${createNewPasswordController.newPasswordController.text}');
                      print('Password: ${createNewPasswordController.confirmPasswordController.text}');
                      // Navigation.pushNamed(Routes.forgotPass);
                      forgotPasswordController.isForgotPassword.value = false;
                    }
                  },
                  text: AppString.submit,
                ).paddingOnly(top: 26.h, bottom: 40.h),
              ],
            ).paddingOnly(left: 16.w, right: 16.w, top: 32.h),
          ),
        ),
      ),
    );
  }
}
