// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geographic_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeographicLocation _$GeographicLocationFromJson(Map<String, dynamic> json) =>
    GeographicLocation(
      title: json['title'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      vicinity: json['vicinity'] as String,
    );

Map<String, dynamic> _$GeographicLocationToJson(GeographicLocation instance) =>
    <String, dynamic>{
      'title': instance.title,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'vicinity': instance.vicinity,
    };
