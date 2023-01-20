import 'package:equatable/equatable.dart';
import 'package:sarya/authentication/signin/models/signin_response_model.dart';


abstract class SignupStates extends Equatable{
  const SignupStates();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupStates{

}

class SignupFailure extends SignupStates{
 final String error;
 const SignupFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class SignupLoading extends SignupStates {

}

class SignupSaveData extends SignupStates {
  final String userName;
  final String password;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String birthday;
  final String nationality;
  final String country;
  final String phone;
  final String hobbies;
  final String favCountry;
  final String extraInfo;

  const SignupSaveData(
      {
        required  this.userName,
        required  this.password,
        required  this.email,
        required  this.firstName,
        required  this.lastName,
        required  this.gender,
        required  this.birthday,
        required  this.nationality,
        required this.country,
        required this.phone,
        required this.hobbies,
        required this.favCountry,
        required this.extraInfo,
      });


  @override
  List<Object> get props => [userName, password, email, firstName, lastName, gender, birthday, nationality, country, phone, hobbies, favCountry, extraInfo];

}

class SignupLoaded extends SignupStates {

}

