import 'package:equatable/equatable.dart';

class PlaceSearch extends Equatable {
  const PlaceSearch({
    required this.description,
    required this.placeId,
  });

  factory PlaceSearch.fromJson(Map<String, dynamic> json) {
    return PlaceSearch(
      description: json['description'] as String,
      placeId: json['place_id'] as String,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'description': description,
        'place_id': placeId,
      };

  final String description;
  final String placeId;

  @override
  List<Object> get props => [description, placeId];
}
