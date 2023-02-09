import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/authentication/forget_password/models/forget_password_request.dart';
import 'package:sarya/authentication/forget_password/models/forget_password_response.dart';
import 'package:sarya/authentication/forget_password/models/reset_password_response.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import '../../../data/repository/authentication_repository/auth_repo.dart';
import '../../../helper/show_snake_bar.dart';
import '../models/reset_password_request.dart';
import 'forget_password_states.dart';

class ForgetPasswordCubits extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubits(): super(ForgetPasswordInitial());

  Future doForgetPassword({required String email , required NavigationService navigationService, required bool rootValue}) async{
    try{
      emit(ForgetPasswordLoading());
      ForgetPasswordRequest forgetPasswordRequest = ForgetPasswordRequest(email: email);
      final ForgetPasswordResponse res = await AuthRepository.instance.forgetPassword(body: forgetPasswordRequest.toJson());
      emit(const ForgetPasswordLoaded());
      ShowSnackBar.showSnackBar(msg: res.msg??'');

      navigationService.navigateTo(resetRout, arguments:{ "email": email, "root":rootValue});

    }catch(e){
      emit(const ForgetPasswordFailure(error: ''));

    }
  }

  Future doResetPassword({required int otp, required String password,required String email, required NavigationService navigationService, required bool rootValue}) async{
    try{
      emit(ForgetPasswordLoading());
      ResetPasswordRequest resetPasswordRequest = ResetPasswordRequest(email: email, pwdResetCode: otp, password: password);
      final  res = await AuthRepository.instance.resetPassword(body: resetPasswordRequest.toJson());
      emit(const ForgetPasswordLoaded());
      ShowSnackBar.showSnackBar(msg: res.msg??'');
   if(rootValue) {
     navigationService.navigatePushReplace(loginRout);
   }else{
     navigationService.navigatePushReplace(settingRoute);

   }

    }catch(e){
      emit(const ForgetPasswordFailure(error: ''));

    }
  }

}