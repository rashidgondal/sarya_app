class AvatarResponse {
  String? baseUrl;
  String? format;
  String? resource;
  List<AvatarResult>? result;
  int? totalCount;

  AvatarResponse(
      {this.baseUrl, this.format, this.resource, this.result, this.totalCount});

  AvatarResponse.fromJson(Map<String, dynamic> json) {
    baseUrl = json['baseUrl'];
    format = json['format'];
    resource = json['resource'];
    if (json['result'] != null) {
      result = <AvatarResult>[];
      json['result'].forEach((v) {
        result!.add(new AvatarResult.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['baseUrl'] = this.baseUrl;
    data['format'] = this.format;
    data['resource'] = this.resource;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class AvatarResult {
  String? name;
  List<String>? colors;

  AvatarResult({this.name, this.colors});

  AvatarResult.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    colors = json['colors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['colors'] = this.colors;
    return data;
  }
}
