class SoldAllItinerariesResponse {
  String? msg;
  List<SoldAllResult>? result;

  SoldAllItinerariesResponse({this.msg, this.result});

  SoldAllItinerariesResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['result'] != null) {
      result = <SoldAllResult>[];
      json['result'].forEach((v) {
        result!.add(new SoldAllResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SoldAllResult {
  String? sId;
  String? title;
  String? destination;
  String? profileImg;
  int? totalPurchases;
  int? totalRevenue;

  SoldAllResult(
      {this.sId,
        this.title,
        this.destination,
        this.profileImg,
        this.totalPurchases,
        this.totalRevenue});

  SoldAllResult.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    destination = json['destination'];
    profileImg = json['profileImg'];
    totalPurchases = json['totalPurchases'];
    totalRevenue = json['totalRevenue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['destination'] = this.destination;
    data['profileImg'] = this.profileImg;
    data['totalPurchases'] = this.totalPurchases;
    data['totalRevenue'] = this.totalRevenue;
    return data;
  }
}
