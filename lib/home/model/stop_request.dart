class StopRequest {
  StopItinerary? itinerary;

  StopRequest({this.itinerary});

  StopRequest.fromJson(Map<String, dynamic> json) {
    itinerary = json['itinerary'] != null
        ? new StopItinerary.fromJson(json['itinerary'])
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

class StopItinerary {
  String? sId;
  bool? active;
  int? day;

  StopItinerary({this.sId, this.active, this.day});

  StopItinerary.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    active = json['active'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['active'] = this.active;
    data['day'] = this.day;
    return data;
  }
}
