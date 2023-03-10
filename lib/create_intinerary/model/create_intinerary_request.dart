class CreateIntineraryRequest {
  List<String>? destination;
  String? title;
  String? summary;
  int? cost;
  int? tripCost;
  List<String>? tripType;
  int? totalDays;
  int? step;
  List<Days>? days;
  List<String>? checklist;
  String? profileImg;
  String? userName;
  bool? live;


  CreateIntineraryRequest(
      {this.destination,
        this.profileImg,
        this.userName,
        this.title,
        this.summary,
        this.cost,
        this.tripCost,
        this.tripType,
        this.totalDays,
        this.step,
        this.checklist,
        this.days,
        this.live,
      });

  CreateIntineraryRequest.fromJson(Map<String, dynamic> json) {
    destination = json['destination'].cast<String>();
    checklist = json['checklist'].cast<String>();
    title = json['title'];
    userName = json['userName'];
    live = json['live'];
    profileImg = json['profileImg'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['destination'] = this.destination;
    data['live'] = this.live;
    data['checklist'] = this.checklist;
    data['title'] = this.title;
    data['userName'] = this.userName;
    data['summary'] = this.summary;
    data['cost'] = this.cost;
    data['tripCost'] = this.tripCost;
    data['tripType'] = this.tripType;
    data['totalDays'] = this.totalDays;
    data['step'] = this.step;
    data['profileImg'] = this.profileImg;
    if (this.days != null) {
      data['days'] = this.days!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Days {
  String? country;
  String? airport;
  List<String>? transportation;
  List<Accomodation>? accomodation;
  List<String>? activities;
  Breakfast? breakfast;
  Breakfast? lunch;
  Breakfast? dinner;
  Breakfast? coffeeClubsLounges;
  Breakfast? marketMallsStores;

  Days(
      {this.country,
        this.airport,
        this.transportation,
        this.accomodation,
        this.activities,
        this.breakfast,
        this.lunch,
        this.dinner,
        this.coffeeClubsLounges,
        this.marketMallsStores
      });

  Days.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    airport = json['airport'];
    transportation = json['transportation'].cast<String>();
    if (json['accomodation'] != null) {
      accomodation = <Accomodation>[];
      json['accomodation'].forEach((v) {
        accomodation!.add(new Accomodation.fromJson(v));
      });
    }
    activities = json['activities'].cast<String>();
    breakfast = json['breakfast'] != null
        ? new Breakfast.fromJson(json['breakfast'])
        : null;
    lunch =
    json['lunch'] != null ? new Breakfast.fromJson(json['lunch']) : null;
    dinner =
    json['dinner'] != null ? new Breakfast.fromJson(json['dinner']) : null;
    coffeeClubsLounges = json['coffeeClubsLounges'] != null
        ? new Breakfast.fromJson(json['coffeeClubsLounges'])
        : null;
    marketMallsStores = json['marketMallsStores'] != null
        ? new Breakfast.fromJson(json['marketMallsStores'])
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

class Accomodation {
  String? name;
  Location? location;
  int? num;

  Accomodation({this.name, this.location, this.num});

  Accomodation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    num = json['num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['num'] = this.num;
    return data;
  }
}

class Location {
  List<double>? coordinates;

  Location({this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Breakfast {
  String? name;
  Location? location;
  List<String>? images;
  List<String>? imagesPublic;
  String? coupon;
  int? rating;
  String? comments;

  Breakfast(
      {this.name,
        this.location,
        this.images,
        this.imagesPublic,
        this.coupon,
        this.rating,
        this.comments});

  Breakfast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
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
