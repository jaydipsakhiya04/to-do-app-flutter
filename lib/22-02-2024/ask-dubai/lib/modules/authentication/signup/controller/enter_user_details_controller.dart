import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local/utils/validation_utils.dart';

class EnterUserDetailsController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  late TextEditingController emailController;
  final formKey = GlobalKey<FormState>();
  RxBool isEmailValidValue = false.obs;
  bool isEmailFieldTouched = false; // Track if email field is touched

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
