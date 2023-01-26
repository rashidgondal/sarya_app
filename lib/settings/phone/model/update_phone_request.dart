class UpdatePhoneRequest {
  String? phone;
  String? telCode;

  UpdatePhoneRequest({this.phone, this.telCode});

  UpdatePhoneRequest.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    telCode = json['telCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['telCode'] = this.telCode;
    return data;
  }
}
