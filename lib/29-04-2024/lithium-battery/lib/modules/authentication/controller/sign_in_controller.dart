// import 'dart:async';
//
// import 'package:country_pickers/country.dart';
// import 'package:country_pickers/country_pickers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_template/modules/authentication/models/signin_form_data.dart';
// import 'package:flutter_template/modules/authentication/service/auth_service.dart';
// import 'package:flutter_template/utils/firebase_analytics_utils.dart';
// import 'package:flutter_template/utils/navigation_utils/navigation.dart';
// import 'package:flutter_template/utils/navigation_utils/routes.dart';
// import 'package:flutter_template/utils/validation_utils.dart';
// import 'package:get/get.dart';
//
// class SignInController extends GetxController {
//   RxBool isLoading = false.obs;
//   final TextEditingController controller = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   FocusNode phoneTextFieldFocusNode = FocusNode();
//   RxBool isDisable = true.obs;
//   RxBool isEmail = true.obs;
//   final ValueNotifier<Country?> selectedDialogCountry = ValueNotifier(CountryPickerUtils.getCountryByPhoneCode('91'));
//
//   bool checkError() {
//     if ((isEmail.value ? !controller.text.isValidEmail() : !controller.text.isValidMobile()) || !passwordController.text.isValidPassword()) {
//       return false;
//     }
//     return true;
//   }
//
//   Future<void> signIn() async {
//     try {
//       isLoading.value = true;
//       await AuthService.signIn(SignInFormData(
//         email: controller.text,
//         password: passwordController.text,
//         countryCode: !(isEmail.value) ? selectedDialogCountry.value?.phoneCode : null,
//       ));
//       isLoading.value = false;
//       Navigation.replaceAll(Routes.homeScreen);
//     } catch (e) {
//       isLoading.value = false;
//     } finally {
//       if (isLoading.value) isLoading.value = false;
//     }
//   }
//
//   void handleButtonDisable() {
//     isDisable.value = (controller.text == "" || controller.text.isEmpty) || (passwordController.text == "" || passwordController.text.isEmpty);
//   }
//
//   @override
//   void onInit() {
//     FirebaseAnalyticsUtils().sendCurrentScreen(FirebaseAnalyticsUtils.signIn);
//     super.onInit();
//   }
// }
