// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItineraryDay _$ItineraryDayFromJson(Map<String, dynamic> json) => ItineraryDay(
      day: json['day'] as int,
      country: json['country'] as String?,
      transportation: json['transportation'] as String?,
      accommodation: json['accommodation'] == null
          ? null
          : GeographicLocation.fromJson(
              json['accommodation'] as Map<String, dynamic>),
      excursion: (json['excursion'] as List<dynamic>?)
              ?.map((dynamic e) =>
                  GeographicLocation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      breakfast: (json['breakfast'] as List<dynamic>?)
              ?.map((dynamic e) =>
                  GeographicLocation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lunch: (json['lunch'] as List<dynamic>?)
              ?.map((dynamic e) =>
                  GeographicLocation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      dinner: (json['dinner'] as List<dynamic>?)
              ?.map((dynamic e) =>
                  GeographicLocation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      coffeeShops: (json['coffeeShops'] as List<dynamic>?)
              ?.map((dynamic e) =>
                  GeographicLocation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      markets: (json['markets'] as List<dynamic>?)
              ?.map((dynamic e) =>
                  GeographicLocation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      promoCodes: json['promoCodes'] as String?,
      recommendation: json['recommendation'] as String?,
    );

Map<String, dynamic> _$ItineraryDayToJson(ItineraryDay instance) =>
    <String, dynamic>{
      'day': instance.day,
      'country': instance.country,
      'transportation': instance.transportation,
      'accommodation': instance.accommodation,
      'excursion': instance.excursion,
      'breakfast': instance.breakfast,
      'lunch': instance.lunch,
      'dinner': instance.dinner,
      'coffeeShops': instance.coffeeShops,
      'markets': instance.markets,
      'promoCodes': instance.promoCodes,
      'recommendation': instance.recommendation,
    };
