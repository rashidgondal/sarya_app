import 'package:equatable/equatable.dart';


abstract class CreatedItineraryStates extends Equatable{
  const CreatedItineraryStates();

  @override
  List<Object> get props => [];
}

class CreatedItineraryInitial extends CreatedItineraryStates{

}

class CreatedItineraryFailure extends CreatedItineraryStates{
  final String error;
  const CreatedItineraryFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class CreatedItineraryLoading extends CreatedItineraryStates {

}

class CreatedItineraryLoaded extends CreatedItineraryStates {
   final list;
   CreatedItineraryLoaded({required this.list});
}

