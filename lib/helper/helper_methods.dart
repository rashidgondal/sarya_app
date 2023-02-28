import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

String zeroLeadValue({required String value}) {
  if (value.startsWith('0') && value.length > 1) {
    return value.replaceAll(RegExp(r'^0+(?=.)'), '');
  } else {
    return value;
  }
}

class Flags{
 static List listOfFlag=[];
 static getImages()async{
     listOfFlag = json.decode(await rootBundle.loadString('AssetManifest.json')).keys
        .where((String key) => key.contains('lib/assets/flags/'))
        .toList();
    print(listOfFlag.toString());
  }
}