import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/shop/model/status_itinerary_response.dart';
import 'package:sarya/shop/shop_view_model/Status_itinerary_states.dart';
import '../../data/repository/shop_itinerary_repository/shop_itinerary_repository.dart';

class StatusItineraryCubits extends Cubit<StatusItineraryStates> {
  StatusItineraryCubits(): super(StatusItineraryInitial());

  Future getStatusItinerary({required bool status}) async{
    try{
      emit(StatusItineraryLoading());

      final  result = await ShopIntineraryRepository.instance.getItineraryByStatus(status: false);
      var dataList = result['result'];

      //StatusItineraryResponse statusItineraryResponse = StatusItineraryResponse.fromJson(result);
      SharedPrefs pref = SharedPrefs();

      emit(StatusItineraryLoaded(list: dataList));

    }catch(e){
      print("catch.............${e.toString()}");
      emit(const StatusItineraryFailure(error: ''));
    }
  }

}