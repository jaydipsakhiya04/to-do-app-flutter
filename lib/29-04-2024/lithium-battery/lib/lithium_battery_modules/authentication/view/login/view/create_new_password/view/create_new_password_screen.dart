import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/lithium_battery_modules/authentication/controller/auth_controller.dart';
import 'package:flutter_template/utils/app_colors.dart';
import 'package:flutter_template/utils/app_string.dart';
import 'package:flutter_template/utils/images.dart';
import 'package:flutter_template/utils/navigation_utils/navigation.dart';
import 'package:flutter_template/utils/navigation_utils/routes.dart';
import 'package:flutter_template/utils/social_authentication/app_validations.dart';
import 'package:flutter_template/widget/common_text.dart';
import 'package:flutter_template/widget/custom_appbar_widget.dart';
import 'package:flutter_template/widget/custom_button.dart';
import 'package:flutter_template/widget/custom_textfeild.dart';
import 'package:get/get.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({Key? key}) : super(key: key);

  final AuthController _authController = Get.find();
  final GlobalKey<FormState> _newPasswordFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Form(
        key: _newPasswordFormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: "createNewPassword".tr,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.darkBlue,
              ),
              8.h.verticalSpace,
              CommonText(
                text: "yourNewPasswordMustBeDifferentFromPreviousUsedPassword".tr,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
              ),
              32.h.verticalSpace,
              CustomTextField(
                controller: _authController.newPasswordController,
                prefixImage: ImageAsset.lock,
                label: "newPassword".tr,
                hintText: "enterPassword".tr,
                isPassword: true,
                validator: (value) => AppValidation.validatePassword(value),
              ),
              14.h.verticalSpace,
              CustomTextField(
                controller: _authController.confirmNewPasswordController,
                prefixImage: ImageAsset.lock,
                label: "confirmNewPassword".tr,
                hintText: "enterPassword".tr,
                isPassword: true,
                validator: (value) => AppValidation.confirmPasswordValidation(
                    value, _authController.newPasswordController.text),
              ),
              40.h.verticalSpace,
              Obx(
                () => CustomButton(
                  isLoader: _authController.isLoading.value,
                  onTap: () {
                    if (_newPasswordFormKey.currentState!.validate()) {
                      Navigation.pushNamed(Routes.loginScreen);
                    }
                  },
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  buttonColor: AppColors.orange,
                  textColor: AppColors.white,
                  text:"confirm".tr,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 16.w),
        ),
      ),
    );
  }
}
