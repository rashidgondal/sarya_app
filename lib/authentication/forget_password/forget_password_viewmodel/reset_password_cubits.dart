import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/authentication/forget_password/forget_password_viewmodel/reset_password_states.dart';
import 'package:sarya/authentication/forget_password/models/forget_password_request.dart';
import 'package:sarya/authentication/forget_password/models/forget_password_response.dart';
import 'package:sarya/authentication/forget_password/models/reset_password_response.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import '../../../data/repository/authentication_repository/auth_repo.dart';
import '../../../helper/show_snake_bar.dart';
import '../models/reset_password_request.dart';
import 'forget_password_states.dart';

class ResetPasswordCubits extends Cubit<ResetPasswordStates> {
  ResetPasswordCubits(): super(ResetPasswordInitial());

  Future doResetPassword({required int otp, required String password,required String email, required NavigationService navigationService}) async{
    try{
      emit(ResetPasswordLoading());
      ResetPasswordRequest resetPasswordRequest = ResetPasswordRequest(email: email, pwdResetCode: otp, password: password);
      final  res = await AuthRepository.instance.resetPassword(body: resetPasswordRequest.toJson());
      emit(const ResetPasswordLoaded());
      ShowSnackBar.showSnackBar(msg: res.msg??'');

      navigationService.navigatePushReplace(loginRout);

    }catch(e){
      emit(const ResetPasswordFailure(error: ''));

    }
  }

}