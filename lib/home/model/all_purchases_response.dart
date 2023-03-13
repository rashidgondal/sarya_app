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
        this.totalActive});

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
  String? title;
  List<String>? destination;
  String? profileImg;
  int? totalDays;

  Created(
      {this.sId,
        this.title,
        this.destination,
        this.profileImg,
        this.totalDays});

  Created.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    destination = json['destination'].cast<String>();
    profileImg = json['profileImg'];
    totalDays = json['totalDays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['destination'] = this.destination;
    data['profileImg'] = this.profileImg;
    data['totalDays'] = this.totalDays;
    return data;
  }
}

class Purchased {
  String? sId;
  String? title;
  List<String>? destination;
  String? profileImg;
  int? totalDays;

  Purchased(
      {this.sId,
        this.title,
        this.destination,
        this.profileImg,
        this.totalDays});

  Purchased.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    destination = json['destination'].cast<String>();
    profileImg = json['profileImg'];
    totalDays = json['totalDays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['destination'] = this.destination;
    data['profileImg'] = this.profileImg;
    data['totalDays'] = this.totalDays;
    return data;
  }
}


class Active {
  String? sId;
  List<String>? destination;
  String? title;
  int? totalDays;
  String? profileImg;

  Active(
      {this.sId,
        this.destination,
        this.title,
        this.totalDays,
        this.profileImg});

  Active.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    destination = json['destination'].cast<String>();
    title = json['title'];
    totalDays = json['totalDays'];
    profileImg = json['profileImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['destination'] = this.destination;
    data['title'] = this.title;
    data['totalDays'] = this.totalDays;
    data['profileImg'] = this.profileImg;
    return data;
  }
}

