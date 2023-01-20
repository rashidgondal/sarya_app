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
      });

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['password'] = password;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['birthday'] = birthday;
    data['nationality'] = nationality;
    data['country'] = country;
    data['phone'] = phone;
    data['telCode'] = telCode;
    data['hobbies'] = hobbies;
    data['favCountry'] = favCountry;
    data['extraInfo'] = extraInfo;
    data['avatar'] = avatar;
    return data;
  }

  SignupRequest.avatarFromJson(Map<String, dynamic> json){
    avatar = json['avatar'];

  }
}
