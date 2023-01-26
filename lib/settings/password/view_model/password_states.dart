import 'package:equatable/equatable.dart';
import 'package:sarya/authentication/signin/models/signin_response_model.dart';


abstract class PasswordStates extends Equatable{
  const PasswordStates();

  @override
  List<Object> get props => [];
}

class PasswordInitial extends PasswordStates{

}

class PasswordFailure extends PasswordStates{
 final String error;
 const PasswordFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class PasswordLoading extends PasswordStates {

}

class PasswordLoaded extends PasswordStates {
}

