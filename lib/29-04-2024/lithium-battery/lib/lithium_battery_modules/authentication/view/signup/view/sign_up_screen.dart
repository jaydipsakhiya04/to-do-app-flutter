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

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final AuthController _authController = Get.find();
  final GlobalKey<FormState> _signUpFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: CustomAppBar(backgroundColor: AppColors.white,),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: AppString.creteYourAccount,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkBlue,
                        ),
                        8.h.verticalSpace,
                        CommonText(
                          text: AppString.signUpForFree,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                        ),
                        32.h.verticalSpace,
                        CustomTextField(
                          inputFormatters: [SentenceCapitalizationFormatter()],
                          label: AppString.name,
                          textCapitalization: TextCapitalization.words,
                          controller: _authController.personNameController,
                          prefixImage: ImageAsset.person,
                          hintText: AppString.enterName,
                          validator: (value) => AppValidation.nameValidation(value),
                        ),
                        12.h.verticalSpace,
                        CustomTextField(
                          label: AppString.email,
                          controller: _authController.emailSignUpController,
                          hintText: AppString.enterEmail,
                          prefixImage: ImageAsset.sms,
                          inputLower: true,
                          validator: (value) => AppValidation.validateEmail(value),
                        ),
                        12.h.verticalSpace,
                        CustomTextField(
                          controller: _authController.passwordSignUpController,
                          prefixImage: ImageAsset.lock,
                          label: AppString.password,
                          hintText: AppString.enterPassword,
                          isPassword: true,
                          validator: (value) => AppValidation.validatePassword(value),
                        ),
                        40.h.verticalSpace,
                        Obx(
                              ()=> CustomButton(
                            isLoader: _authController.isLoading.value,
                            onTap: () {
                              if(_signUpFormKey.currentState!.validate()) {
                                Navigation.replaceAll(Routes.bluetoothDeviceScreen);
                                _authController.clearLoginFields();
                              }
                            },
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            buttonColor: AppColors.orange,
                            textColor: AppColors.white,
                            text: AppString.signUp,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        30.h.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: Divider(color: AppColors.lightGrey),
                            ),
                            CommonText(
                              fontSize: 12.sp,
                              text: AppString.or,
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.w400,
                            ).paddingSymmetric(horizontal: 20.w),
                            Expanded(
                              child: Divider(color: AppColors.lightGrey),
                            )
                          ],
                        ).paddingOnly(bottom: 30.h),
                        CustomButton(
                          onTap: () {
                            Navigation.replaceAll(Routes.bluetoothDeviceScreen,);
                          },
                          svg: ImageAsset.google,
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          buttonColor: AppColors.lightGrey3,
                          textColor: AppColors.darkBlue,
                          text: AppString.signUpWithGoogle,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        10.h.verticalSpace,
                        CustomButton(
                          svg: ImageAsset.apple,
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          buttonColor: AppColors.lightGrey3,
                          textColor: AppColors.darkBlue,
                          text: AppString.signUpWithApple,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        45.h.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonText(
                              text: AppString.alreadyHaveAccount,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey,
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigation.replace(Routes.loginScreen);
                              },
                              child: Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 1.w, color: AppColors.orange),
                                  ),
                                ),
                                child: CommonText(
                                  text: AppString.login,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.orange,
                                ),
                              ),
                            ),
                          ],
                        ),
                        30.h.verticalSpace,
                      ],
                    ).paddingSymmetric(horizontal: 16.w),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

