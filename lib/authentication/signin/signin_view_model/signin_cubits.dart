import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/authentication/signin/models/signin_request_model.dart';
import 'package:sarya/authentication/signin/models/signin_response_model.dart';
import 'package:sarya/authentication/signin/signin_view_model/signin_states.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';

import '../../../data/repository/authentication_repository/auth_repo.dart';
import '../../../helper/userStorage.dart';

class SignInCubits extends Cubit<SignInStates> {
  SignInCubits(): super(SignInInitial());

  Future doSignIn({required SignInRequest signInRequest, required NavigationService navigationService}) async{
    try{
      emit(SignInLoading());

      final SignInResponse res = await AuthRepository.instance.signIn(body: signInRequest.toJson());
      await UserSecureStorage()
          .setField('accessToken', res.token ?? '');
      emit(SignInLoaded(signInResponse: res));
       navigationService.navigatePushReplace(dashboardRout);

    }catch(e){
      emit(const SignInFailure(error: ''));

    }
  }

}