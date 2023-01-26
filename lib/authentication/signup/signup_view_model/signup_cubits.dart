import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/authentication/signin/models/signin_request_model.dart';
import 'package:sarya/authentication/signin/models/signin_response_model.dart';
import 'package:sarya/authentication/signup/model/signup_request.dart';
import 'package:sarya/authentication/signup/model/signup_response.dart';
import 'package:sarya/authentication/signup/signup_view_model/signup_states.dart';
import 'package:sarya/navigation/router_path.dart';
import '../../../data/repository/authentication_repository/auth_repo.dart';
import '../../../navigation/navigation_service.dart';

class SignupCubits extends Cubit<SignupStates> {
  SignupCubits(): super(SignupInitial());

  Future doSignup({
    required SignupRequest signupRequest,
    required NavigationService navigationService
}) async{
    try{
      emit(SignupLoading());

      final SignupResponse res = await AuthRepository.instance.signUp(body: signupRequest.toJson());
      emit(SignupLoaded());
      Map map = signupRequest.toJson();
     String userName = map['email'];
     String password = map['password'];
     SignInRequest signInRequest = SignInRequest(userName: userName, password: password);

     navigationService.navigateTo(animationRoute, arguments: signInRequest);

    }catch(e){
      emit(const SignupFailure(error: ''));

    }
  }

  SignupRequest _signupRequest = SignupRequest();
  SignupRequest get getSignupRequest => _signupRequest;
  void saveSignup({ required SignupRequest signupRequest}){
    _signupRequest = signupRequest;
  }

}