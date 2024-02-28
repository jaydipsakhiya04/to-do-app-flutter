import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local/utils/validation_utils.dart';

class CreateNewPasswordController extends GetxController {
  RxBool isSignUpValidat = false.obs;
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passController = TextEditingController();

  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  final formKey = GlobalKey<FormState>();
  RxBool isNewPasswordValidValue = false.obs;
  RxBool isConfirmPasswordValidValue = false.obs;
  bool isNewPasswordFieldTouched = false; // Track if password field is touched
  bool isConfirmPasswordFieldTouched = false; // Track if password field is touched

  @override
  void onInit() {
    super.onInit();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    newPasswordController.addListener(() {
      isNewPasswordFieldTouched = true; // Set to true when password field is interacted with
      isNewPasswordValidValue.value = Validator.isNewPasswordValid(newPasswordController.text);
    });
    confirmPasswordController.addListener(() {
      isConfirmPasswordFieldTouched = true; // Set to true when password field is interacted with
      isConfirmPasswordValidValue.value = Validator.isConfirmPasswordValid(confirmPasswordController.text);
    });
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

// FocusNode phoneTextFieldFocusNode = FocusNode();
// RxBool isDisable = true.obs;
// RxBool isEmail = true.obs;
// final ValueNotifier<Country?> selectedDialogCountry = ValueNotifier(CountryPickerUtils.getCountryByPhoneCode('91'));
//
// bool checkError() {
//   if ((isEmail.value ? !controller.text.isValidEmail() : !controller.text.isValidMobile()) || !passwordController.text.isValidPassword()) {
//     return false;
//   }
//   return true;
// }
//
// Future<void> signIn() async {
//   try {
//     isLoading.value = true;
//     await AuthService.signIn(SignInFormData(
//       email: controller.text,
//       password: passwordController.text,
//       countryCode: !(isEmail.value) ? selectedDialogCountry.value?.phoneCode : null,
//     ));
//     isLoading.value = false;
//     Navigation.replaceAll(Routes.homeScreen);
//   } catch (e) {
//     isLoading.value = false;
//   } finally {
//     if (isLoading.value) isLoading.value = false;
//   }
// }
//
// void handleButtonDisable() {
//   isDisable.value = (controller.text == "" || controller.text.isEmpty) || (passwordController.text == "" || passwordController.text.isEmpty);
// }
//
// @override
// void onInit() {
//   FirebaseAnalyticsUtils().sendCurrentScreen(FirebaseAnalyticsUtils.signIn);
//   super.onInit();
// }
}
