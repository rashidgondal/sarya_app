class SignInRequest {
  String? userName;
  String? password;

  SignInRequest({this.userName, this.password});

  SignInRequest.fromJson(Map<String, dynamic> json) {
    userName = json['login'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['login'] = userName;
    data['password'] = password;
    return data;
  }
}