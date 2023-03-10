class StartRequest {
  StartItinerary? itinerary;

  StartRequest({this.itinerary});

  StartRequest.fromJson(Map<String, dynamic> json) {
    itinerary = json['itinerary'] != null
        ? new StartItinerary.fromJson(json['itinerary'])
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

class StartItinerary {
  String? sId;
  bool? active;

  StartItinerary({this.sId, this.active});

  StartItinerary.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['active'] = this.active;
    return data;
  }
}
