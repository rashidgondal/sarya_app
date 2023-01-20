import '/core/network/network.dart';
import '/core/core.dart';

class AuthenticationAPI {
  AuthenticationAPI();
  final http = HTTPAUTH.instance;

  Future<dynamic> loginUserPassword({required body}) async {
    try {
      return await http.iPost(ApiRoutes.login, data: body);
    } catch (e) {
      rethrow;
    }
  }
/*
  Future<dynamic> changePassword({required body}) async {
    try {
      return await http.iPost(ApiRoutes.changePassUrl, data: body);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> forgotPassword({required body}) async {
    try {
      return await http.iPost(ApiRoutes.forgotPassUrl, data: body);
    } catch (e) {
      rethrow;
    }
  }*/
}
