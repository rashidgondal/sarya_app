import 'dart:core';

class AirportResponse {
  String? name;
  String? iataCode;
  String? icaoCode;
  double? lat;
  double? lng;
  int? alt;
  String? city;
  String? cityCode;
  String? unLocode;
  String? timezone;
  String? countryCode;
  String? phone;
  String? website;
  String? facebook;
  String? instagram;
  String? linkedin;
  String? twitter;
  var names;
  int? runways;
  int? departures;
  int? connections;
  bool? isMajor;
  int? isInternational;
  String? slug;

  AirportResponse({this.name, this.iataCode, this.icaoCode, this.lat, this.lng, this.alt, this.city, this.cityCode, this.unLocode, this.timezone, this.countryCode, this.phone, this.website, this.facebook, this.instagram, this.linkedin, this.twitter, this.names, this.runways, this.departures, this.connections, this.isMajor, this.isInternational, this.slug});

  AirportResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iataCode = json['iata_code'];
    icaoCode = json['icao_code'];
    lat = json['lat'];
    lng = json['lng'];
    alt = json['alt'];
    city = json['city'];
    cityCode = json['city_code'];
    unLocode = json['un_locode'];
    timezone = json['timezone'];
    countryCode = json['country_code'];
    phone = json['phone'];
    website = json['website'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    linkedin = json['linkedin'];
    twitter = json['twitter'];
    names =  null;
    runways = json['runways'];
    departures = json['departures'];
    connections = json['connections'];
    isMajor = json['is_major'];
    isInternational = json['is_international'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['iata_code'] = this.iataCode;
    data['icao_code'] = this.icaoCode;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['alt'] = this.alt;
    data['city'] = this.city;
    data['city_code'] = this.cityCode;
    data['un_locode'] = this.unLocode;
    data['timezone'] = this.timezone;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['website'] = this.website;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['linkedin'] = this.linkedin;
    data['twitter'] = this.twitter;
    if (this.names != null) {
      data['names'] = this.names!.toJson();
    }
    data['runways'] = this.runways;
    data['departures'] = this.departures;
    data['connections'] = this.connections;
    data['is_major'] = this.isMajor;
    data['is_international'] = this.isInternational;
    data['slug'] = this.slug;
    return data;
  }
}


