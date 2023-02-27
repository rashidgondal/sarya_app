import 'package:equatable/equatable.dart';

import '../model/search_itinerary_response.dart';


abstract class SearchItineraryStates extends Equatable{
  const SearchItineraryStates();

  @override
  List<Object> get props => [];
}

class SearchItineraryInitial extends SearchItineraryStates{

}

class SearchItineraryFailure extends SearchItineraryStates{
  final String error;
  const SearchItineraryFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class SearchItineraryLoading extends SearchItineraryStates {

}

class SearchItineraryLoaded extends SearchItineraryStates {
  final SearchItineraryResponse searchItineraryResponse;
  const SearchItineraryLoaded({required this.searchItineraryResponse});
}

