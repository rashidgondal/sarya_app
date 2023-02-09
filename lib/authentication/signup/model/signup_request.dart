class SignupRequest {
  String? userName;
  String? password;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? birthday;
  String? nationality;
  String? country;
  String? phone;
  String? telCode;
  String? hobbies;
  String? favCountry;
  String? extraInfo;
  String? avatar;
  BankDetails? bankDetails;

  SignupRequest(
      {this.userName,
        this.password,
        this.email,
        this.firstName,
        this.lastName,
        this.gender,
        this.birthday,
        this.nationality,
        this.country,
        this.phone,
        this.telCode,
        this.hobbies,
        this.favCountry,
        this.extraInfo,
        this.avatar,
        this.bankDetails});

  SignupRequest.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    password = json['password'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    birthday = json['birthday'];
    nationality = json['nationality'];
    country = json['country'];
    phone = json['phone'];
    telCode = json['telCode'];
    hobbies = json['hobbies'];
    favCountry = json['favCountry'];
    extraInfo = json['extraInfo'];
    avatar = json['avatar'];
    bankDetails = json['bankDetails'] != null
        ? new BankDetails.fromJson(json['bankDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['nationality'] = this.nationality;
    data['country'] = this.country;
    data['phone'] = this.phone;
    data['telCode'] = this.telCode;
    data['hobbies'] = this.hobbies;
    data['favCountry'] = this.favCountry;
    data['extraInfo'] = this.extraInfo;
    data['avatar'] = this.avatar;
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
