import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/settings/phone/view_model/phone_states.dart';
import '../../../data/repository/authentication_repository/auth_repo.dart';
import '../model/update_phone_request.dart';

class PhoneCubits extends Cubit<PhoneStates> {
  PhoneCubits(): super(PhoneInitial());

  Future doSignIn({required UpdatePhoneRequest updatePhoneRequest, required NavigationService navigationService}) async{
    try{
      emit(PhoneLoading());

      final  res = await AuthRepository.instance.update(body: updatePhoneRequest.toJson());

      emit(PhoneLoaded());
      navigationService.navigatePushReplace(dashboardRout);

    }catch(e){
      emit(const PhoneFailure(error: ''));

    }
  }

}