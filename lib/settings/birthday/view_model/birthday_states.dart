import 'package:equatable/equatable.dart';
import 'package:sarya/authentication/signin/models/signin_response_model.dart';


abstract class BirthdayStates extends Equatable{
  const BirthdayStates();

  @override
  List<Object> get props => [];
}

class BirthdayInitial extends BirthdayStates{

}

class BirthdayFailure extends BirthdayStates{
 final String error;
 const BirthdayFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class BirthdayLoading extends BirthdayStates {

}

class BirthdayLoaded extends BirthdayStates {
}

