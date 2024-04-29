class AppValidation {
  static String? confirmPasswordValidation(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else {
      if (password != value) {
        return 'Passwords do not match';
      }
      return null;
    }
  }


  static String? validateEmail(String? value) {
    // Null or empty check
    if (value!.isEmpty) {
      return 'Please enter your email address';
    }

    // Regex pattern for email validation
    final RegExp emailRegex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    // Check if the entered email matches the pattern
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null; // Return null if the email is valid
  }


  static String? validatePassword(String? value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return 'Please enter a password';
    } else {
      if (value.length < 8) {
        return 'password length must be greater than 8';
      } else {
        if (!regex.hasMatch(value)) {
          return 'Password must contain alphanumerical characters';
        }
        return null;
      }
    }
  }


  static String? emptyFieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'please fill the field';
    }
    return null;
  }

  static String? otpValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'please fill the field';
    } else {
      if (value.length < 4) {
        return 'Please enter valid otp code';
      } else {
        return null;
      }
    }
  }

  static String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'please fill the field';
    } else {
      return null;
    }
  }
}
