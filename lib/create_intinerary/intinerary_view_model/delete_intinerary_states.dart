import 'package:equatable/equatable.dart';

abstract class DeleteIntineraryStates extends Equatable{
  const DeleteIntineraryStates();

  @override
  List<Object> get props => [];
}

class DeleteIntineraryInitial extends DeleteIntineraryStates{

}

class DeleteIntineraryFailure extends DeleteIntineraryStates{
 final String error;
 const DeleteIntineraryFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class DeleteIntineraryLoading extends DeleteIntineraryStates {

}

class DeleteIntineraryLoaded extends DeleteIntineraryStates {

}

