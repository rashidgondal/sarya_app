import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/authentication/signup/model/avatar_response.dart';
import '../../../data/repository/authentication_repository/auth_repo.dart';
import 'avatar_states.dart';

class AvatarCubits extends Cubit<AvatarStates> {
  AvatarCubits(): super(AvatarInitial());

  Future getAvatar() async{
    try{
      emit(AvatarLoading());

       var result  = await AuthRepository.instance.avatar();
      AvatarResponse avatarResponse = AvatarResponse.fromJson(result);

      emit(AvatarLoaded(avatarResponse: avatarResponse));

    }catch(e){
      emit(const AvatarFailure(error: ''));

    }
  }


}