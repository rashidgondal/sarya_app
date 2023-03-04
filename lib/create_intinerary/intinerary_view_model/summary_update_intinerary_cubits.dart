import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/summary_update_intinerary_states.dart';
import 'package:sarya/data/repository/create_intinerary_respo/create_intinerary_repo.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';

import '../model/summary_update_intinerary_request.dart';

class SummaryUpdateIntineraryCubits extends Cubit<SummaryUpdateIntineraryStates> {
  SummaryUpdateIntineraryCubits() : super(SummaryUpdateIntineraryInitial());

  Future summaryUpdateIntineraryPage(
      {required SummaryUpdateIntineraryRequest summaryUpdateIntineraryRequest, required NavigationService navigationService, required String route, required String id}) async {
    try {
      emit(SummaryUpdateIntineraryLoading());


      var res = await CreateIntineraryRepository
          .instance.updateIntinerary(body: summaryUpdateIntineraryRequest.toJson(), id: id);

      emit(SummaryUpdateIntineraryLoaded());
      if(route == "Save") {
        navigationService.navigatePushReplace(draftIntineraryRoute);
      }else{
        navigationService.navigatePushReplace(dashboardRout);
      }

    } catch (e) {

      emit(const SummaryUpdateIntineraryFailure(error: ''));
    }
  }
}