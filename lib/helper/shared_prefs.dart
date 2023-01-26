import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefs {
 
   final String _countriesResponseKey  = 'Countries';
   final String _profilePathKey        = 'Profile pic path';
   final String _saveUserDataKey       = 'Save user';


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

   Future<void> clearCache() async {
     final prefs = await SharedPreferences.getInstance();
     prefs.clear();
   }



}
