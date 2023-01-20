import 'package:equatable/equatable.dart';
import 'package:sarya/authentication/signin/models/signin_response_model.dart';

import '../model/country_response.dart';


abstract class CountryStates extends Equatable{
  const CountryStates();

  @override
  List<Object> get props => [];
}

class CountryInitial extends CountryStates{

}

class CountryFailure extends CountryStates{
 final String error;
 const CountryFailure({required this.error});

 @override
 List<Object> get props => [error];
}

class CountryLoading extends CountryStates {

}


class CountryLoaded extends CountryStates {
  final List countries;
  const CountryLoaded({required this.countries});

}

