import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/data/repository/create_intinerary_respo/create_intinerary_repo.dart';
import 'package:sarya/helper/shared_prefs.dart';
import '../model/activity_type_response.dart';
import 'activity_states.dart';

class ActivityCubits extends Cubit<ActivityStates> {
  ActivityCubits(): super(ActivityInitial());

  Future getActivity() async{
    try{
      emit(ActivityLoading());

      final ActivityTypeResponse  res = await CreateIntineraryRepository.instance.activity();
      List<bool> listOfBool = await List.filled(res.result!.length, false);


      emit(ActivityLoaded(activityTypeResponse: res, listOfBool: listOfBool));

    }catch(e){
      emit(const ActivityFailure(error: ''));
    }
  }

}