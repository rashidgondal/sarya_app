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

  Future doCreateIntinerary(
      {required DesignIntineraryRequest createIntineraryRequest, required NavigationService navigationService, required String route}) async {
    try {
      emit(UpdateIntineraryLoading());

      SharedPrefs sharedPrefs = SharedPrefs();
      String itineraryId = await sharedPrefs.getItineraryID();

      var data = await CreateIntineraryRepository
          .instance.updateIntinerary(body: createIntineraryRequest.toJson(), id: itineraryId);
      CreateIntineraryResponse res = CreateIntineraryResponse.fromJson(data);
      var country = await sharedPrefs.getDestinationCountries() ;
      emit(UpdateIntineraryLoaded(createIntineraryResponse: res));
      if(route == "Continue") {
        navigationService.navigateTo(dayDesignRoute, arguments: {"country":country, "totalDays": createIntineraryRequest.totalDays, "tripCost":"${createIntineraryRequest.tripCost}","summary":"${createIntineraryRequest.summary}","tripType": "${createIntineraryRequest.tripType}"});
      }else{
        navigationService.navigateTo(draftIntineraryRoute);

      }


    } catch (e) {
      print("catch.............1...${e.toString()}");

      emit(const UpdateIntineraryFailure(error: ''));
    }
  }
}