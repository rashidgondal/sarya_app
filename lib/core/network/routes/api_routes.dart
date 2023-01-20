class ApiRoutes {

  static const String _baseURL = 'http://api.sarya.app/';

  //users
  static const String signup    = '${_baseURL}user/signup';
  static const String login     = '${_baseURL}user/login';
  static const String update    = '${_baseURL}user/update';
  static const String forgot    = '${_baseURL}user/forgotpwd';
  static const String reset     = '${_baseURL}user/resetpwd';

  //svg
  static const String avatar     = '${_baseURL}svg/avatar';
  static const String country     = '${_baseURL}country';



}
