class ApiRoutes {

  static const String _base_URL = 'https://api2.sarya.app/';
  static const String _baseURL = 'http://api.sarya.app/';
  static const String baseURL = 'http://api.sarya.app/';

  //users
  static const String signup    = '${_baseURL}user/signup';
  static const String login     = '${_baseURL}user/login';
  static const String forgot    = '${_baseURL}user/forgotpwd';
  static const String reset     = '${_baseURL}user/resetpwd';
  static const String update    = 'user/update';


  //svg
  static const String avatar     = '${_baseURL}svg/avatar';
  static const String country    = '${_baseURL}country';

  //create intinerary
  static const String createIntinerary  = '${_base_URL}itinerary';
  static const String updateIntinerary  = '${_base_URL}itinerary/';
  static const String activity          = '${_base_URL}activity';
  static const String transport         = '${_base_URL}transport';
  static const String trip              = '${_base_URL}trip';
  static const String checklist         = '${_base_URL}checklist';



}
