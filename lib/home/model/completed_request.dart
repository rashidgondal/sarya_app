class CompletedRequest {
  CompletedItinerary? itinerary;

  CompletedRequest({this.itinerary});

  CompletedRequest.fromJson(Map<String, dynamic> json) {
    itinerary = json['itinerary'] != null
        ? new CompletedItinerary.fromJson(json['itinerary'])
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

class CompletedItinerary {
  String? sId;
  bool? completed;

  CompletedItinerary({this.sId, this.completed});

  CompletedItinerary.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['completed'] = this.completed;
    return data;
  }
}
