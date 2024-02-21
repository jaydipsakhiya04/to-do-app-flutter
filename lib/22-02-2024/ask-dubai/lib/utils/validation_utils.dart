// import 'package:local/api/exception/app_exception.dart';
//
// extension Validator on String {
//   bool isValidEmail() {
//     String pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp regex = RegExp(pattern);
//     if (isEmpty) {
//       showError("Please enter your email address");
//       return false;
//     } else if (!regex.hasMatch(this)) {
//       showError("Email address is invalid");
//       return false;
//     }
//     return true;
//   }
//
//   bool isValidPassword() {
//     String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//     RegExp regex = RegExp(pattern);
//     print(length);
//     if (isEmpty) {
//       showError("Please enter your password");
//       return false;
//     } else if (length < 6) {
//       showError("Password length must be at least 6 character long");
//       return false;
//     } else if (!regex.hasMatch(this)) {
//       showError("Password is invalid");
//       return false;
//     }
//     return true;
//   }
//
//   bool isValidMobile() {
//     if (isEmpty) {
//       showError("Please enter your mobile number");
//       return false;
//     } else if (!(length > 7 && length < 14)) {
//       showError("Invalid mobile number");
//       return false;
//     }
//     return true;
//   }
// }
//
// void showError(String message) {
//   AppException(errorCode: 0, message: message).show();
// }
import '../api/exception/app_exception.dart';

extension Validator on String {
  static bool isEmailValid(String value) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }

  static bool isPasswordValid(String value) {
    final RegExp passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return passwordRegex.hasMatch(value);
  }

  static bool isNewPasswordValid(String value) {
    final RegExp passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegex.hasMatch(value);
  }

  static bool isConfirmPasswordValid(String value) {
    final RegExp passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegex.hasMatch(value);
  }
// bool isValidEmail() {
//   String pattern =
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//   RegExp regex = RegExp(pattern);
//   if (isEmpty) {
//     showError("Please enter your email address");
//     return false;
//   } else if (!regex.hasMatch(this)) {
//     showError("Email address is invalid");
//     return false;
//   }
//   return true;
// }
//
// bool isValidPassword() {
//   String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//   RegExp regex = RegExp(pattern);
//   print(length);
//   if (isEmpty) {
//     showError("Please enter your password");
//     return false;
//   } else if (length < 6) {
//     showError("Password length must be at least 6 character long");
//     return false;
//   } else if (!regex.hasMatch(this)) {
//     showError("Password is invalid");
//     return false;
//   }
//   return true;
// }
//
// bool isValidMobile() {
//   if (isEmpty) {
//     showError("Please enter your mobile number");
//     return false;
//   } else if (!(length > 7 && length < 14)) {
//     showError("Invalid mobile number");
//     return false;
//   }
//   return true;
// }
}

void showError(String message) {
  AppException(errorCode: 0, message: message).show();
}

///********
// import 'package:flutter/material.dart';
// import 'package:flutter_template/utils/app_string.dart';
//
// class Validation {
//   /// Set Password Validation Fucation ==>
//   // static String? passwordValidation(String value) {
//   //   if (value.isEmpty) {
//   //     return AppString.passIsRequi;
//   //   } else if (value.length < 6) {
//   //     return AppString.passLengthError;
//   //   } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
//   //     return AppString.passError;
//   //   } else {
//   //     return null;
//   //   }
//   // }
//
//   /// Set Email Validation Fucation ==>
//   static String? emailValidation(String value) {
//     if (value.isEmpty) {
//       return "AppString.emailIsRequi";
//     } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
//       return "AppString.emailError";
//     } else {
//       return null;
//     }
//   }
//
//   // static String? userValidation(String value) {
//   //   if (value.isEmpty) {
//   //     return AppString.userIsRequi;
//   //   } else if (!RegExp('[a-zA-Z]').hasMatch(value)) {
//   //     return AppString.userError;
//   //   } else {
//   //     return null;
//   //   }
//   // }
//   //
//   // static String? numberValidation(String value) {
//   //   if (value.isEmpty) {
//   //     return AppString.numberIsRequi;
//   //   } else if (!RegExp('^(?:[+0]9)?[0-9]{10}\$').hasMatch(value)) {
//   //     return AppString.numberError;
//   //   } else {
//   //     return null;
//   //   }
//   // }
//   //
//   // static String? bioValidation(String value) {
//   //   if (value.isEmpty) {
//   //     return 'Biography is requird';
//   //   } else {
//   //     return null;
//   //   }
//   // }
//   //
//   // static String? passIsSame({required String value, required String setPsw, required String confirmPsw}) {
//   //   if (setPsw != confirmPsw) {
//   //     return AppString.passNotMach;
//   //   } else {
//   //     return null;
//   //   }
//   // }
//   //
//   // static creatEvent({required String value, String? error}) {
//   //   if (value.isEmpty) {
//   //     return error;
//   //   }
//   //   return null;
//   // }
// }
