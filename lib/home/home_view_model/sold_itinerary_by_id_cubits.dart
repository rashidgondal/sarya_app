import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/data/repository/purchase_and_sold_repo/purchase_and_sold_repo.dart';
import 'package:sarya/home/home_view_model/sold_itinerary_by_id_states.dart';
import 'package:sarya/home/model/sold_Itinerary_detail_response.dart';

class SoldItineraryByIDCubits extends Cubit<SoldItineraryByIDStates> {
  SoldItineraryByIDCubits(): super(SoldItineraryByIDInitial());

  Future getSoldItineraryByID({required String itineraryID}) async{
    try{
      emit(SoldItineraryByIDLoading());
      final  result = await PurchaseSoldItineraryRepository.instance.getSoldItineraryDetail(id: itineraryID);
      SoldItineraryDetailResponse soldItineraryDetailResponse = SoldItineraryDetailResponse.fromJson(result);
      emit(SoldItineraryByIDLoaded(result: soldItineraryDetailResponse.result??[]));

    }catch(e){
      print("catch.............${e.toString()}");
      emit(const SoldItineraryByIDFailure(error: ''));
    }
  }

}