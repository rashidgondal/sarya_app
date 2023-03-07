import 'package:equatable/equatable.dart';
import 'package:sarya/authentication/signin/models/signin_response_model.dart';
import 'package:sarya/authentication/signup/model/avatar_response.dart';


abstract class AvatarStates extends Equatable{
  const AvatarStates();

  @override
  List<Object> get props => [];
}

class AvatarInitial extends AvatarStates{

}

class AvatarFailure extends AvatarStates{
 final String error;
 const AvatarFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class AvatarLoading extends AvatarStates {

}


class AvatarLoaded extends AvatarStates {
   final AvatarResponse avatarResponse;

   const AvatarLoaded({ required this.avatarResponse});

   @override
   List<Object> get props => [];
}

