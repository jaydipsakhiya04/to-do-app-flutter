import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local/utils/validation_utils.dart';

class LoginController extends GetxController {
  RxBool isSignUpValidat = false.obs;
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

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
