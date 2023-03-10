import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/home/home_view_model/completed_itinerary_states.dart';
import 'package:sarya/home/model/completed_request.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import '../../data/repository/purchase_and_sold_repo/purchase_and_sold_repo.dart';

class CompletedItineraryStateCubits extends Cubit<CompletedItineraryStates> {
  CompletedItineraryStateCubits(): super(CompletedItineraryInitial());

  Future setCompletedItineraryState({required CompletedRequest completedRequest, required NavigationService service}) async{
    try{
      emit(CompletedItineraryLoading());

      final  result = await PurchaseSoldItineraryRepository.instance.setStates(body: completedRequest.toJson());
      service.navigatePushReplace(dashboardRout);
      emit(CompletedItineraryLoaded());

    }catch(e){
      print("catch.............${e.toString()}");
      emit(const CompletedItineraryFailure(error: ''));
    }
  }

}