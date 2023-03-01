import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:places_api/src/models/models.dart';

class PlacesApi {
  // TODO(deep): This is staging key
  final key = 'AIzaSyB5TwwgGyrHFOMamYPjkztv29_x32CnPBM';
  final baseUrl = 'maps.googleapis.com';

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    final query = {'input': search, 'key': key};
    final autoCompleteRequest = Uri.https(
      baseUrl,
      '/maps/api/place/autocomplete/json',
      query,
    );
    final response = await http.get(autoCompleteRequest);
    final json = convert.jsonDecode(response.body) as Map<String, dynamic>;
    final jsonResults = json['predictions'] as List;
    return jsonResults
        .map(
          (dynamic place) =>
              PlaceSearch.fromJson(place as Map<String, dynamic>),
        )
        .toList();
  }

  Future<Place> getPlace(String placeId) async {
    final query = {'place_id': placeId, 'key': key};
    final getPlaceRequest = Uri.https(
      baseUrl,
      '/maps/api/place/details/json',
      query,
    );
    final response = await http.get(getPlaceRequest);
    final json = convert.jsonDecode(response.body) as Map<String, dynamic>;
    final jsonResult = json['result'] as Map<String, dynamic>;
    return Place.fromJson(jsonResult);
  }
}
