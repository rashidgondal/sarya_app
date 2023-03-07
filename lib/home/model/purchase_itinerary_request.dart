class PurchaseItineraryRequest {
  Itinerary? itinerary;

  PurchaseItineraryRequest({this.itinerary});

  PurchaseItineraryRequest.fromJson(Map<String, dynamic> json) {
    itinerary = json['itinerary'] != null
        ? new Itinerary.fromJson(json['itinerary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itinerary != null) {
      data['itinerary'] = this.itinerary!.toJson();
    }
    return data;
  }
}

class Itinerary {
  String? sId;
  String? userName;

  Itinerary({this.sId, this.userName});

  Itinerary.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userName'] = this.userName;
    return data;
  }
}
