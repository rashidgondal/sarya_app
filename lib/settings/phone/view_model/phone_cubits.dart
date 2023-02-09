import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/settings/phone/view_model/phone_states.dart';
import '../../../data/repository/authentication_repository/auth_repo.dart';
import '../../../helper/shared_prefs.dart';
import '../model/update_phone_request.dart';

class PhoneCubits extends Cubit<PhoneStates> {
  PhoneCubits(): super(PhoneInitial());

  Future updatePhone({required UpdatePhoneRequest updatePhoneRequest, required NavigationService navigationService}) async{
    try{
      emit(PhoneLoading());

      final  res = await AuthRepository.instance.update(body: updatePhoneRequest.toJson());
      SharedPrefs pref = SharedPrefs();
      pref.saveUser(res);
      emit(PhoneLoaded());
      navigationService.navigatePushReplace(settingRoute);

    }catch(e){
      emit(const PhoneFailure(error: ''));

    }
  }

}