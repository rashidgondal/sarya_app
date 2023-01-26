class UpdateAvatarRequest {
  String? avatar;

  UpdateAvatarRequest({this.avatar});

  UpdateAvatarRequest.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    return data;
  }
}
