import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/shop/shop_view_model/all_itinerary_states.dart';
import '../../data/repository/shop_itinerary_repository/shop_itinerary_repository.dart';
import '../model/all_itinerary_response.dart';

class AllItineraryCubits extends Cubit<AllItineraryStates> {
  AllItineraryCubits(): super(AllItineraryInitial());

  Future getAllItinerary() async{
    try{
      emit(AllItineraryLoading());

      final  result = await ShopIntineraryRepository.instance.getAllItinerary();
      AllItineraryResponse allItineraryResponse = AllItineraryResponse.fromJson(result);
      SharedPrefs pref = SharedPrefs();

      emit(AllItineraryLoaded(allItineraryResponse: allItineraryResponse));

    }catch(e){
      emit(const AllItineraryFailure(error: ''));
    }
  }

}