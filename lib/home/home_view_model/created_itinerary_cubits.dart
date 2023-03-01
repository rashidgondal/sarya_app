import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/home/home_view_model/created_itinerary_states.dart';
import '../../data/repository/shop_itinerary_repository/shop_itinerary_repository.dart';

class CreatedItineraryCubits extends Cubit<CreatedItineraryStates> {
  CreatedItineraryCubits(): super(CreatedItineraryInitial());

  Future getCreatedItinerary() async{
    try{
      emit(CreatedItineraryLoading());

      final  result = await ShopIntineraryRepository.instance.getItineraryByStatus(status: true);
      var dataList = result['result'];

      SharedPrefs pref = SharedPrefs();

      emit(CreatedItineraryLoaded(list: dataList));

    }catch(e){
      print("catch.............${e.toString()}");
      emit(const CreatedItineraryFailure(error: ''));
    }
  }

}