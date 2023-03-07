import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import 'package:sarya/home/itineraryByIDResponse.dart';
import 'package:sarya/home/model/sold_all_response.dart';


abstract class SoldItinerariesStates extends Equatable{
  const SoldItinerariesStates();

  @override
  List<Object> get props => [];
}

class SoldItineraryInitial extends SoldItinerariesStates{

}

class SoldItineraryFailure extends SoldItinerariesStates{
  final String error;
  const SoldItineraryFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class SoldItineraryLoading extends SoldItinerariesStates {

}

class SoldItineraryLoaded extends SoldItinerariesStates {
  final List<SoldAllResult> result;
   SoldItineraryLoaded({required this.result});
}

