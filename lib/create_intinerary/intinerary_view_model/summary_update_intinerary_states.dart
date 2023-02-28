import 'package:equatable/equatable.dart';
import '../model/create_intinerary_response.dart';

abstract class SummaryUpdateIntineraryStates extends Equatable{
  const SummaryUpdateIntineraryStates();

  @override
  List<Object> get props => [];
}

class SummaryUpdateIntineraryInitial extends SummaryUpdateIntineraryStates{

}

class SummaryUpdateIntineraryFailure extends SummaryUpdateIntineraryStates{
 final String error;
 const SummaryUpdateIntineraryFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class SummaryUpdateIntineraryLoading extends SummaryUpdateIntineraryStates {

}

class SummaryUpdateIntineraryLoaded extends SummaryUpdateIntineraryStates {

}

