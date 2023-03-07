import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/data/repository/purchase_and_sold_repo/purchase_and_sold_repo.dart';
import 'package:sarya/home/home_view_model/sold_itineraries_states.dart';
import 'package:sarya/home/model/sold_all_response.dart';

class SoldItinerariesCubits extends Cubit<SoldItinerariesStates> {
  SoldItinerariesCubits(): super(SoldItineraryInitial());

  Future getAllSoldItinerary() async{
    try{
      emit(SoldItineraryLoading());
      final  result = await PurchaseSoldItineraryRepository.instance.getAllSoldItinerary();
      SoldAllItinerariesResponse soldAllItinerariesResponse = SoldAllItinerariesResponse.fromJson(result);
      emit(SoldItineraryLoaded(result: soldAllItinerariesResponse.result??[]));

    }catch(e){
      print("catch.............${e.toString()}");
      emit(const SoldItineraryFailure(error: ''));
    }
  }

}