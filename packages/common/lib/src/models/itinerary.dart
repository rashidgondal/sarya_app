import 'package:common/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'itinerary.g.dart';

@JsonSerializable()
class Itinerary extends Equatable {
  const Itinerary({
    required this.itineraryDays,
    required this.title,
    required this.description,
    required this.costEstimation,
    required this.tripType,
    required this.tripDays,
    required this.isPublished,
    this.id = '',
  });

  Itinerary.empty()
      : itineraryDays = [],
        title = '',
        description = '',
        costEstimation = '',
        tripType = [],
        tripDays = '',
        isPublished = false,
        id = '';

  factory Itinerary.fromJson(Map<String, dynamic> json) =>
      _$ItineraryFromJson(json);

  Map<String, dynamic> toJson() => _$ItineraryToJson(this);

  final List<ItineraryDay> itineraryDays;
  final String title;
  final String description;
  final String costEstimation;
  final List<String> tripType;
  final String tripDays;
  final bool isPublished;
  final String id;

  Itinerary copyWith({
    List<ItineraryDay>? itineraryDays,
    String? title,
    String? description,
    String? costEstimation,
    List<String>? tripType,
    String? tripDays,
    bool? isPublished,
    String? id,
  }) {
    return Itinerary(
      itineraryDays: itineraryDays ?? this.itineraryDays,
      title: title ?? this.title,
      description: description ?? this.description,
      costEstimation: costEstimation ?? this.costEstimation,
      tripType: tripType ?? this.tripType,
      tripDays: tripDays ?? this.tripDays,
      isPublished: isPublished ?? this.isPublished,
      id: id ?? this.id,
    );
  }

  @override
  List<Object> get props => [
        itineraryDays,
        title,
        description,
        costEstimation,
        tripType,
        tripDays,
        isPublished,
        id,
      ];
}
