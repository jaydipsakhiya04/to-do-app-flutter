import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local/utils/validation_utils.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();

  RxBool isForgotPassword = false.obs;

  RxBool isEmailValidValue = false.obs;
  bool isEmailFieldTouched = false; // Track if email field is touched
  late TextEditingController emailController;
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    emailController.addListener(() {
      isEmailFieldTouched = true; // Set to true when email field is interacted with
      // isEmailValidValue.value = isEmailValid(emailController.text);
      isEmailValidValue.value = Validator.isEmailValid(emailController.text);
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
