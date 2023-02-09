import 'dart:developer';
import 'package:sarya/authentication/forget_password/models/forget_password_response.dart';
import 'package:sarya/authentication/forget_password/models/reset_password_response.dart';
import 'package:sarya/authentication/signin/models/signin_response_model.dart';
import 'package:sarya/data/provider/sarya_api.dart';
import '../../../authentication/signup/model/avatar_response.dart';
import '../../../authentication/signup/model/signup_response.dart';

class AuthRepository{
  AuthRepository._privateConstructor();

  static final AuthRepository _instance = AuthRepository._privateConstructor();
  static AuthRepository get instance => _instance;

  final SaryaAPI _saryaAPI = SaryaAPI();

  Future<SignInResponse> signIn({required body}) async{
      try{

        log('body......$body', name:'signIn | AuthRepository');

        var data =await _saryaAPI.signIn(body: body);

         log('data......$data', name:'signIn | AuthRepository');

         return SignInResponse.fromJson(data);
      }catch(e){
        log('catch......${e.toString()}', name:'signIn | AuthRepository');

        rethrow;
      }
    }

  Future<SignupResponse> signUp({required body}) async{
    try{

      log('body......$body', name:'signIn | AuthRepository');

      var data =await _saryaAPI.signup(body: body);

      log('data......$data', name:'signIn | AuthRepository');

      return SignupResponse.fromJson(data);
    }catch(e){
      log('catch......${e.toString()}', name:'signIn | AuthRepository');

      rethrow;
    }
  }

  Future<ForgetPasswordResponse> forgetPassword({required body}) async{
    try{

      log('body......$body', name:'forgetPassword | AuthRepository');

      var data =await _saryaAPI.forgetPassword(body: body);

      log('data......$data', name:'forgetPassword | AuthRepository');

      return ForgetPasswordResponse.fromJson(data);
    }catch(e){
      log('catch......${e.toString()}', name:'forgetPassword | AuthRepository');

      rethrow;
    }
  }

  Future<ResetPasswordResponse> resetPassword({required body}) async{
    try{

      log('body......$body', name:'resetPassword | AuthRepository');

      var data =await _saryaAPI.resetPassword(body: body);

      log('data......$data', name:'resetPassword | AuthRepository');

      return ResetPasswordResponse.fromJson(data);
    }catch(e){
      log('catch......${e.toString()}', name:'resetPassword | AuthRepository');

      rethrow;
    }
  }

  Future<dynamic> avatar() async{
    try{

      log('1.....', name:'avatar | AuthRepository');

      var data =await _saryaAPI.getAvatar();
      log('2......$data', name:'avatar | AuthRepository');

      return data;

    }catch(e){

      rethrow;
    }
  }

  Future<dynamic> countries() async{
    try{

      log('1.....', name:'country | AuthRepository');

      var data =await _saryaAPI.getCountries();
      log('2......$data', name:'country | AuthRepository');

      return data;

    }catch(e){

      rethrow;
    }
  }

  Future<SignInResponse> update({required body}) async{
    try{

      log('body......$body', name:'update | AuthRepository');

      var data =await _saryaAPI.update(body: body);

      log('data......$data', name:'update | AuthRepository');
      SignInResponse signInResponse = SignInResponse.fromJson(data);
      return signInResponse;
    }catch(e){
      log('catch......${e.toString()}', name:'update | AuthRepository');

      rethrow;
    }
  }



}