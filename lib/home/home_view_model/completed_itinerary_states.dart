import 'package:equatable/equatable.dart';


abstract class CompletedItineraryStates extends Equatable{
  const CompletedItineraryStates();

  @override
  List<Object> get props => [];
}

class CompletedItineraryInitial extends CompletedItineraryStates{

}

class CompletedItineraryFailure extends CompletedItineraryStates{
  final String error;
  const CompletedItineraryFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class CompletedItineraryLoading extends CompletedItineraryStates {

}

class CompletedItineraryLoaded extends CompletedItineraryStates {

}

