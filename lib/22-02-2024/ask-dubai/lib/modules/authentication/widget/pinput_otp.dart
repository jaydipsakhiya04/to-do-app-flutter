import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local/utils/app_colors.dart';
import 'package:pinput/pinput.dart';

class PinputOTPController extends GetxController {
  late TextEditingController pinController;
  late FocusNode focusNode;
  late GlobalKey<FormState> formKey;
  late RxString pinError;
  late RxBool isResendEnabled;
  late Timer _resendTimer;
  late RxInt resendDelayInSeconds;

  @override
  void onInit() {
    super.onInit();
    pinController = TextEditingController();
    focusNode = FocusNode();
    formKey = GlobalKey<FormState>();
    pinError = RxString('');
    isResendEnabled = true.obs; // Initially, resend is enabled
    resendDelayInSeconds = 90.obs; // 1.5 minutes
  }

  void clearInput() {
    pinController.clear();
    pinError.value = '';
  }

  bool validatePin() {
    if (pinController.text.isNotEmpty) {
      if (pinController.text == '1234') {
        pinError.value = '';
        return true; // OTP is valid
      } else {
        pinError.value = 'Incorrect OTP';
      }
    }
    return false; // OTP is invalid
  }

  void startResendTimer() {
    if (isResendEnabled.value) {
      isResendEnabled.value = false; // Disable resend button
      resendDelayInSeconds = 90.obs; // Reset the timer to 90 seconds
      _resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (resendDelayInSeconds == 0) {
          timer.cancel();
          isResendEnabled.value = true; // Enable resend button after timer is done
        } else {
          resendDelayInSeconds--;
        }
      });
    }
  }

  String getFormattedTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minutesString = minutes.toString().padLeft(2, '');
    String secondsString = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesString:$secondsString';
  }

  @override
  void onClose() {
    _resendTimer.cancel(); // Cancel timer to avoid memory leaks
    super.onClose();
  }
}

class PinputOTP extends StatelessWidget {
  final PinputOTPController pinPutOTPController = Get.put(PinputOTPController());

  @override
  Widget build(BuildContext context) {
    var fillColor = AppColors.whiteColor.withOpacity(0.1);
    const borderColor = Colors.transparent;

    final defaultPinTheme = PinTheme(
      width: 64,
      height: 72,
      textStyle: TextStyle(fontSize: 28, color: AppColors.titleDark, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: borderColor),
      ),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: pinPutOTPController.pinController,
        focusNode: pinPutOTPController.focusNode,
        androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
        listenForMultipleSmsOnAndroid: true,
        defaultPinTheme: defaultPinTheme,
        separatorBuilder: (index) => const SizedBox(width: 8),
        validator: (value) {
          return pinPutOTPController.pinError.value;
        },
        onClipboardFound: (value) {
          debugPrint('onClipboardFound: $value');
          pinPutOTPController.pinController.text = value;
        },
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onCompleted: (pin) {
          debugPrint('onCompleted: $pin');
          pinPutOTPController.validatePin();
        },
        onChanged: (value) {
          debugPrint('onChanged: $value');
        },
        cursor: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 2,
              height: 25,
              color: AppColors.titleDark.withOpacity(1),
            ),
          ],
        ),
        // focusedPinTheme: defaultPinTheme.copyWith(
        //   decoration: defaultPinTheme.decoration!.copyWith(
        //     border: Border.all(color: Colors.transparent),
        //   ),
        // ),
        // submittedPinTheme: defaultPinTheme.copyWith(
        //   decoration: defaultPinTheme.decoration!.copyWith(
        //     border: Border.all(color: Colors.transparent),
        //   ),
        // ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
