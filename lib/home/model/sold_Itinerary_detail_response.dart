class SoldItineraryDetailResponse {
  String? msg;
  List<DetailResult>? result;

  SoldItineraryDetailResponse({this.msg, this.result});

  SoldItineraryDetailResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['result'] != null) {
      result = <DetailResult>[];
      json['result'].forEach((v) {
        result!.add(new DetailResult.fromJson(v));
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

class DetailResult {
  String? sId;
  String? owner;
  String? purchaser;
  String? purchaseTime;

  DetailResult({this.sId, this.owner, this.purchaser, this.purchaseTime});

  DetailResult.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    owner = json['owner'];
    purchaser = json['purchaser'];
    purchaseTime = json['purchaseTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['owner'] = this.owner;
    data['purchaser'] = this.purchaser;
    data['purchaseTime'] = this.purchaseTime;
    return data;
  }
}
