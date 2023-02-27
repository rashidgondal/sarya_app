import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/shop/shop_view_model/search_states.dart';
import '../../data/repository/shop_itinerary_repository/shop_itinerary_repository.dart';
import '../model/search_itinerary_response.dart';

class SearchItineraryCubits extends Cubit<SearchItineraryStates> {
  SearchItineraryCubits(): super(SearchItineraryInitial());

  Future getSearchItinerary({required String searchKeyWord}) async{
    try{
      emit(SearchItineraryLoading());

      final  result = await ShopIntineraryRepository.instance.getSearchItinerary(searchedKeyword: searchKeyWord);
      SearchItineraryResponse searchItineraryResponse = SearchItineraryResponse.fromJson(result);
      SharedPrefs pref = SharedPrefs();
      emit(SearchItineraryLoaded(searchItineraryResponse: searchItineraryResponse));

    }catch(e){
      emit(const SearchItineraryFailure(error: ''));
    }
  }

}