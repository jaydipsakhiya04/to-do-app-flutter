import 'package:flutter/cupertino.dart';
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

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final AuthController _authController = Get.find();
  final GlobalKey<FormState> _loginFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  key: _loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "welcomeToPowerace".tr,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkBlue,
                      ),
                      8.h.verticalSpace,
                      CommonText(
                        text: "logInYourAccountByEnteringYourAccountDetails".tr,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                      32.h.verticalSpace,
                      CustomTextField(
                        inputLower: true,
                        label: "email".tr,
                        controller: _authController.emailLoginController,
                        hintText: "enterYourEmail".tr,
                        prefixImage: ImageAsset.sms,
                        validator: (value) => AppValidation.validateEmail(value),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      12.h.verticalSpace,
                      CustomTextField(
                        controller: _authController.passwordLoginController,
                        prefixImage: ImageAsset.lock,
                        label: "password".tr,
                        hintText: "enterPassword".tr,
                        isPassword: true,
                        validator: (value) => AppValidation.validatePassword(value),
                      ),
                      16.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigation.pushNamed(Routes.forgotPasswordScreen);
                            },
                            child: Container(
                              padding: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1.w, color: AppColors.orange),
                                ),
                              ),
                              child: CommonText(
                                text: "forgotPassword".tr,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                      40.h.verticalSpace,
                      Obx(
                      ()=>  CustomButton(
                            isLoader: _authController.isLoading.value,
                            onTap: () {
                              if(_loginFormKey.currentState!.validate()) {
                                Navigation.replaceAll(Routes.bluetoothDeviceScreen);
                                _authController.clearLoginFields();
                              }
                            },
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            buttonColor: AppColors.orange,
                            textColor: AppColors.white,
                            text: "logIn".tr,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          )
                      ),
                      30.h.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: Divider(color: AppColors.lightGrey),
                          ),
                          CommonText(
                            fontSize: 12.sp,
                            text: "or".tr,
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
                        text: "signInWithGoogle".tr,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      10.h.verticalSpace,
                      CustomButton(
                        svg: ImageAsset.apple,
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        buttonColor: AppColors.lightGrey3,
                        textColor: AppColors.darkBlue,
                        text: "signInWithApple".tr,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      78.h.verticalSpace,
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonText(
                              text: "dontHaveAnAccount".tr,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey,
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigation.pushNamed(Routes.signUpScreen);
                              },
                              child: Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 1.w, color: AppColors.orange),
                                  ),
                                ),
                                child: CommonText(
                                  text: "signUp".tr,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.orange,
                                ),
                              ),
                            ),
                          ],
                        ),
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
    );
  }
}

