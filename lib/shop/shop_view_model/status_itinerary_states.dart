import 'package:equatable/equatable.dart';

import '../model/status_itinerary_response.dart';

abstract class StatusItineraryStates extends Equatable{
  const StatusItineraryStates();

  @override
  List<Object> get props => [];
}

class StatusItineraryInitial extends StatusItineraryStates{

}

class StatusItineraryFailure extends StatusItineraryStates{
  final String error;
  const StatusItineraryFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class StatusItineraryLoading extends StatusItineraryStates {

}

class StatusItineraryLoaded extends StatusItineraryStates {
   var list;
   StatusItineraryLoaded({required this.list});
}

