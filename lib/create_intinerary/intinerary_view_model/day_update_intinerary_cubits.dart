import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/create_intinerary_states.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/day_update_intinerary_states.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/update_intinerary_states.dart';
import 'package:sarya/data/repository/create_intinerary_respo/create_intinerary_repo.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import '../model/create_intinerary_request.dart';
import '../model/create_intinerary_response.dart';
import '../model/day_design_intinerary_request.dart';
import '../model/design_intinerary_request.dart';

class DayUpdateIntineraryCubits extends Cubit<DayUpdateIntineraryStates> {
  DayUpdateIntineraryCubits() : super(DayUpdateIntineraryInitial());

  Future dayUpdateIntineraryPage(
      {required DayDesignIntineraryRequest dayDesignIntineraryRequest, required NavigationService navigationService, required String route, required String itineraryId}) async {
    try {
      emit(DayUpdateIntineraryLoading());
      print("log.............1...${dayDesignIntineraryRequest.toJson()}");


      var res = await CreateIntineraryRepository.instance.updateIntinerary(body: dayDesignIntineraryRequest.toJson(), id: itineraryId);

      emit(DayUpdateIntineraryLoaded());
      if(route == "Continue")
      {
        navigationService.navigateTo(summaryRoutSold,arguments: {"id":itineraryId, "type":""});
      }
      else
      {
        navigationService.navigatePushReplace(draftIntineraryRoute);
      }


    } catch (e) {
      print("catch.............1...${e.toString()}");

      emit(const DayUpdateIntineraryFailure(error: ''));
    }
  }
}