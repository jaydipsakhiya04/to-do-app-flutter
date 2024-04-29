import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/lithium_battery_modules/authentication/controller/auth_controller.dart';
import 'package:flutter_template/utils/app_colors.dart';
import 'package:flutter_template/utils/app_string.dart';
import 'package:flutter_template/utils/navigation_utils/navigation.dart';
import 'package:flutter_template/utils/navigation_utils/routes.dart';
import 'package:flutter_template/utils/social_authentication/app_validations.dart';
import 'package:flutter_template/widget/common_text.dart';
import 'package:flutter_template/widget/custom_appbar_widget.dart';
import 'package:flutter_template/widget/custom_button.dart';
import 'package:flutter_template/widget/custom_textfeild.dart';
import 'package:get/get.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({Key? key}) : super(key: key);

  final AuthController _authController = Get.find();

  final GlobalKey<FormState> _otpSentFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Form(
        key: _otpSentFormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${"enterTheCodeWeveSentTo".tr} ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "Outfit",
                        fontSize: 24.sp,
                        color: AppColors.darkBlue,
                      ),
                    ),
                    TextSpan(
                      text: _authController.emailForgotController.text,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Outfit",
                        fontSize: 24.sp,
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
              8.h.verticalSpace,
              CommonText(
                text: "weJustSentYouAnEmailWithAFourDigitVerificationCodeTheCodeMayTakeUpToAMinuteToArrive".tr,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
              ),
              32.h.verticalSpace,
              CustomTextField(
                isPrefix: false,
                keyboardType: TextInputType.number,
                contentPadding: EdgeInsets.only(left: 16.w),
                inputFormatters: [LengthLimitingTextInputFormatter(4)],
                label:'${"otp".tr}*',
                textColor: AppColors.darkBlue,
                validator: (value) => AppValidation.otpValidation(value),
              ),
              16.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text:"sendCodeReloadIn".tr,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                  ),
                  Obx(
                    () => CommonText(
                      text: _authController.formattedTime(),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkBlue,
                    ),
                  ),
                ],
              ),
              40.h.verticalSpace,
              Obx(
                () => CustomButton(
                  isLoader: _authController.isLoading.value,
                  onTap: () {
                    if (_otpSentFormKey.currentState!.validate()) {
                      Navigation.pushNamed(Routes.createNewPasswordScreen);
                    }
                  },
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  buttonColor: AppColors.orange,
                  textColor: AppColors.white,
                  text:"verify".tr,
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
