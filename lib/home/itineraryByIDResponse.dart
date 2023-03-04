class ItineraryByIDResponse {
  String? msg;
  ByIDResult? result;

  ItineraryByIDResponse({this.msg, this.result});

  ItineraryByIDResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    result =
    json['result'] != null ? new ByIDResult.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class ByIDResult {
  String? sId;
  String? userName;
  List<String>? destination;
  String? title;
  String? summary;
  int? cost;
  int? tripCost;
  List<String>? tripType;
  int? totalDays;
  List<String>? checklist;
  String? profileImg;
  int? step;
  bool? live;
  List<ByIDDays>? days;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ByIDResult(
      {this.sId,
        this.userName,
        this.destination,
        this.title,
        this.summary,
        this.cost,
        this.tripCost,
        this.tripType,
        this.totalDays,
        this.checklist,
        this.profileImg,
        this.step,
        this.live,
        this.days,
        this.createdAt,
        this.updatedAt,
        this.iV});

  ByIDResult.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    destination = json['destination'].cast<String>();
    title = json['title'];
    summary = json['summary'];
    cost = json['cost'];
    tripCost = json['tripCost'];
    tripType = json['tripType'].cast<String>();
    totalDays = json['totalDays'];
    checklist = json['checklist'].cast<String>();
    profileImg = json['profileImg'];
    step = json['step'];
    live = json['live'];
    if (json['days'] != null) {
      days = <ByIDDays>[];
      json['days'].forEach((v) {
        days!.add(new ByIDDays.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
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
    data['checklist'] = this.checklist;
    data['profileImg'] = this.profileImg;
    data['step'] = this.step;
    data['live'] = this.live;
    if (this.days != null) {
      data['days'] = this.days!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class ByIDDays {
  String? country;
  String? airport;
  List<String>? transportation;
  List<ByIDAccomodation>? accomodation;
  List<String>? activities;
  ByIDBreakfast? breakfast;
  ByIDBreakfast? lunch;
  ByIDBreakfast? dinner;
  ByIDBreakfast? coffeeClubsLounges;
  ByIDBreakfast? marketMallsStores;

  ByIDDays(
      {this.country,
        this.airport,
        this.transportation,
        this.accomodation,
        this.activities,
        this.breakfast,
        this.lunch,
        this.dinner,
        this.coffeeClubsLounges,
        this.marketMallsStores});

  ByIDDays.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    airport = json['airport'];
    transportation = json['transportation'].cast<String>();
    if (json['accomodation'] != null) {
      accomodation = <ByIDAccomodation>[];
      json['accomodation'].forEach((v) {
        accomodation!.add(new ByIDAccomodation.fromJson(v));
      });
    }
    activities = json['activities'].cast<String>();
    breakfast = json['breakfast'] != null
        ? new ByIDBreakfast.fromJson(json['breakfast'])
        : null;
    lunch =
    json['lunch'] != null ? new ByIDBreakfast.fromJson(json['lunch']) : null;
    dinner =
    json['dinner'] != null ? new ByIDBreakfast.fromJson(json['dinner']) : null;
    coffeeClubsLounges = json['coffeeClubsLounges'] != null
        ? new ByIDBreakfast.fromJson(json['coffeeClubsLounges'])
        : null;
    marketMallsStores = json['marketMallsStores'] != null
        ? new ByIDBreakfast.fromJson(json['marketMallsStores'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['airport'] = this.airport;
    data['transportation'] = this.transportation;
    if (this.accomodation != null) {
      data['accomodation'] = this.accomodation!.map((v) => v.toJson()).toList();
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
    if (this.coffeeClubsLounges != null) {
      data['coffeeClubsLounges'] = this.coffeeClubsLounges!.toJson();
    }
    if (this.marketMallsStores != null) {
      data['marketMallsStores'] = this.marketMallsStores!.toJson();
    }
    return data;
  }
}

class ByIDAccomodation {
  String? name;
  ByIDLocation? location;

  ByIDAccomodation({this.name, this.location});

  ByIDAccomodation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'] != null
        ? new ByIDLocation.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class ByIDLocation {
  String? type;
  List<double>? coordinates;

  ByIDLocation({this.type, this.coordinates});

  ByIDLocation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class ByIDBreakfast {
  String? name;
  ByIDLocation? location;
  List<String>? images;
  List<String>? imagesPublic;
  String? coupon;
  int? rating;
  String? comments;

  ByIDBreakfast(
      {this.name,
        this.location,
        this.images,
        this.imagesPublic,
        this.coupon,
        this.rating,
        this.comments});

  ByIDBreakfast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'] != null
        ? new ByIDLocation.fromJson(json['location'])
        : null;
    images = json['images'].cast<String>();
    imagesPublic = json['imagesPublic'].cast<String>();
    coupon = json['coupon'];
    rating = json['rating'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['images'] = this.images;
    data['imagesPublic'] = this.imagesPublic;
    data['coupon'] = this.coupon;
    data['rating'] = this.rating;
    data['comments'] = this.comments;
    return data;
  }
}