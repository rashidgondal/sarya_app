import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import 'package:sarya/home/itineraryByIDResponse.dart';
import 'package:sarya/home/model/all_purchases_response.dart';


abstract class PurchaseItinerariesStates extends Equatable{
  const PurchaseItinerariesStates();

  @override
  List<Object> get props => [];
}

class PurchaseItineraryInitial extends PurchaseItinerariesStates{

}

class PurchaseItineraryFailure extends PurchaseItinerariesStates{
  final String error;
  const PurchaseItineraryFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class PurchaseItineraryLoading extends PurchaseItinerariesStates {

}

class PurchaseItineraryLoaded extends PurchaseItinerariesStates {
  final List<Purchased> purchasedItineraries;
  final List<Created> createdItineraries;
   PurchaseItineraryLoaded({required this.purchasedItineraries, required this.createdItineraries});
}

