class GetAllPurchasesResponse {
  String? msg;
  List<Created>? created;
  List<Purchased>? purchased;
  List<Active>? active;
  int? totalCreated;
  int? totalPurchased;
  int? totalActive;

  GetAllPurchasesResponse(
      {this.msg,
        this.created,
        this.purchased,
        this.active,
        this.totalCreated,
        this.totalPurchased,
        this.totalActive
      });

  GetAllPurchasesResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['created'] != null) {
      created = <Created>[];
      json['created'].forEach((v) {
        created!.add(new Created.fromJson(v));
      });
    }
    if (json['purchased'] != null) {
      purchased = <Purchased>[];
      json['purchased'].forEach((v) {
        purchased!.add(new Purchased.fromJson(v));
      });
    }
    if (json['active'] != null) {
      active = <Active>[];
      json['active'].forEach((v) {
        active!.add(new Active.fromJson(v));
      });
    }
    totalCreated = json['totalCreated'];
    totalPurchased = json['totalPurchased'];
    totalActive = json['totalActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.created != null) {
      data['created'] = this.created!.map((v) => v.toJson()).toList();
    }
    if (this.purchased != null) {
      data['purchased'] = this.purchased!.map((v) => v.toJson()).toList();
    }
    if (this.active != null) {
      data['active'] = this.active!.map((v) => v.toJson()).toList();
    }
    data['totalCreated'] = this.totalCreated;
    data['totalPurchased'] = this.totalPurchased;
    data['totalActive'] = this.totalActive;
    return data;
  }
}

class Created {
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
  List<Days>? days;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Created(
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

  Created.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    if(json['destination'] !!= null) {
      destination = json['destination'].cast<String>();
    }
    title = json['title'];
    summary = json['summary'];
    cost = json['cost'];
    tripCost = json['tripCost'];
    if(json['tripType'] != null) {
      tripType = json['tripType'].cast<String>();
    }
    totalDays = json['totalDays'];
    if(json['checklist'] != null) {
      checklist = json['checklist'].cast<String>();
    }
    profileImg = json['profileImg'];
    step = json['step'];
    live = json['live'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(new Days.fromJson(v));
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
        this.marketMallsStores});

  Days.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    airport = json['airport'];
    if(json['transportation'] != null){
      transportation = json['transportation'].cast<String>();
    }
    if (json['accomodation'] != null) {
      accomodation = <Accomodation>[];
      json['accomodation'].forEach((v) {
        accomodation!.add(new Accomodation.fromJson(v));
      });
    }
    if(json['activities'] != null) {
      activities = json['activities'].cast<String>();
    }
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

  Accomodation({this.name, this.location});

  Accomodation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
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

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if(json['coordinates'] != null) {
      coordinates = json['coordinates'].cast<double>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
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
    if(json['images'] != null) {
      images = json['images'].cast<String>();
    }
    if(json['imagesPublic'] != null){
    imagesPublic = json['imagesPublic'].cast<String>();
    }
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

class Purchased {
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
  List<Days>? days;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Purchased(
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

  Purchased.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    if(json['destination'] != null) {
      destination = json['destination'].cast<String>();
    }
    title = json['title'];
    summary = json['summary'];
    cost = json['cost'];
    tripCost = json['tripCost'];
    if(json['tripType'] != null) {
      tripType = json['tripType'].cast<String>();
    }
    totalDays = json['totalDays'];
    if(json['checklist'] != null) {
      checklist = json['checklist'].cast<String>();
    }
    if(json['profileImg'] != null) {
      profileImg = json['profileImg'];
    }
    step = json['step'];
    live = json['live'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(new Days.fromJson(v));
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

class Active {
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
  List<Days>? days;
  bool? live;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Active(
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
        this.days,
        this.live,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Active.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    if(json['destination'] != null) {
      destination = json['destination'].cast<String>();
    }
    title = json['title'];
    summary = json['summary'];
    cost = json['cost'];
    tripCost = json['tripCost'];
    if(json['tripType'] != null) {
      tripType = json['tripType'].cast<String>();
    }
    totalDays = json['totalDays'];
    if(json['checklist'] != null) {
      checklist = json['checklist'].cast<String>();
    }
    profileImg = json['profileImg'];
    step = json['step'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(new Days.fromJson(v));
      });
    }
    live = json['live'];
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
    if (this.days != null) {
      data['days'] = this.days!.map((v) => v.toJson()).toList();
    }
    data['live'] = this.live;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}