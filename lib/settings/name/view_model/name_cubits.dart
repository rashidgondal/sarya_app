import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/authentication/signin/models/signin_request_model.dart';
import 'package:sarya/authentication/signin/models/signin_response_model.dart';
import 'package:sarya/authentication/signin/signin_view_model/signin_states.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/settings/name/view_model/name_states.dart';

import '../../../data/repository/authentication_repository/auth_repo.dart';
import '../../../helper/userStorage.dart';
import '../model/update_name_request.dart';

class NameCubits extends Cubit<NameStates> {
  NameCubits(): super(NameInitial());

  Future updateName({required UpdateNameRequest updateNameRequest}) async{
    try{
      emit(NameLoading());
      final  res = await AuthRepository.instance.update(body: updateNameRequest.toJson());
      SignInResponse signInResponse = res;
      SharedPrefs pref = SharedPrefs();
      pref.saveUser(res);

      emit(NameLoaded());

    }catch(e){
      emit(const NameFailure(error: ''));

    }
  }

}