import 'package:equatable/equatable.dart';
import '../model/create_intinerary_response.dart';

abstract class UpdateIntineraryStates extends Equatable{
  const UpdateIntineraryStates();

  @override
  List<Object> get props => [];
}

class UpdateIntineraryInitial extends UpdateIntineraryStates{

}

class UpdateIntineraryFailure extends UpdateIntineraryStates{
 final String error;
 const UpdateIntineraryFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class UpdateIntineraryLoading extends UpdateIntineraryStates {

}

class UpdateIntineraryLoaded extends UpdateIntineraryStates {
  final CreateIntineraryResponse createIntineraryResponse;
  const UpdateIntineraryLoaded({required this.createIntineraryResponse});
}

