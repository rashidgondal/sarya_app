import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:sarya/data/repository/purchase_and_sold_repo/purchase_and_sold_repo.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/home/home_view_model/created_itinerary_states.dart';
import 'package:sarya/home/home_view_model/itinerary_by_id_states.dart';
import 'package:sarya/home/home_view_model/purchase_itinerary_by_id_states.dart';
import 'package:sarya/home/itineraryByIDResponse.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import '../../data/repository/shop_itinerary_repository/shop_itinerary_repository.dart';
import '../model/purchase_itinerary_request.dart';

class PurchaseItineraryByIDCubits extends Cubit<PurchaseItineraryByIDStates> {
  PurchaseItineraryByIDCubits(): super(PurchaseItineraryByIDInitial());

  Future purchaseItinerary({required  PurchaseItineraryRequest request,required NavigationService navigationService}) async{
    try{
      emit(PurchaseItineraryByIDLoading());
      final  result = await PurchaseSoldItineraryRepository.instance.purchaseItinerary(body: request.toJson());

      emit(PurchaseItineraryByIDLoaded());
      navigationService.navigateTo(dashboardRout);
    }catch(e){
      print("catch.............${e.toString()}");
      emit(const PurchaseItineraryByIDFailure(error: ''));
    }
  }

}