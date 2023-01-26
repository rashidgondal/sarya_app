import 'package:equatable/equatable.dart';
import 'package:sarya/authentication/signin/models/signin_response_model.dart';


abstract class EmailStates extends Equatable{
  const EmailStates();

  @override
  List<Object> get props => [];
}

class EmailInitial extends EmailStates{

}

class EmailFailure extends EmailStates{
 final String error;
 const EmailFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class EmailLoading extends EmailStates {

}

class EmailLoaded extends EmailStates {
  final SignInResponse signInResponse;
  const EmailLoaded({required this.signInResponse});
}

