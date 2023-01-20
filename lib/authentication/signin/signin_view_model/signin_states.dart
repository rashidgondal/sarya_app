import 'package:equatable/equatable.dart';
import 'package:sarya/authentication/signin/models/signin_response_model.dart';

import '../models/signin_request_model.dart';

abstract class SignInStates extends Equatable{
  const SignInStates();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInStates{

}

class SignInFailure extends SignInStates{
 final String error;
 const SignInFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class SignInLoading extends SignInStates {

}

class SignInLoaded extends SignInStates {
  final SignInResponse signInResponse;
  const SignInLoaded({required this.signInResponse});
}

