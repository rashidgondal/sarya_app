import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/settings/birthday/view_model/birthday_states.dart';
import '../../../data/repository/authentication_repository/auth_repo.dart';
import '../model/birhday_request.dart';

class BirthdayCubits extends Cubit<BirthdayStates> {
  BirthdayCubits(): super(BirthdayInitial());

  Future doSignIn({required UpdateBirthdayRequest birthdayRequest, required NavigationService navigationService}) async{
    try{
      emit(BirthdayLoading());

      final  res = await AuthRepository.instance.signIn(body: birthdayRequest.toJson());

      emit(BirthdayLoaded());
      navigationService.navigatePushReplace(settingRoute);

    }catch(e){
      emit(const BirthdayFailure(error: ''));

    }
  }

}