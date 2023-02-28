class SummaryUpdateIntineraryRequest {
  int? step;
  bool? live;

  SummaryUpdateIntineraryRequest(
      {this.step,
        this.live,});

  SummaryUpdateIntineraryRequest.fromJson(Map<String, dynamic> json) {
    step = json['step'];
    live = json['live'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step'] = this.step;
    data['live'] = this.live;
    return data;
  }
}

