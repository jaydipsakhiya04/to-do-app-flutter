class UserData {
  String? address;
  String? city;
  int? dob;
  String? email;
  String? countryCode;
  int? id;
  String? leagelName;
  String? nickName;
  String? phone;
  String? profileimage;
  String? country;
  String? currency;
  String? socialSecurityNumber;
  String? qr;
  String? state;
  String? token;
  String? securityCode;
  bool? userExist;
  bool? deceased;
  bool? minor;
  String? reasons;

  UserData(
      {this.address,
      this.city,
      this.dob,
      this.email,
      this.userExist,
      this.countryCode,
      this.socialSecurityNumber,
      this.country,
      this.currency,
      this.id,
      this.leagelName,
      this.nickName,
      this.phone,
      this.profileimage,
      this.qr,
      this.state,
      this.reasons,
      this.securityCode,
      this.deceased,
      this.minor,
      this.token});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      address: json['address'],
      countryCode: json['countryCode'],
      currency: json['currency'],
      socialSecurityNumber: json['socialSecurityNumber'],
      country: json['country'],
      minor: json['minor'],
      city: json['city'],
      dob: json['dob'],
      email: json['email'],
      userExist: json['userExist'],
      deceased: json['deceased'],
      id: json['id'],
      leagelName: json['leagelName'],
      nickName: json['nickName'],
      phone: json['phone'],
      profileimage: json['profileimage'],
      qr: json['qr'],
      state: json['state'],
      securityCode: json['securityCode'],
      reasons: json['reasons'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dob != null) data['dob'] = dob;
    if (countryCode != null) data['countryCode'] = countryCode;
    if (country != null) data['country'] = country;
    if (currency != null) data['currency'] = currency;
    if (socialSecurityNumber != null) data['socialSecurityNumber'] = socialSecurityNumber;
    if (userExist != null) data['userExist'] = userExist;
    if (minor != null) data['minor'] = minor;
    if (deceased != null) data['deceased'] = deceased;
    if (id != null) data['id'] = id;
    if (nickName != null) data['nickName'] = nickName;
    if (phone != null) data['phone'] = phone;
    if (token != null) data['token'] = token;
    if (address != null) data['address'] = address;
    if (securityCode != null) data['securityCode'] = securityCode;
    if (reasons != null) {
      data['reasons'] = reasons;
    }
    if (city != null) {
      data['city'] = city;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (leagelName != null) {
      data['leagelName'] = leagelName;
    }
    if (profileimage != null) {
      data['profileimage'] = profileimage;
    }
    if (qr != null) {
      data['qr'] = qr;
    }
    if (state != null) {
      data['state'] = state;
    }
    return data;
  }
}
