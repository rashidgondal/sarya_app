import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/home/home_view_model/stop_itinerary_states.dart';
import 'package:sarya/home/model/stop_request.dart';
import 'package:sarya/navigation/navigation_service.dart';
import '../../data/repository/purchase_and_sold_repo/purchase_and_sold_repo.dart';
import '../../navigation/router_path.dart';

class StopItineraryStateCubits extends Cubit<StopItineraryStates> {
  StopItineraryStateCubits(): super(StopItineraryInitial());

  Future getStopItinerary({required StopRequest stopRequest, required NavigationService service,String? buttonName}) async{
    try{
      emit(StopItineraryLoading());

      final  result = await PurchaseSoldItineraryRepository.instance.setStates(body: stopRequest.toJson());

      emit(StopItineraryLoaded());
      if(buttonName == null) {
        service.navigatePushReplace(dashboardRout);
      }
      else{
        service.goBack();
      }

    }catch(e){
      print("catch.............${e.toString()}");
      emit(const StopItineraryFailure(error: ''));
    }
  }

}