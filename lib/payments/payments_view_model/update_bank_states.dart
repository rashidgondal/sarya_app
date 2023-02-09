import 'package:equatable/equatable.dart';
import 'package:sarya/authentication/signin/models/signin_response_model.dart';


abstract class UpdateBankStates extends Equatable{
  const UpdateBankStates();

  @override
  List<Object> get props => [];
}

class UpdateBankInitial extends UpdateBankStates{

}

class UpdateBankFailure extends UpdateBankStates{
 final String error;
 const UpdateBankFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class UpdateBankLoading extends UpdateBankStates {

}

class UpdateBankLoaded extends UpdateBankStates {

}

