import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import 'package:sarya/home/itineraryByIDResponse.dart';


abstract class PurchaseItineraryByIDStates extends Equatable{
  const PurchaseItineraryByIDStates();

  @override
  List<Object> get props => [];
}

class PurchaseItineraryByIDInitial extends PurchaseItineraryByIDStates{

}

class PurchaseItineraryByIDFailure extends PurchaseItineraryByIDStates{
  final String error;
  const PurchaseItineraryByIDFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class PurchaseItineraryByIDLoading extends PurchaseItineraryByIDStates {

}

class PurchaseItineraryByIDLoaded extends PurchaseItineraryByIDStates {
   PurchaseItineraryByIDLoaded();
}

