import 'package:dio/dio.dart';

import '../../../../helper/userStorage.dart';

class TokenInterceptors extends Interceptor {
  // ignore: prefer_typing_uninitialized_variables
  var token;
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await UserSecureStorage()
        .getField('accessToken')
        .then((value) => token = value);
    options.headers['Authorization'] = 'x-access-token $token';

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    handler.next(err);
  }
}
