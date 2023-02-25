import 'package:equatable/equatable.dart';
import 'package:sarya/create_intinerary/model/transport_response.dart';

abstract class TransportStates extends Equatable{
  const TransportStates();

  @override
  List<Object> get props => [];
}

class TransportInitial extends TransportStates{

}

class TransportFailure extends TransportStates{
  final String error;
  const TransportFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class TransportLoading extends TransportStates {

}

class TransportLoaded extends TransportStates {
  final  TransportResponse response;
  final List<bool> listOfBool;
  const TransportLoaded({required this.response, required this.listOfBool});
}

