import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/home/home_view_model/draft_itinerary_states.dart';
import '../../data/repository/shop_itinerary_repository/shop_itinerary_repository.dart';

class DraftItineraryCubits extends Cubit<DraftItineraryStates> {
  DraftItineraryCubits(): super(DraftItineraryInitial());

  Future getDraftItinerary({Function()? onDelete = null}) async{
    try{
      emit(DraftItineraryLoading());

      final  result = await ShopIntineraryRepository.instance.getItineraryByStatus(status: false);
      var dataList = result['result'];
      if(onDelete != null){
        onDelete.call();
      }
      //DraftItineraryResponse DraftItineraryResponse = DraftItineraryResponse.fromJson(result);
      SharedPrefs pref = SharedPrefs();

      emit(DraftItineraryLoaded(list: dataList));

    }catch(e){
      print("catch.............${e.toString()}");
      emit(const DraftItineraryFailure(error: ''));
    }
  }

}