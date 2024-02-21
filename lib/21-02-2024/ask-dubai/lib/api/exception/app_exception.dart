import 'dart:io';

import 'package:local/widget/app_snackbar.dart';

class AppException implements Exception {
  //un_known error code -> 0

  late final String message;
  final String? tag;
  final int errorCode;

  AppException({required this.message, required this.errorCode, this.tag});

  int getErrorCode() => errorCode;

  String getMessage() => message;

  String getMessageWithTag() => "${tag ?? 'No Tag'} : $message";

  String? getTag() => tag;

  @override
  String toString() {
    return "${errorCode.toString()} : ${tag ?? 'No Tag'} : $message";
  }

  static showException(dynamic exception, [dynamic stackTrace]) {
    if (exception is AppException) {
      AppException(
        errorCode: exception.errorCode,
        message: exception.message,
      ).show();
    } else if (exception is SocketException) {
      AppException(
        errorCode: exception.osError?.errorCode ?? 0,
        message: exception.osError?.message ?? "Internet is not Available",
      ).show();
    } else if (exception is HttpException) {
      AppException(message: "Couldn't find the requested data", errorCode: 0).show();
    } else if (exception is FormatException) {
      AppException(message: exception.message, errorCode: 0).show();
    } else {
      AppException(message: "Something went wrong", errorCode: 0).show();
    }
  }

  void show() {
    AppSnackBar.showErrorSnackBar(message: message, title: 'Error');
  }
}
