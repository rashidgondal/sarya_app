import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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