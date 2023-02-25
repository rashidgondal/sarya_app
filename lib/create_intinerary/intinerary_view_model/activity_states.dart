import 'package:equatable/equatable.dart';
import '../model/activity_type_response.dart';

abstract class ActivityStates extends Equatable{
  const ActivityStates();

  @override
  List<Object> get props => [];
}

class ActivityInitial extends ActivityStates{

}

class ActivityFailure extends ActivityStates{
  final String error;
  const ActivityFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class ActivityLoading extends ActivityStates {

}

class ActivityLoaded extends ActivityStates {
  final ActivityTypeResponse activityTypeResponse;
  final List<bool> listOfBool;
  const ActivityLoaded({required this.activityTypeResponse, required this.listOfBool});
}

