class AllItineraryResponse {
  String? msg;
  List<AllItineraryResult>? result;
  int? totalCount;

  AllItineraryResponse({this.msg, this.result, this.totalCount});

  AllItineraryResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['result'] != null) {
      result = <AllItineraryResult>[];
      json['result'].forEach((v) {
        result!.add(new AllItineraryResult.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class AllItineraryResult {
  String? sId;
  String? userName;
  List<String>? destination;
  String? title;
  String? summary;
  int? cost;
  int? tripCost;
  List<String>? tripType;
  int? totalDays;
  int? step;
  List<Days>? days;
  String? createdAt;
  String? updatedAt;
  int? iV;
  bool? live;
  String? profileImg;


  AllItineraryResult(
      {this.sId,
        this.userName,
        this.profileImg,
        this.destination,
        this.title,
        this.summary,
        this.cost,
        this.tripCost,
        this.tripType,
        this.totalDays,
        this.step,
        this.days,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.live});

  AllItineraryResult.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    destination = json['destination'].cast<String>();
    title = json['title'];
    summary = json['summary'];
    cost = json['cost'];
    tripCost = json['tripCost'];
    tripType = json['tripType'].cast<String>();
    totalDays = json['totalDays'];
    step = json['step'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(new Days.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    profileImg = json['profileImg'];
    live = json['live'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userName'] = this.userName;
    data['destination'] = this.destination;
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['cost'] = this.cost;
    data['tripCost'] = this.tripCost;
    data['tripType'] = this.tripType;
    data['totalDays'] = this.totalDays;
    data['step'] = this.step;
    if (this.days != null) {
      data['days'] = this.days!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['live'] = this.live;
    data['profileImg'] = this.profileImg;

    return data;
  }
}

class Days {
  String? country;
  String? airport;
  List<String>? transportation;
  Accomodation? accomodation;
  List<String>? activities;
  Breakfast? breakfast;
  Breakfast? lunch;
  Breakfast? dinner;
  String? shops;
  String? market;

  Days(
      {this.country,
        this.airport,
        this.transportation,
        this.accomodation,
        this.activities,
        this.breakfast,
        this.lunch,
        this.dinner,
        this.shops,
        this.market});

  Days.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    airport = json['airport'];
    transportation = json['transportation'].cast<String>();
    accomodation = json['accomodation'] != null
        ? new Accomodation.fromJson(json['accomodation'])
        : null;
    activities = json['activities'].cast<String>();
    breakfast = json['breakfast'] != null
        ? new Breakfast.fromJson(json['breakfast'])
        : null;
    lunch =
    json['lunch'] != null ? new Breakfast.fromJson(json['lunch']) : null;
    dinner =
    json['dinner'] != null ? new Breakfast.fromJson(json['dinner']) : null;
    shops = json['shops'];
    market = json['market'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['airport'] = this.airport;
    data['transportation'] = this.transportation;
    if (this.accomodation != null) {
      data['accomodation'] = this.accomodation!.toJson();
    }
    data['activities'] = this.activities;
    if (this.breakfast != null) {
      data['breakfast'] = this.breakfast!.toJson();
    }
    if (this.lunch != null) {
      data['lunch'] = this.lunch!.toJson();
    }
    if (this.dinner != null) {
      data['dinner'] = this.dinner!.toJson();
    }
    data['shops'] = this.shops;
    data['market'] = this.market;
    return data;
  }
}

class Accomodation {
  String? name;
  String? coordinates;
  int? num;

  Accomodation({this.name, this.coordinates, this.num});

  Accomodation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    coordinates = json['coordinates'];
    num = json['num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['coordinates'] = this.coordinates;
    data['num'] = this.num;
    return data;
  }
}

class Breakfast {
  String? name;
  String? coordinates;
  List<String>? images;
  List<String>? imagesPublic;
  String? coupon;
  int? rating;
  String? comments;

  Breakfast(
      {this.name,
        this.coordinates,
        this.images,
        this.imagesPublic,
        this.coupon,
        this.rating,
        this.comments});

  Breakfast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    coordinates = json['coordinates'];
    images = json['images'].cast<String>();
    imagesPublic = json['imagesPublic'].cast<String>();
    coupon = json['coupon'];
    rating = json['rating'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['coordinates'] = this.coordinates;
    data['images'] = this.images;
    data['imagesPublic'] = this.imagesPublic;
    data['coupon'] = this.coupon;
    data['rating'] = this.rating;
    data['comments'] = this.comments;
    return data;
  }
}
