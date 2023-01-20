class SignInResponse {
  String? token;
  String? email;
  String? userName;
  String? firstName;
  String? lastName;
  String? phone;
  String? gender;
  String? nationality;
  String? country;
  String? favCountry;
  String? avatar;
  String? hobbies;
  String? extraInfo;

  SignInResponse(
      {this.token,
        this.email,
        this.userName,
        this.firstName,
        this.lastName,
        this.phone,
        this.gender,
        this.nationality,
        this.country,
        this.favCountry,
        this.avatar,
        this.hobbies,
        this.extraInfo});

  SignInResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['email'];
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    gender = json['gender'];
    nationality = json['nationality'];
    country = json['country'];
    favCountry = json['favCountry'];
    avatar = json['avatar'];
    hobbies = json['hobbies'];
    extraInfo = json['extraInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['email'] = this.email;
    data['userName'] = this.userName;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['nationality'] = this.nationality;
    data['country'] = this.country;
    data['favCountry'] = this.favCountry;
    data['avatar'] = this.avatar;
    data['hobbies'] = this.hobbies;
    data['extraInfo'] = this.extraInfo;
    return data;
  }
}
