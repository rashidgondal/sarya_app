import 'package:equatable/equatable.dart';
import 'package:sarya/authentication/signin/models/signin_response_model.dart';


abstract class PhoneStates extends Equatable{
  const PhoneStates();

  @override
  List<Object> get props => [];
}

class PhoneInitial extends PhoneStates{

}

class PhoneFailure extends PhoneStates{
 final String error;
 const PhoneFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class PhoneLoading extends PhoneStates {

}

class PhoneLoaded extends PhoneStates {
}

