import 'package:equatable/equatable.dart';


abstract class StartItineraryStates extends Equatable{
  const StartItineraryStates();

  @override
  List<Object> get props => [];
}

class StartItineraryInitial extends StartItineraryStates{

}

class StartItineraryFailure extends StartItineraryStates{
  final String error;
  const StartItineraryFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class StartItineraryLoading extends StartItineraryStates {

}

class StartItineraryLoaded extends StartItineraryStates {

}

