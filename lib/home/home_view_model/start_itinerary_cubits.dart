import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/home/home_view_model/start_itinerary_states.dart';
import 'package:sarya/home/model/start_request.dart';
import '../../data/repository/purchase_and_sold_repo/purchase_and_sold_repo.dart';

class StartItineraryStateCubits extends Cubit<StartItineraryStates> {
  StartItineraryStateCubits(): super(StartItineraryInitial());

  Future setStartItineraryState({required StartRequest startRequest}) async{
    try{
      emit(StartItineraryLoading());

      final  result = await PurchaseSoldItineraryRepository.instance.setStates(body: startRequest.toJson());

      emit(StartItineraryLoaded());

    }catch(e){
      print("catch.............${e.toString()}");
      emit(const StartItineraryFailure(error: ''));
    }
  }

}