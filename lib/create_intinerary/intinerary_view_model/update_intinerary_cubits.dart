import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/create_intinerary_states.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/update_intinerary_states.dart';
import 'package:sarya/data/repository/create_intinerary_respo/create_intinerary_repo.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import '../model/create_intinerary_request.dart';
import '../model/create_intinerary_response.dart';
import '../model/design_intinerary_request.dart';

class UpdateIntineraryCubits extends Cubit<UpdateIntineraryStates> {
  UpdateIntineraryCubits() : super(UpdateIntineraryInitial());

  Future updateDesignIntineraryPage(
      {required DesignIntineraryRequest createIntineraryRequest, required NavigationService navigationService, required String route, List<String>? destination, required String itineraryId}) async {
    try {
      emit(UpdateIntineraryLoading());

      var data = await CreateIntineraryRepository.instance.updateIntinerary(body: createIntineraryRequest.toJson(), id: itineraryId);
      CreateIntineraryResponse res = CreateIntineraryResponse.fromJson(data);
      emit(UpdateIntineraryLoaded(createIntineraryResponse: res));
      if(route == "Continue") {
        navigationService.navigateTo(dayDesignRoute, arguments: {"country":destination, "totalDays": createIntineraryRequest.totalDays, "itineraryCost":"${createIntineraryRequest.cost}","tripCost":"${createIntineraryRequest.tripCost}","summary":"${createIntineraryRequest.summary}","tripType": "${createIntineraryRequest.tripType}","location":[]});
      }else{
        navigationService.navigatePushReplace(draftIntineraryRoute);

      }


    } catch (e) {
      print("catch.............1...${e.toString()}");

      emit(const UpdateIntineraryFailure(error: ''));
    }
  }
}