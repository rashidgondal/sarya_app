import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/helper/shared_prefs.dart';
import '../../data/repository/shop_itinerary_repository/shop_itinerary_repository.dart';
import '../../home/home_view_model/draft_itinerary_states.dart';

class StatusItineraryCubits extends Cubit<DraftItineraryStates> {
  StatusItineraryCubits(): super(DraftItineraryInitial());

  Future getStatusItinerary({required bool status}) async{
    try{
      emit(DraftItineraryLoading());

      final  result = await ShopIntineraryRepository.instance.getItineraryByStatus(status: status);
      var dataList = result['result'];

      //StatusItineraryResponse statusItineraryResponse = StatusItineraryResponse.fromJson(result);
      SharedPrefs pref = SharedPrefs();

      emit(DraftItineraryLoaded(list: dataList));

    }catch(e){
      print("catch.............${e.toString()}");
      emit(const DraftItineraryFailure(error: ''));
    }
  }

}