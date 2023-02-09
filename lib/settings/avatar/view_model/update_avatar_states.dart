import 'package:equatable/equatable.dart';

abstract class UpdateAvatarStates extends Equatable{
  const UpdateAvatarStates();

  @override
  List<Object> get props => [];
}

class UpdateAvatarInitial extends UpdateAvatarStates{

}

class UpdateAvatarFailure extends UpdateAvatarStates{
  final String error;
  const UpdateAvatarFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class UpdateAvatarLoading extends UpdateAvatarStates {

}

class UpdateAvatarLoaded extends UpdateAvatarStates {

}

