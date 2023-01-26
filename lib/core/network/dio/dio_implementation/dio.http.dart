import 'dart:convert';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import '../../../../helper/shared_prefs.dart';
import '../connectivity/dio_connectivity_request_retrier.dart';
import '../interceptor/app_interceptors.dart';
import '/core/core.dart';

class HTTP implements IHTTP {
  final Dio _dio = Dio();
  HTTP._privateConstructor() {
    _dio.interceptors.add(AuthInterceptors(_dio));
    _dio.interceptors.add(TokenInterceptors());
  }

  static final HTTP _instance = HTTP._privateConstructor();

  static HTTP get instance => _instance;

  @override
  Future<dynamic> iDelete(String url,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      var res =
          await _dio.delete(url, data: data, queryParameters: queryParameters);
      var result = ApiResponse().response(res);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> iGet(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      log('1.....', name:'iGet | arayaaApi');

      var res = await _dio.get(url, queryParameters: queryParameters);
      log('2.....', name:'iGet | arayaaApi');

      var result = ApiResponse().response(res);
      return result;
    } catch (e) {
      log('1.....${e.toString()}', name:'catch | iget');

      rethrow;
    }
  }

  @override
  Future<dynamic> iPost(String url,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await _dio.post(url,
          data: data, queryParameters: queryParameters);
      var result = ApiResponse().response(res);
      return result;
    } catch (e) {
      log('catch......${e.toString()}', name:'iPost | AuthRepository');

      rethrow;
    }
  }

  @override
  Future<dynamic> iPut(String url,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await _dio.put(url,
          data: json.encode(data), queryParameters: queryParameters);
      var result = ApiResponse().response(res);
      return result;
    } catch (e) {
      rethrow;
    }
  }


  @override
  Future<dynamic> iPostRequest(String url,
      {Map<String, dynamic>? data,
        Map<String, dynamic>? queryParameters}) async {
    try {

      SharedPrefs prefs = SharedPrefs();
      var token = await prefs.getToken();
      var res = await dioInstance(token).post(url, data: data);

      var result = ApiResponse().response(res);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}

class HTTPAUTH with IHTTP {
  final Dio _dio = Dio();
  HTTPAUTH._privateConstructor() {

  }

  static final HTTPAUTH _instance = HTTPAUTH._privateConstructor();

  static HTTPAUTH get instance => _instance;

  @override
  Future<dynamic> iDelete(String url,
      {Map<String, dynamic>? data,
        Map<String, dynamic>? queryParameters}) async {
    try {
      var res =
      await _dio.delete(url, data: data, queryParameters: queryParameters);
      var result = ApiResponse().response(res);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> iGet(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await _dio.get(url, queryParameters: queryParameters);
      var result = ApiResponse().response(res);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> iPost(String url,
      {Map<String, dynamic>? data,
        Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await _dio.post(url,
          data: data, queryParameters: queryParameters);
      var result = ApiResponse().response(res);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> iPut(String url,
      {Map<String, dynamic>? data,
        Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await _dio.put(url,
          data: json.encode(data), queryParameters: queryParameters);
      var result = ApiResponse().response(res);
      return result;
    } catch (e) {
      rethrow;
    }
  }


  @override
  Future<dynamic> iPostRequest(String url,
      {Map<String, dynamic>? data,
        Map<String, dynamic>? queryParameters}) async {
    try {

      SharedPrefs prefs = SharedPrefs();
      var token = await prefs.getToken();
      var res = await dioInstance(token).post(url, data: data);

      var result = ApiResponse().response(res);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}



Dio dioInstance(String accessCode) {

  Dio dio = Dio();
  BaseOptions options =  BaseOptions(
      baseUrl: ApiRoutes.baseURL,
      headers: {'x-access-token': '$accessCode'}
  );

  dio.options = options;
  return dio;
}