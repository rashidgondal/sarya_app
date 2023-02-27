import 'dart:developer';

import '../../core/core.dart';

class SaryaAPI {
  SaryaAPI();
  final _http = HTTP.instance;

  /// Authentication
  Future<dynamic> signIn({required body}) async {
    try {
      String url = '';
      url = ApiRoutes.login;
      log('url......$url', name: 'signIn | SaryaAPI');

      return await _http.iPost(url, data: body);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signup({required body}) async {
    try {
      String url = '';
      url = ApiRoutes.signup;
      return await _http.iPost(url, data: body);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> forgetPassword({required body}) async {
    try {
      String url = '';
      url = ApiRoutes.forgot;
      return await _http.iPost(url, data: body);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> resetPassword({required body}) async {
    try {
      String url = '';
      url = ApiRoutes.reset;
      return await _http.iPost(url, data: body);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getAvatar() async {
    try {
      log('1.....', name: 'getAvatar | arayaaApi');

      String url = '';
      url = ApiRoutes.avatar;
      return await _http.iGet(url);
    } catch (e) {
      log('1.....${e.toString()}', name: 'cach | arayaaApi');

      rethrow;
    }
  }

  Future<dynamic> getCountries() async {
    try {
      log('1.....', name: 'getCountry | SaryaApi');

      String url = '';
      url = ApiRoutes.country;
      log('url.....$url', name: 'getCountry | SaryaApi');

      return await _http.iGet(url);
    } catch (e) {
      log('1.....${e.toString()}', name: 'catch | SaryaApi');

      rethrow;
    }
  }

  Future<dynamic> update({required body}) async {
    try {
      String url = '';
      url = ApiRoutes.update;
      return await _http.iPut(url, data: body);
    } catch (e) {
      rethrow;
    }
  }

  /// Create Intinerary
  Future<dynamic> createIntinerary({required body}) async{
    try {
      String url = '';
      url = ApiRoutes.createIntinerary;
      var result = await _http.iPost(url, data: body);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateIntinerary({required body, required String intineraryID}) async{
    try {
      String url = '';
      url = ApiRoutes.updateItinerary+intineraryID;
      return await _http.iPut(url, data: body);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getActivity() async{
    try {
      String url = '';
      url = ApiRoutes.activity;
      return await _http.iGet(url);
    } catch (e) {
      rethrow;
    }
  }


  Future<dynamic> getTransport() async{
    try {
      String url = '';
      url = ApiRoutes.transport;
      return await _http.iGet(url);
    } catch (e) {
      rethrow;
    }
  }


  Future<dynamic> getTrip() async{
    try {
      String url = '';
      url = ApiRoutes.trip;
      return await _http.iGet(url);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getCheckList() async{
    try {
      String url = '';
      url = ApiRoutes.checklist;
      return await _http.iGet(url);
    } catch (e) {
      rethrow;
    }
  }


  Future<dynamic> getAllItinerary() async{
    try {
      String url = '';
      url = ApiRoutes.getAllIntinerary;
      return await _http.iGet(url);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getItineraryByStatus({required bool status}) async{
    try {
      String url = '';
      url = ApiRoutes.getIntineraryByStatus+"$status";
      return await _http.iGet(url);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getPublicItinerary() async{
    try {
      String url = '';
      url = ApiRoutes.publicIntinerary;
      return await _http.iGet(url);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getSearchItinerary({required String searchedKeyword}) async{
    try {
      String url = '';
      url = ApiRoutes.searchIntinerary+searchedKeyword;
      return await _http.iGet(url);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getAirport() async{
    try {
      String url = '';
      url = ApiRoutes.airport;
      return await _http.iGet(url);
    } catch (e) {
      rethrow;
    }
  }



}
