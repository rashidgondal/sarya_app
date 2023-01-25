import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../../authentication/signin/models/error_response_model.dart';
import '../../../../helper/show_snake_bar.dart';

class AuthInterceptors extends Interceptor {
  final Dio dio;
  AuthInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    log('response.statusCode......${response.statusCode}', name:'onResponse | AuthRepository');

    if (response.statusCode == 403 || response.statusCode == 401) {
      log('response.statusCode......${response.statusCode}', name:'onResponse | AuthRepository');

    } else if (response.statusCode == 206) {}
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    log('response.statusCode......${err.response?.statusCode}', name:'onError | AuthRepository');

    if (err.response?.statusCode == 403 || err.response?.statusCode == 401 || err.response?.statusCode == 409) {
      log('response.statusCode......${err.response?.statusCode}', name:'onError | AuthRepository');
      ErrorModel errorModel = ErrorModel.fromJson(err.response?.data);
      ShowSnackBar.showSnackBar(msg: errorModel.msg??'');
    } else {}
    handler.next(err);
  }
}
