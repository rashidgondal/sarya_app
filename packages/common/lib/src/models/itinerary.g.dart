// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Itinerary _$ItineraryFromJson(Map<String, dynamic> json) => Itinerary(
      itineraryDays: (json['itineraryDays'] as List<dynamic>)
          .map((dynamic e) => ItineraryDay.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      description: json['description'] as String,
      costEstimation: json['costEstimation'] as String,
      tripType: (json['tripType'] as List<dynamic>)
          .map((dynamic e) => e as String)
          .toList(),
      tripDays: json['tripDays'] as String,
      isPublished: json['isPublished'] as bool,
      id: json['_id'] as String? ?? '',
    );

Map<String, dynamic> _$ItineraryToJson(Itinerary instance) => <String, dynamic>{
      'itineraryDays': instance.itineraryDays,
      'title': instance.title,
      'description': instance.description,
      'costEstimation': instance.costEstimation,
      'tripType': instance.tripType,
      'tripDays': instance.tripDays,
      'isPublished': instance.isPublished,
      'id': instance.id,
    };
