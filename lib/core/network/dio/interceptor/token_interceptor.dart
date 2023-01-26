import 'package:dio/dio.dart';
import 'package:sarya/helper/shared_prefs.dart';

import '../../../../helper/userStorage.dart';

class TokenInterceptors extends Interceptor {
  // ignore: prefer_typing_uninitialized_variables
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    SharedPrefs prefs = SharedPrefs();
    var token = await prefs.getToken();
    print("tokent ..........$token");
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
