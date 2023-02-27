import 'package:equatable/equatable.dart';

import '../model/create_intinerary_response.dart';


abstract class CreateIntineraryStates extends Equatable{
  const CreateIntineraryStates();

  @override
  List<Object> get props => [];
}

class CreateIntineraryInitial extends CreateIntineraryStates{

}

class CreateIntineraryFailure extends CreateIntineraryStates{
 final String error;
 const CreateIntineraryFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class CreateIntineraryLoading extends CreateIntineraryStates {

}

class CreateIntineraryLoaded extends CreateIntineraryStates {

  const CreateIntineraryLoaded();
}

