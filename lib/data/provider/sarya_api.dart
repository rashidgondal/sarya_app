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
}
