import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/create_intinerary_states.dart';
import 'package:sarya/data/repository/create_intinerary_respo/create_intinerary_repo.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import '../model/create_intinerary_request.dart';
import '../model/create_intinerary_response.dart';

class CreateIntineraryCubits extends Cubit<CreateIntineraryStates> {
  CreateIntineraryCubits(): super(CreateIntineraryInitial());

  Future doCreateIntinerary({required CreateIntineraryRequest CreateIntineraryRequest, required NavigationService navigationService}) async{
    try{
      emit(CreateIntineraryLoading());

      final CreateIntineraryResponse  res = await CreateIntineraryRepository.instance.createIntinerary(body: CreateIntineraryRequest.toJson());
      SharedPrefs pref = SharedPrefs();

      emit(CreateIntineraryLoaded(createIntineraryResponse: res));

    }catch(e){
      emit(const CreateIntineraryFailure(error: ''));
    }
  }

}