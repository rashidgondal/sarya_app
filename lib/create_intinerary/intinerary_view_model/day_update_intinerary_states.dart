import 'package:equatable/equatable.dart';
import '../model/create_intinerary_response.dart';

abstract class DayUpdateIntineraryStates extends Equatable{
  const DayUpdateIntineraryStates();

  @override
  List<Object> get props => [];
}

class DayUpdateIntineraryInitial extends DayUpdateIntineraryStates{

}

class DayUpdateIntineraryFailure extends DayUpdateIntineraryStates{
 final String error;
 const DayUpdateIntineraryFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class DayUpdateIntineraryLoading extends DayUpdateIntineraryStates {

}

class DayUpdateIntineraryLoaded extends DayUpdateIntineraryStates {

}

