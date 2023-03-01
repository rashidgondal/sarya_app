import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geographic_location.g.dart';

@JsonSerializable()
class GeographicLocation extends Equatable {
  const GeographicLocation({
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.vicinity,
  });

  const GeographicLocation.none()
      : title = '',
        latitude = 0.0,
        longitude = 0.0,
        vicinity = '';

  factory GeographicLocation.fromJson(Map<String, dynamic> json) =>
      _$GeographicLocationFromJson(json);

  Map<String, dynamic> toJson() => _$GeographicLocationToJson(this);

  final String title;
  final double latitude;
  final double longitude;
  final String vicinity;

  GeographicLocation copyWith({
    String? title,
    double? latitude,
    double? longitude,
    String? vicinity,
  }) {
    return GeographicLocation(
      title: title ?? this.title,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      vicinity: vicinity ?? this.vicinity,
    );
  }

  @override
  List<Object> get props => [
        title,
        latitude,
        longitude,
        vicinity,
      ];
}
