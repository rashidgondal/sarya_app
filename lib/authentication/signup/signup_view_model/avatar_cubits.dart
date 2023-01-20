import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/authentication/signup/model/avatar_response.dart';
import '../../../data/repository/authentication_repository/auth_repo.dart';
import 'avatar_states.dart';

class AvatarCubits extends Cubit<AvatarStates> {
  AvatarCubits(): super(AvatarInitial());

  Future getAvatar() async{
    try{
      emit(AvatarLoading());

       List result  = await AuthRepository.instance.avatar();
      // AvatarResponse avatarResponse = AvatarResponse.fromJson(result);
      List avatars = result[0]["avatars"];
      String baseUrl = result[0]["baseUrl"];
      String format = result[0]["format"];


      emit(AvatarLoaded(avatars: avatars, baseUrl: baseUrl, format: format));

    }catch(e){
      emit(const AvatarFailure(error: ''));

    }
  }


}