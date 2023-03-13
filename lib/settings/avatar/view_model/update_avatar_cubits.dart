import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/settings/avatar/view_model/update_avatar_states.dart';
import '../../../data/repository/authentication_repository/auth_repo.dart';
import '../../../helper/shared_prefs.dart';
import '../model/update_avatar_request.dart';

class UpdateAvatarCubits extends Cubit<UpdateAvatarStates> {
  UpdateAvatarCubits(): super(UpdateAvatarInitial());

  Future updateAvatar({required UpdateAvatarRequest updateAvatarRequest, required NavigationService navigationService}) async{
    try{
      emit(UpdateAvatarLoading());

      final  res = await AuthRepository.instance.update(body: updateAvatarRequest.toJson());
      SharedPrefs pref = SharedPrefs();
      pref.saveUser(res);
      emit(UpdateAvatarLoaded());
      navigationService.navigatePushReplace(dashboardRout);

    }catch(e){
      emit(const UpdateAvatarFailure(error: ''));

    }
  }

}