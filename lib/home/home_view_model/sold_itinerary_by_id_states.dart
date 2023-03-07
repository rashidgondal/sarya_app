import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import 'package:sarya/home/itineraryByIDResponse.dart';

import '../model/sold_Itinerary_detail_response.dart';


abstract class SoldItineraryByIDStates extends Equatable{
  const SoldItineraryByIDStates();

  @override
  List<Object> get props => [];
}

class SoldItineraryByIDInitial extends SoldItineraryByIDStates{

}

class SoldItineraryByIDFailure extends SoldItineraryByIDStates{
  final String error;
  const SoldItineraryByIDFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class SoldItineraryByIDLoading extends SoldItineraryByIDStates {

}

class SoldItineraryByIDLoaded extends SoldItineraryByIDStates {
  final List<DetailResult> result;
   SoldItineraryByIDLoaded({required this.result});
}

