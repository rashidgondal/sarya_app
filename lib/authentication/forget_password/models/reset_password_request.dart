class ResetPasswordRequest {
  int? pwdResetCode;
  String? email;
  String? password;

  ResetPasswordRequest({this.pwdResetCode, this.email, this.password});

  ResetPasswordRequest.fromJson(Map<String, dynamic> json) {
    pwdResetCode = json['pwdResetCode'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pwdResetCode'] = pwdResetCode;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
