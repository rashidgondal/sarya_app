class UpdateBirthdayRequest {
  String? birthday;

  UpdateBirthdayRequest({this.birthday});

  UpdateBirthdayRequest.fromJson(Map<String, dynamic> json) {
    birthday = json['birthday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthday'] = this.birthday;
    return data;
  }
}
