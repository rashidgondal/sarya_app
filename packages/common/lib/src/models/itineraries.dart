import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'itineraries.g.dart';

@JsonSerializable()
class Itineraries extends Equatable {
  const Itineraries({required this.itineraries});

  factory Itineraries.fromJson(Map<String, dynamic> json) =>
      _$ItinerariesFromJson(json);

  Map<String, dynamic> toJson() => _$ItinerariesToJson(this);

  final List<Itinerary> itineraries;

  @override
  List<Object> get props => [itineraries];
}
