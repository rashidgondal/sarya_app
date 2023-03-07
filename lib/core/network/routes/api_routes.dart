class ApiRoutes {

  static const String _base_URL = 'https://api.sarya.app/';
  static const String baseURL = 'https://api.sarya.app/';

  static const String picBaseURL = 'https://cdn.sarya.app/itinerary/';

  //users
  static const String signup    = '${_base_URL}user/signup';
  static const String login     = '${_base_URL}user/login';
  static const String forgot    = '${_base_URL}user/forgotpwd';
  static const String reset     = '${_base_URL}user/resetpwd';
  static const String update    = 'user/update';


  //svg
  static const String avatar     = '${_base_URL}avatar';
  static const String country    = '${_base_URL}country';

  //create intinerary
  static const String createIntinerary  = '${_base_URL}itinerary';
  static const String updateIntinerary  = '${_base_URL}itinerary/';
  static const String activity          = '${_base_URL}activity';
  static const String transport         = '${_base_URL}transport';
  static const String trip              = '${_base_URL}trip';
  static const String checklist         = '${_base_URL}checklist';
  static const String updateItinerary   = '${_base_URL}itinerary/';

  // created intineraries

  static const String getAllIntinerary            = '${_base_URL}itinerary';
  static const String getIntineraryByStatus       = '${_base_URL}itinerary?live=';
  static const String publicIntinerary            = '${_base_URL}itinerary/public';
  static const String searchIntinerary            = '${_base_URL}itinerary/public?search=';
  static const String deleteIntinerary            = '${_base_URL}itinerary/';
  static const String allDraftDeleteIntinerary    = '${_base_URL}itinerary/drafted';

  static const String getIntineraryByID        = '${_base_URL}itinerary/';

  //airport data api
  static const String airport        = 'https://airlabs.co/api/v9/airports?iata_code=CDG&api_key=44d8a4aa-4c02-4a5b-9fd2-f21717ee9d4c';

  // purchases api
  static const String getAllPurchase            = '${_base_URL}itinerary';
  static const String purchase                  = '${_base_URL}itinerary/purchase';
  static const String purchaseItineraryDetail   = '${_base_URL}itinerary/purchase/';
  static const String soldItinerary             = '${_base_URL}itinerary/sold';
  static const String soldItineraryDetail       = '${_base_URL}itinerary/sold/';

}
