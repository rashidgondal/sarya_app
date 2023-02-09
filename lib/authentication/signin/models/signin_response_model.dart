class SignInResponse {
  String? token;
  String? email;
  String? userName;
  String? firstName;
  String? lastName;
  String? phone;
  String? telCode;
  String? gender;
  String? nationality;
  String? country;
  String? favCountry;
  String? avatar;
  String? hobbies;
  String? extraInfo;
  BankDetails? bankDetails;

  SignInResponse(
      {this.token,
        this.email,
        this.userName,
        this.firstName,
        this.lastName,
        this.phone,
        this.telCode,
        this.gender,
        this.nationality,
        this.country,
        this.favCountry,
        this.avatar,
        this.hobbies,
        this.extraInfo,
        this.bankDetails});

  SignInResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['email'];
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    telCode = json['telCode'];
    gender = json['gender'];
    nationality = json['nationality'];
    country = json['country'];
    favCountry = json['favCountry'];
    avatar = json['avatar'];
    hobbies = json['hobbies'];
    extraInfo = json['extraInfo'];
    bankDetails = json['bankDetails'] != null
        ? new BankDetails.fromJson(json['bankDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['email'] = this.email;
    data['userName'] = this.userName;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['telCode'] = this.telCode;
    data['gender'] = this.gender;
    data['nationality'] = this.nationality;
    data['country'] = this.country;
    data['favCountry'] = this.favCountry;
    data['avatar'] = this.avatar;
    data['hobbies'] = this.hobbies;
    data['extraInfo'] = this.extraInfo;
    if (this.bankDetails != null) {
      data['bankDetails'] = this.bankDetails!.toJson();
    }
    return data;
  }
}

class BankDetails {
  String? country;
  String? name;
  String? beneficiary;
  String? accountNo;
  String? iban;
  String? swiftCode;

  BankDetails(
      {this.country,
        this.name,
        this.beneficiary,
        this.accountNo,
        this.iban,
        this.swiftCode});

  BankDetails.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    name = json['name'];
    beneficiary = json['beneficiary'];
    accountNo = json['accountNo'];
    iban = json['iban'];
    swiftCode = json['swiftCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['name'] = this.name;
    data['beneficiary'] = this.beneficiary;
    data['accountNo'] = this.accountNo;
    data['iban'] = this.iban;
    data['swiftCode'] = this.swiftCode;
    return data;
  }
}
