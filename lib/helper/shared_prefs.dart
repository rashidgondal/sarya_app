import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefs {
 
    String countriesResponseKey  = 'countries';


    Future getCountries() async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(countriesResponseKey)!);
  }

    Future<void> saveCountries(dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(countriesResponseKey, json.encode(value));
  }



}
