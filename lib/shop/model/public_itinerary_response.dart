class PublicItineraryResponse {
  String? resource;
  List<PublicResult>? result;
  int? totalCount;

  PublicItineraryResponse({this.resource, this.result, this.totalCount});

  PublicItineraryResponse.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    if (json['result'] != null) {
      result = <PublicResult>[];
      json['result'].forEach((v) {
        result!.add(new PublicResult.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resource'] = this.resource;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class PublicResult {
  String? sId;
  String? userName;
  List? destination;
  String? title;
  String? summary;
  int? cost;
  int? tripCost;
  List? tripType;
  int? totalDays;
  int? step;
  List<Days>? days;
  String? createdAt;
  String? updatedAt;
  int? iV;
  bool? live;
  List? checklist;
  String? profileImg;


  PublicResult(
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
        this.live,
        this.checklist});

  PublicResult.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    profileImg = json['profileImg'];
    destination = json['destination'];
    title = json['title'];
    summary = json['summary'];
    cost = json['cost'];
    tripCost = json['tripCost'];
    tripType = json['tripType'];
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
    live = json['live'];
    checklist = json['checklist'];
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
    data['checklist'] = this.checklist;
    data['profileImg'] = this.profileImg;
    return data;
  }
}

class Days {
  String? country;
  String? airport;
 List? transportation;
 Accomodation? accomodation;
 List? activities;
  Breakfast? breakfast;
  Breakfast? lunch;
  Breakfast? dinner;
  String? shops;
  String? market;
  CoffeeClubsLounges? coffeeClubsLounges;
  CoffeeClubsLounges? marketMallsStores;

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
        this.market,
        this.coffeeClubsLounges,
        this.marketMallsStores});

  Days.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    airport = json['airport'];
    transportation = json['transportation'];
    accomodation = json['accomodation'] != null && json['accomodation'] is Map
        ? new Accomodation.fromJson(json['accomodation'])
        : null;
    activities = json['activities'];
    breakfast = json['breakfast'] != null
        ? new Breakfast.fromJson(json['breakfast'])
        : null;
    lunch =
    json['lunch'] != null ? new Breakfast.fromJson(json['lunch']) : null;
    dinner =
    json['dinner'] != null ? new Breakfast.fromJson(json['dinner']) : null;
    shops = json['shops'];
    market = json['market'];
    coffeeClubsLounges = json['coffeeClubsLounges'] != null
        ? new CoffeeClubsLounges.fromJson(json['coffeeClubsLounges'])
        : null;
    marketMallsStores = json['marketMallsStores'] != null
        ? new CoffeeClubsLounges.fromJson(json['marketMallsStores'])
        : null;
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
 List? imagesPublic;
  String? coupon;
  int? rating;
  String? comments;
  Location? location;

  Breakfast(
      {this.name,
        this.coordinates,
        this.imagesPublic,
        this.coupon,
        this.rating,
        this.comments,
        this.location});

  Breakfast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    coordinates = json['coordinates'];
    imagesPublic = json['imagesPublic'];
    coupon = json['coupon'];
    rating = json['rating'];
    comments = json['comments'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['coordinates'] = this.coordinates;
    data['imagesPublic'] = this.imagesPublic;
    data['coupon'] = this.coupon;
    data['rating'] = this.rating;
    data['comments'] = this.comments;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
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

class CoffeeClubsLounges {
  String? name;
 List? images;
 List? imagesPublic;
  String? coupon;
  int? rating;
  String? comments;
  Location? location;

  CoffeeClubsLounges(
      {this.name,
        this.images,
        this.imagesPublic,
        this.coupon,
        this.rating,
        this.comments,
        this.location});

  CoffeeClubsLounges.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    images = json['images'];
    imagesPublic = json['imagesPublic'];
    coupon = json['coupon'];
    rating = json['rating'];
    comments = json['comments'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['images'] = this.images;
    data['imagesPublic'] = this.imagesPublic;
    data['coupon'] = this.coupon;
    data['rating'] = this.rating;
    data['comments'] = this.comments;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}
