class CountryResponse {
  String? name;
  String? tel;
  String? code;
  String? nationality;

  CountryResponse({this.name, this.tel, this.code, this.nationality});

  CountryResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    tel = json['tel'];
    code = json['code'];
    nationality = json['nationality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['tel'] = tel;
    data['code'] = code;
    data['nationality'] = nationality;
    return data;
  }
}
