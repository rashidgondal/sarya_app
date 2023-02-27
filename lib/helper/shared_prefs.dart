import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefs {
 
   final String _countriesResponseKey  = 'Countries';
   final String _profilePathKey        = 'Profile pic path';
   final String _saveUserDataKey       = 'Save user';
   final String _tokenKey              = 'Save token';
   final String _itineraryIDKey        = 'Save Key';
   final String _destinationCountryKey  = 'Destination Country Key';



   Future getDestinationCountries() async {
     final prefs = await SharedPreferences.getInstance();
     return json.decode(prefs.getString(_destinationCountryKey)!);
   }

   Future<void> saveDestinationCountries(dynamic value) async {
     final prefs = await SharedPreferences.getInstance();
     prefs.setString(_destinationCountryKey, json.encode(value));
   }

   Future getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(_saveUserDataKey)!);
  }

    Future<void> saveUser(dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_saveUserDataKey, json.encode(value));
  }

    Future getCountries() async {
      final prefs = await SharedPreferences.getInstance();
      return json.decode(prefs.getString(_countriesResponseKey)!);
    }

    Future<void> saveCountries(dynamic value) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(_countriesResponseKey, json.encode(value));
    }

    Future getProfilePath() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_profilePathKey);
    }

    Future<void> saveProfilePath(dynamic value) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(_profilePathKey, value);
    }


   Future getToken() async {
     final prefs = await SharedPreferences.getInstance();
     return prefs.getString(_tokenKey);
   }

   Future<void> saveToken(dynamic value) async {
     final prefs = await SharedPreferences.getInstance();
     prefs.setString(_tokenKey, value);
   }

   Future getItineraryID() async {
     final prefs = await SharedPreferences.getInstance();
     return prefs.getString(_itineraryIDKey);
   }

   Future<void> saveItineraryID(dynamic value) async {
     final prefs = await SharedPreferences.getInstance();
     prefs.setString(_itineraryIDKey, value);
   }





   Future<void> clearCache() async {
     final prefs = await SharedPreferences.getInstance();
     prefs.clear();
   }



}
