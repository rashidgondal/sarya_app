import 'package:equatable/equatable.dart';

import '../model/all_itinerary_response.dart';

abstract class AllItineraryStates extends Equatable{
  const AllItineraryStates();

  @override
  List<Object> get props => [];
}

class AllItineraryInitial extends AllItineraryStates{

}

class AllItineraryFailure extends AllItineraryStates{
  final String error;
  const AllItineraryFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class AllItineraryLoading extends AllItineraryStates {

}

class AllItineraryLoaded extends AllItineraryStates {
  final AllItineraryResponse allItineraryResponse;
  const AllItineraryLoaded({required this.allItineraryResponse});
}

