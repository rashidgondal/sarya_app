import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/settings/avatar/view_model/update_avatar_states.dart';
import '../../../data/repository/authentication_repository/auth_repo.dart';
import '../model/update_avatar_request.dart';

class AvatarCubits extends Cubit<UpdateAvatarStates> {
  AvatarCubits(): super(UpdateAvatarInitial());

  Future doSignIn({required UpdateAvatarRequest updateAvatarRequest, required NavigationService navigationService}) async{
    try{
      emit(UpdateAvatarLoading());

      final  res = await AuthRepository.instance.signIn(body: updateAvatarRequest.toJson());

      emit(UpdateAvatarLoaded());
      navigationService.navigatePushReplace(settingRoute);

    }catch(e){
      emit(const UpdateAvatarFailure(error: ''));

    }
  }

}