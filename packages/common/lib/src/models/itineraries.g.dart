// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itineraries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Itineraries _$ItinerariesFromJson(Map<String, dynamic> json) => Itineraries(
      itineraries: (json['itineraries'] as List<dynamic>)
          .map((dynamic e) => Itinerary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItinerariesToJson(Itineraries instance) =>
    <String, dynamic>{
      'itineraries': instance.itineraries,
    };
