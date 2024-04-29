import 'dart:convert';

import 'package:flutter_template/api/exception/app_exception.dart';
import 'package:flutter_template/api/exception/error_response.dart';
import 'package:http/http.dart' as http;

class ResponseHandler {
  static Future<void> checkResponseError(http.Response response, {bool showException = true}) async {
    switch (response.statusCode) {
      case 200:
        return;
      case 201:
        return;
      case 400:
        ErrorResponse error = ErrorResponse.fromJson(jsonDecode(response.body));
        print('error :${error.message}');
        var exception = AppException(
          message: error.message ?? "Something went wrong..!",
          errorCode: 400,
        );
        if (showException) exception.show();
        throw exception;
      case 401:
        ErrorResponse error = ErrorResponse.fromJson(jsonDecode(response.body));
        throw AppException(
          message: error.message ?? "Something went wrong..!",
          errorCode: 401,
        );
      case 500:
        ErrorResponse error = ErrorResponse.fromJson(jsonDecode(response.body));
        print('error :${error.message}');
        var exception = AppException(
          message: error.message ?? "Something went wrong..!",
          errorCode: 500,
        );
        if (showException) exception.show();
        throw exception;
      case 406:
        ErrorResponse error = ErrorResponse.fromJson(jsonDecode(response.body));
        throw AppException(
          message: error.message ?? "Something went wrong..!",
          errorCode: 406,
        );
      case 402:
        ErrorResponse error = ErrorResponse.fromJson(jsonDecode(response.body));
        throw AppException(
          message: error.message ?? "Something went wrong..!",
          errorCode: 402,
        );
      case 409:
        ErrorResponse error = ErrorResponse.fromJson(jsonDecode(response.body));
        throw AppException(
          message: error.message ?? "Something went wrong..!",
          errorCode: 409,
        );
      default:
        print(response.body.toString());
        ErrorResponse error = ErrorResponse.fromJson(jsonDecode(response.body));
        var exception = AppException(
          message: error.message ?? "Something went wrong..!",
          errorCode: response.statusCode,
        );
        if (showException) exception.show();
        throw exception;
    }
  }
}
