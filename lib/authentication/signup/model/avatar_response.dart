class AvatarResponse {
  String? sId;
  String? baseUrl;
  List<Avatars>? avatars;
  String? format;

  AvatarResponse({this.sId, this.baseUrl, this.avatars, this.format});

  AvatarResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    baseUrl = json['baseUrl'];
    if (json['avatars'] != null) {
      avatars = <Avatars>[];
      json['avatars'].forEach((v) {
        avatars!.add(Avatars.fromJson(v));
      });
    }
    format = json['format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['baseUrl'] = baseUrl;
    if (avatars != null) {
      data['avatars'] = avatars!.map((v) => v.toJson()).toList();
    }
    data['format'] = format;
    return data;
  }
}

class Avatars {
  String? name;
  List<String>? colors;

  Avatars({this.name, this.colors});

  Avatars.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    colors = json['colors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['colors'] = colors;
    return data;
  }
}
