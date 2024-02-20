import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:local/modules/authentication/widget/pinput_otp.dart';
import 'package:local/utils/app_colors.dart';
import 'package:local/utils/app_string.dart';
import 'package:local/utils/assets.dart';
import 'package:local/utils/navigation_utils/navigation.dart';
import 'package:local/utils/navigation_utils/routes.dart';
import 'package:local/utils/validation_utils.dart';
import 'package:local/widget/common_text.dart';
import 'package:local/widget/custom_button.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  // RxBool isLoading = false.obs;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();
  RxBool isEmailValidValue = false.obs;
  RxBool isPasswordValidValue = false.obs;
  bool isEmailFieldTouched = false; // Track if email field is touched
  bool isPasswordFieldTouched = false; // Track if password field is touched

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailController.addListener(() {
      isEmailFieldTouched = true; // Set to true when email field is interacted with
      // isEmailValidValue.value = isEmailValid(emailController.text);
      isEmailValidValue.value = Validator.isEmailValid(emailController.text);
    });
    passwordController.addListener(() {
      isPasswordFieldTouched = true; // Set to true when password field is interacted with
      isPasswordValidValue.value = Validator.isPasswordValid(passwordController.text);
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // FocusNode phoneTextFieldFocusNode = FocusNode();
  // final RxBool isDisable = true.obs;
  // final RxBool isCheck = true.obs;
  //
  // bool checkError() {
  //   if (!controller.text.isValidEmail() || !passwordController.text.isValidPassword()) {
  //     return false;
  //   }
  //   return true;
  // }
  //
  // Future<void> signUp() async {
  //   try {
  //     isLoading.value = true;
  //     var result = await AuthService.signUp(SignUpFormData(
  //       email: controller.text,
  //       password: passwordController.text,
  //     ));
  //     isLoading.value = false;
  //     Navigation.replaceAll(Routes.homeScreen);
  //   } catch (e) {
  //     print(e);
  //   } finally {
  //     if (isLoading.value) isLoading.value = false;
  //   }
  // }
  //
  // void handleDisable() {
  //   isDisable.value =
  //       (controller.text == "" || controller.text.isEmpty) || (passwordController.text == "" || passwordController.text.isEmpty) || !isCheck.value;
  // }
  //
  // @override
  // void onInit() {
  //   FirebaseAnalyticsUtils().sendCurrentScreen(FirebaseAnalyticsUtils.signUp);
  //   super.onInit();
  // }
}
