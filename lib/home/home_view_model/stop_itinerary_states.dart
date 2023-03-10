import 'package:equatable/equatable.dart';


abstract class StopItineraryStates extends Equatable{
  const StopItineraryStates();

  @override
  List<Object> get props => [];
}

class StopItineraryInitial extends StopItineraryStates{

}

class StopItineraryFailure extends StopItineraryStates{
  final String error;
  const StopItineraryFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class StopItineraryLoading extends StopItineraryStates {

}

class StopItineraryLoaded extends StopItineraryStates {

}

