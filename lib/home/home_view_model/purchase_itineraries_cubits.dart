import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/data/repository/purchase_and_sold_repo/purchase_and_sold_repo.dart';
import 'package:sarya/home/home_view_model/purchase_itineraries_states.dart';
import 'package:sarya/home/model/all_purchases_response.dart';

class PurchaseItinerariesCubits extends Cubit<PurchaseItinerariesStates> {
  PurchaseItinerariesCubits(): super(PurchaseItineraryInitial());

  Future getPurchaseItinerary() async{
    try{
      emit(PurchaseItineraryLoading());
      final  result = await PurchaseSoldItineraryRepository.instance.getAllPurchase();
      GetAllPurchasesResponse response = GetAllPurchasesResponse.fromJson(result);
      emit(PurchaseItineraryLoaded(purchasedItineraries: response.purchased??[], createdItineraries: response.created??[]));

    }catch(e){
      print("catch.............${e.toString()}");
      emit(const PurchaseItineraryFailure(error: ''));
    }
  }

}