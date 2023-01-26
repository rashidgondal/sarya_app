import 'package:equatable/equatable.dart';


abstract class ResetPasswordStates extends Equatable{
  const ResetPasswordStates();

  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordStates{

}

class ResetPasswordFailure extends ResetPasswordStates{
 final String error;
 const ResetPasswordFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class ResetPasswordLoading extends ResetPasswordStates {

}

class ResetPasswordLoaded extends ResetPasswordStates {
  const ResetPasswordLoaded();
}

