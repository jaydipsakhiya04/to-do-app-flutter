import '../api/exception/app_exception.dart';

extension Validator on String {
  bool isValidEmail() {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (isEmpty) {
      showError("Please enter your email address");
      return false;
    } else if (!regex.hasMatch(this)) {
      showError("Invalid email address");
      return false;
    }
    return true;
  }

  bool isValidPassword() {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    print(length);
    if (isEmpty) {
      showError("Please enter your password");
      return false;
    } else if (length < 6) {
      showError("Password length must be at least 6 character long");
      return false;
    } else if (!regex.hasMatch(this)) {
      showError("Invalid Password");
      return false;
    }
    return true;
  }

  bool isValidMobile() {
    if (isEmpty) {
      showError("Please enter your mobile number");
      return false;
    } else if (!(length > 7 && length < 14)) {
      showError("Invalid mobile number");
      return false;
    }
    return true;
  }
}

void showError(String message) {
  AppException(errorCode: 0, message: message).show();
}
