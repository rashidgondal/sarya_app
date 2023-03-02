import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/shop/model/public_itinerary_response.dart';
import 'package:sarya/shop/shop_view_model/public_states.dart';
import '../../data/repository/shop_itinerary_repository/shop_itinerary_repository.dart';

class PublicItineraryCubits extends Cubit<PublicItineraryStates> {
  PublicItineraryCubits(): super(PublicItineraryInitial());

  Future getPublicItinerary() async{
    try{
      emit(PublicItineraryLoading());

      final  result = await ShopIntineraryRepository.instance.getPublicItinerary();
      log("result.........$result", name: "getPublicItinerary | PublicItineraryCubits");
      PublicItineraryResponse publicItineraryResponse = PublicItineraryResponse.fromJson(result);
      emit(PublicItineraryLoaded(publicItineraryResponse: publicItineraryResponse));

    }catch(e){
      log("result.........${e.toString()}", name: "catch | PublicItineraryCubits");

      emit(const PublicItineraryFailure(error: ''));
    }
  }

}