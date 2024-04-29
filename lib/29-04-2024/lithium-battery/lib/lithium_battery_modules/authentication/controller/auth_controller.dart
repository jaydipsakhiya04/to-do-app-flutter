import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  RxBool isLoading = false.obs;


  //login-------

  // GlobalKey<FormState> loginFormKey = GlobalKey();

  TextEditingController emailLoginController =TextEditingController();
  TextEditingController passwordLoginController =TextEditingController();

  void clearLoginFields(){
    emailLoginController.clear();
    passwordLoginController.clear();
  }


  //forgot password-----



  TextEditingController emailForgotController =TextEditingController();

  //otp verification-----



  TextEditingController otpVerificationController =TextEditingController();

  RxInt minutes = 2.obs; // Set initial minutes to 2
  RxInt seconds = 0.obs; // Set initial seconds to 0
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (minutes.value == 0 && seconds.value == 0) {
        _timer?.cancel();
      } else {
        if (seconds.value == 0) {
          minutes.value--; // Decrease minutes when seconds reach 0
          seconds.value = 59; // Reset seconds to 59
        } else {
          seconds.value--; // Decrease seconds
        }
      }
    });
  }

  String formattedTime() {
    String minStr = minutes.value.toString().padLeft(2, '0');
    String secStr = seconds.value.toString().padLeft(2, '0');
    String suffix = minutes.value != 0 ? "Min" : "Sec";
    return "$minStr:$secStr $suffix";
  }



  void resetTimer() {
    _timer?.cancel(); // Cancel the existing timer if running
    _timer = null; // Reset the timer
    isLoading(false); // Reset isLoading value
    minutes.value = 2; // Reset minutes to initial value
    seconds.value = 0; // Reset seconds to initial value
  }




  //create new password-----



  TextEditingController newPasswordController =TextEditingController();
  TextEditingController confirmNewPasswordController =TextEditingController();


  //sign up------

  // GlobalKey<FormState> signUpFormKey = GlobalKey();

  TextEditingController personNameController =TextEditingController();
  TextEditingController emailSignUpController =TextEditingController();
  TextEditingController passwordSignUpController =TextEditingController();











}