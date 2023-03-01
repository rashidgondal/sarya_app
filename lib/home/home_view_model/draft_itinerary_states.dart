import 'package:equatable/equatable.dart';


abstract class DraftItineraryStates extends Equatable{
  const DraftItineraryStates();

  @override
  List<Object> get props => [];
}

class DraftItineraryInitial extends DraftItineraryStates{

}

class DraftItineraryFailure extends DraftItineraryStates{
  final String error;
  const DraftItineraryFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class DraftItineraryLoading extends DraftItineraryStates {

}

class DraftItineraryLoaded extends DraftItineraryStates {
   final list;
   DraftItineraryLoaded({required this.list});
}

