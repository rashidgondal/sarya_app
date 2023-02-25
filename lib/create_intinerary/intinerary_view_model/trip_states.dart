import 'package:equatable/equatable.dart';
import '../model/trip_response.dart';

abstract class TripStates extends Equatable{
  const TripStates();

  @override
  List<Object> get props => [];
}

class TripInitial extends TripStates{

}

class TripFailure extends TripStates{
  final String error;
  const TripFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class TripLoading extends TripStates {

}

class TripLoaded extends TripStates {
  final TripResponse response;
  final List<bool> listOfBool;
  const TripLoaded({required this.response, required this.listOfBool});
}

