import 'package:common/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'itinerary_day.g.dart';

@JsonSerializable()
class ItineraryDay extends Equatable {
  const ItineraryDay({
    required this.day,
    this.country,
    this.transportation,
    this.accommodation,
    this.excursion = const [],
    this.breakfast = const [],
    this.lunch = const [],
    this.dinner = const [],
    this.coffeeShops = const [],
    this.markets = const [],
    this.promoCodes,
    this.recommendation,
  });

  factory ItineraryDay.fromJson(Map<String, dynamic> json) =>
      _$ItineraryDayFromJson(json);

  Map<String, dynamic> toJson() => _$ItineraryDayToJson(this);

  final int day;
  final String? country;
  final String? transportation;
  final GeographicLocation? accommodation;
  final List<GeographicLocation> excursion;
  final List<GeographicLocation> breakfast;
  final List<GeographicLocation> lunch;
  final List<GeographicLocation> dinner;
  final List<GeographicLocation> coffeeShops;
  final List<GeographicLocation> markets;
  final String? promoCodes;
  final String? recommendation;

  ItineraryDay copyWith({
    int? day,
    String? country,
    String? transportation,
    GeographicLocation? accommodation,
    List<GeographicLocation>? excursion,
    List<GeographicLocation>? breakfast,
    List<GeographicLocation>? lunch,
    List<GeographicLocation>? dinner,
    List<GeographicLocation>? coffeeShops,
    List<GeographicLocation>? markets,
    String? promoCodes,
    String? recommendation,
  }) {
    return ItineraryDay(
      day: day ?? this.day,
      country: country ?? this.country,
      transportation: transportation ?? this.transportation,
      accommodation: isGeographicLocationNone(accommodation)
          ? null
          : accommodation ?? this.accommodation,
      excursion: excursion ?? this.excursion,
      breakfast: breakfast ?? this.breakfast,
      lunch: lunch ?? this.lunch,
      dinner: dinner ?? this.dinner,
      coffeeShops: coffeeShops ?? this.coffeeShops,
      markets: markets ?? this.markets,
      promoCodes: promoCodes ?? this.promoCodes,
      recommendation: recommendation ?? this.recommendation,
    );
  }

  bool isGeographicLocationNone(GeographicLocation? geographicLocation) {
    if (geographicLocation == null || geographicLocation.title.isNotEmpty) {
      return false;
    }
    return true;
  }

  @override
  List<dynamic> get props => <dynamic>[
        day,
        country,
        transportation,
        accommodation,
        excursion,
        breakfast,
        lunch,
        dinner,
        coffeeShops,
        markets,
        promoCodes,
        recommendation,
      ];
}
