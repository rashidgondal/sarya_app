import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/settings/password/view_model/password_states.dart';
import '../../../data/repository/authentication_repository/auth_repo.dart';
import '../model/update_password_request.dart';

class PasswordCubits extends Cubit<PasswordStates> {
  PasswordCubits(): super(PasswordInitial());

  Future updatePassword({required UpdatePasswordRequest updatePasswordRequest,required NavigationService navigationService}) async{
    try{
      emit(PasswordLoading());

      final  res = await AuthRepository.instance.update(body: updatePasswordRequest.toJson());

      emit(PasswordLoaded());

    }catch(e){
      emit(const PasswordFailure(error: ''));

    }
  }

}