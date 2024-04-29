class SignUpFormData {
  const SignUpFormData({
    this.email = '',
    this.password = '',
    this.countryCode = '',
  });

  final String? email;
  final String? password;
  final String? countryCode;

  factory SignUpFormData.fromJson(Map<String, dynamic> json) => SignUpFormData(
        email: json['email'] as String?,
        password: json['password'] as String?,
        countryCode: json['countryCode'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'email': email,
        'password': password,
        if (countryCode != null && countryCode != '') 'countryCode': countryCode,
      };
}
