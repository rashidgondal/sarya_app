import 'package:equatable/equatable.dart';
import '../model/create_intinerary_response.dart';

abstract class AllDeleteIntineraryStates extends Equatable{
  const AllDeleteIntineraryStates();

  @override
  List<Object> get props => [];
}

class AllDeleteIntineraryInitial extends AllDeleteIntineraryStates{

}

class AllDeleteIntineraryFailure extends AllDeleteIntineraryStates{
 final String error;
 const AllDeleteIntineraryFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class AllDeleteIntineraryLoading extends AllDeleteIntineraryStates {

}

class AllDeleteIntineraryLoaded extends AllDeleteIntineraryStates {

}

