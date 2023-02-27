import 'package:equatable/equatable.dart';

import '../model/public_itinerary_response.dart';



abstract class PublicItineraryStates extends Equatable{
  const PublicItineraryStates();

  @override
  List<Object> get props => [];
}

class PublicItineraryInitial extends PublicItineraryStates{

}

class PublicItineraryFailure extends PublicItineraryStates{
  final String error;
  const PublicItineraryFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class PublicItineraryLoading extends PublicItineraryStates {

}

class PublicItineraryLoaded extends PublicItineraryStates {
  final PublicItineraryResponse publicItineraryResponse;
  const PublicItineraryLoaded({required this.publicItineraryResponse});
}

