import 'package:equatable/equatable.dart';
import 'package:sarya/create_intinerary/model/air_port_response.dart';

abstract class AirportStates extends Equatable{
  const AirportStates();

  @override
  List<Object> get props => [];
}

class AirportInitial extends AirportStates{

}

class AirportFailure extends AirportStates{
  final String error;
  const AirportFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class AirportLoading extends AirportStates {

}

class AirportLoaded extends AirportStates {
  final List<AirportResponse> airportResponse;
  final List<bool> listOfBool;
  const AirportLoaded({required this.airportResponse, required this.listOfBool});
}

