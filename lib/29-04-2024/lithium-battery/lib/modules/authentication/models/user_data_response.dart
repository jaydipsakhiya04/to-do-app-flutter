import 'package:flutter_template/modules/authentication/models/user_data.dart';

class UserDataResponse {
  UserData? data;

  UserDataResponse({this.data});

  factory UserDataResponse.fromJson(Map<String, dynamic> json) {
    return UserDataResponse(
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}
