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
    options.headers['x-access-token'] = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiJuMGszZlgiLCJ1c2VyTmFtZSI6InRlc3R1c2VybmF0c19tcyIsImVtYWlsIjoiaGF4aWhhNzI0MkBqb2JzZmVlbC5jb20iLCJpYXQiOjE2NzYyMzAwNjd9.P-g7mVmp9jrJnyqORVlB1vtXteltlVi93CdZYfHGd_c';

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
