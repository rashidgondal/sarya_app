import 'package:equatable/equatable.dart';

import '../model/checklist_response.dart';

abstract class CheckListStates extends Equatable{
  const CheckListStates();

  @override
  List<Object> get props => [];
}

class CheckListInitial extends CheckListStates{

}

class CheckListFailure extends CheckListStates{
  final String error;
  const CheckListFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class CheckListLoading extends CheckListStates {

}

class CheckListLoaded extends CheckListStates {
  final CheckListResponse response;
  final List<bool> boolList;
  const CheckListLoaded({required this.response, required this.boolList});
}

