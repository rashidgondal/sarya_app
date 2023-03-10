import 'package:equatable/equatable.dart';
import 'package:sarya/home/itineraryByIDResponse.dart';

import '../../pinLocationMap.dart';

abstract class ItineraryByIDStates extends Equatable {
  const ItineraryByIDStates();

  @override
  List<Object> get props => [];
}

class ItineraryByIDInitial extends ItineraryByIDStates {}

class ItineraryByIDFailure extends ItineraryByIDStates {
  final String error;
  const ItineraryByIDFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class ItineraryByIDLoading extends ItineraryByIDStates {}

class ItineraryByIDLoaded extends ItineraryByIDStates {
  final ByIDResult byIDResult;
  final  List<List<FlagInformation>>? listOfLatLng;
  final ByIDState? state;
  ItineraryByIDLoaded({required this.byIDResult, this.listOfLatLng, this.state});
}
