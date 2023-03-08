import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sarya/home/home_view_model/itinerary_by_id_states.dart';
import 'package:sarya/home/itineraryByIDResponse.dart';

import '../../data/repository/shop_itinerary_repository/shop_itinerary_repository.dart';

class ItineraryByIDCubits extends Cubit<ItineraryByIDStates> {
  ItineraryByIDCubits() : super(ItineraryByIDInitial());

  Future getItineraryByID({required String itineraryID}) async {
    try {
      emit(ItineraryByIDLoading());
      final result = await ShopIntineraryRepository.instance
          .getItineraryByID(id: itineraryID);

      print("getItineraryByID................${result}");
      ItineraryByIDResponse idResponse = ItineraryByIDResponse.fromJson(result);
      List<LatLng> list = [];

      if (idResponse.result == null) {
        emit(ItineraryByIDLoaded(
            byIDResult: idResponse.result??ByIDResult(), listOfLatLng: []));
        return;
      }
      if (idResponse.result!.days == null) {
        emit(ItineraryByIDLoaded(
            byIDResult: idResponse.result!, listOfLatLng: []));
        return;
      }

      print(
          "idResponse.result!.days!.length............${idResponse.result!.days!.length}");
      for (int i = 0; i < idResponse.result!.days!.length; i++) {
        list.add(LatLng(
          idResponse.result!.days![i].breakfast!.location!.coordinates![1],
          idResponse.result!.days![i].breakfast!.location!.coordinates![0],
        ));
        list.add(LatLng(
          idResponse.result!.days![i].lunch!.location!.coordinates![1],
          idResponse.result!.days![i].lunch!.location!.coordinates![0],
        ));
        list.add(LatLng(
          idResponse.result!.days![i].dinner!.location!.coordinates![1],
          idResponse.result!.days![i].lunch!.location!.coordinates![0],
        ));
        list.add(LatLng(
          idResponse
              .result!.days![i].coffeeClubsLounges!.location!.coordinates![1],
          idResponse.result!.days![i].lunch!.location!.coordinates![0],
        ));
        list.add(LatLng(
          idResponse
              .result!.days![i].marketMallsStores!.location!.coordinates![1],
          idResponse.result!.days![i].lunch!.location!.coordinates![0],
        ));
      }

      emit(ItineraryByIDLoaded(
          byIDResult: idResponse.result!, listOfLatLng: list));
    } catch (e) {
      print("catch.............${e.toString()}");
      emit(const ItineraryByIDFailure(error: ''));
    }
  }
}
