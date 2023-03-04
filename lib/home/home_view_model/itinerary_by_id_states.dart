import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import 'package:sarya/home/itineraryByIDResponse.dart';


abstract class ItineraryByIDStates extends Equatable{
  const ItineraryByIDStates();

  @override
  List<Object> get props => [];
}

class ItineraryByIDInitial extends ItineraryByIDStates{

}

class ItineraryByIDFailure extends ItineraryByIDStates{
  final String error;
  const ItineraryByIDFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class ItineraryByIDLoading extends ItineraryByIDStates {

}

class ItineraryByIDLoaded extends ItineraryByIDStates {
   final ByIDResult byIDResult;
   final List<LatLng> listOfLatLng;
   ItineraryByIDLoaded({required this.byIDResult, required this.listOfLatLng});
}

