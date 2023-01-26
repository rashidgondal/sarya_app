import 'package:equatable/equatable.dart';
import 'package:sarya/authentication/signin/models/signin_response_model.dart';


abstract class NameStates extends Equatable{
  const NameStates();

  @override
  List<Object> get props => [];
}

class NameInitial extends NameStates{

}

class NameFailure extends NameStates{
 final String error;
 const NameFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class NameLoading extends NameStates {

}

class NameLoaded extends NameStates {

}

