import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/authentication/signin/models/signin_response_model.dart';
import 'package:sarya/authentication/signup/model/signup_request.dart';
import 'package:sarya/authentication/signup/model/signup_response.dart';
import 'package:sarya/authentication/signup/signup_view_model/country_states.dart';
import 'package:sarya/authentication/signup/signup_view_model/signup_states.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/navigation/router_path.dart';
import '../../../data/repository/authentication_repository/auth_repo.dart';
import '../../../navigation/navigation_service.dart';
import '../model/country_response.dart';

class CountryCubits extends Cubit<CountryStates> {
  CountryCubits() : super(CountryInitial());

  Future getCountries() async {
    try {
      log("CountryLoading..............1");

      emit(CountryLoading());

      final List countries = await AuthRepository.instance.countries() ;
      SharedPrefs sharedPrefs = SharedPrefs();
      sharedPrefs.saveCountries(countries);

      emit(CountryLoaded(
        countries: countries,
      ));

    } catch (e) {
      log("CountryLoaded..............catch");

      emit(const CountryFailure(error: ''));
    }
  }
}
