import 'package:equatable/equatable.dart';


abstract class ForgetPasswordStates extends Equatable{
  const ForgetPasswordStates();

  @override
  List<Object> get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordStates{

}

class ForgetPasswordFailure extends ForgetPasswordStates{
 final String error;
 const ForgetPasswordFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class ForgetPasswordLoading extends ForgetPasswordStates {

}

class ForgetPasswordLoaded extends ForgetPasswordStates {
  const ForgetPasswordLoaded();
}

