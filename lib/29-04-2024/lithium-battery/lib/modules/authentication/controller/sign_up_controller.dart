// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_template/modules/authentication/models/signup_form_data.dart';
// import 'package:flutter_template/modules/authentication/service/auth_service.dart';
// import 'package:flutter_template/utils/firebase_analytics_utils.dart';
// import 'package:flutter_template/utils/navigation_utils/navigation.dart';
// import 'package:flutter_template/utils/navigation_utils/routes.dart';
// // import 'package:flutter_template/utils/validation_utils.dart';
// import 'package:get/get.dart';
//
// class SignUpController extends GetxController {
//   RxBool isLoading = false.obs;
//   late final TextEditingController controller = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   FocusNode phoneTextFieldFocusNode = FocusNode();
//   final RxBool isDisable = true.obs;
//   final RxBool isCheck = true.obs;
//
//   bool checkError() {
//     if (!controller.text.isValidEmail() || !passwordController.text.isValidPassword()) {
//       return false;
//     }
//     return true;
//   }
//
//   Future<void> signUp() async {
//     try {
//       isLoading.value = true;
//       var result = await AuthService.signUp(SignUpFormData(
//         email: controller.text,
//         password: passwordController.text,
//       ));
//       isLoading.value = false;
//       Navigation.replaceAll(Routes.homeScreen);
//     } catch (e) {
//       print(e);
//     } finally {
//       if (isLoading.value) isLoading.value = false;
//     }
//   }
//
//   void handleDisable() {
//     isDisable.value =
//         (controller.text == "" || controller.text.isEmpty) || (passwordController.text == "" || passwordController.text.isEmpty) || !isCheck.value;
//   }
//
//   @override
//   void onInit() {
//     FirebaseAnalyticsUtils().sendCurrentScreen(FirebaseAnalyticsUtils.signUp);
//     super.onInit();
//   }
// }
