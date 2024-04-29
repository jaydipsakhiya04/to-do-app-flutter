import 'dart:convert';
import 'dart:developer';

import 'package:flutter_template/api/api.dart';
import 'package:flutter_template/api/responce_handler.dart';
import 'package:flutter_template/modules/authentication/models/signin_form_data.dart';
import 'package:flutter_template/modules/authentication/models/signup_form_data.dart';
import 'package:flutter_template/modules/authentication/models/user_data_response.dart';
import 'package:flutter_template/utils/api_constants.dart';

class AuthService {
  static Future signUp(SignUpFormData request) async {
    try {
      var result = await Api().post(ApiConstants.signUp, bodyData: request.toJson());
      log("status: ${result.statusCode} body:${result.body}");
      await ResponseHandler.checkResponseError(result);
      return UserDataResponse.fromJson(jsonDecode(utf8.decode(result.bodyBytes))["apiresponse"]).data?.userExist ?? false;
    } catch (e) {
      log("error : E $e");
      rethrow;
    }
  }

  static Future signIn(SignInFormData request) async {
    try {
      var result = await Api().post(ApiConstants.signIn, bodyData: request.toJson());
      log("status: ${result.statusCode} body:${result.body}");
      await ResponseHandler.checkResponseError(result);
    } catch (e) {
      log("error : E $e");
      rethrow;
    }
  }
}
