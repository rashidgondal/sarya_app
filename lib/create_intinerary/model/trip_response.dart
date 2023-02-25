class TripResponse {
  String? resource;
  List<String>? result;
  int? totalCount;

  TripResponse({this.resource, this.result, this.totalCount});

  TripResponse.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    result = json['result'].cast<String>();
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resource'] = this.resource;
    data['result'] = this.result;
    data['totalCount'] = this.totalCount;
    return data;
  }
}
