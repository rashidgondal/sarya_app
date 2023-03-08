import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';

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

class CurrentLocation {
  static double lat=0.0;
  static double lng=0.0;

 static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

}

void cupertino_picker_sheet(
    {required BuildContext context,
      required List<Widget> child_items,
      required Function(int) selected_index}) {
  showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CupertinoPicker(
            backgroundColor: Colors.white,
            itemExtent: 30,
            scrollController: FixedExtentScrollController(initialItem: 1),
            children: child_items,
            onSelectedItemChanged: selected_index,
          ),
        ),
      ));
}