import 'package:flutter/material.dart';
import 'package:sarya/locator.dart';
import '../navigation/navigation_service.dart';


class ShowSnackBar{

static showSnackBar({required String msg}){
  ScaffoldMessenger.of(locator<NavigationService>().navigatorKey.currentContext!,).showSnackBar(SnackBar(content: Text(msg)));
}

}