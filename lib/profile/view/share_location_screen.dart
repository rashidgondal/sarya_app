import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/dialog_block_user.dart';
import '../../customWidgets/dialog_save_username.dart';
import '../../customWidgets/dialoge_share_location.dart';

class ShareLocation extends StatefulWidget {
  const ShareLocation({Key? key}) : super(key: key);

  @override
  State<ShareLocation> createState() => _ShareLocationState();
}

class _ShareLocationState extends State<ShareLocation> {


  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {

      showDialog(
          context: context,
          builder: (BuildContext context) =>
          const SaveUsername()
      );
    });



  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: AppBar(
            elevation: 0,
            title:const Text("Me", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),

            leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: AppColor.lightIndigo,),
              onPressed: () {
                // _navigationService.goBack();
              },),
            backgroundColor: AppColor.aquaCasper2,
            toolbarHeight: 55.0,
            actions: [
              IconButton(icon: const Icon(Icons.question_mark, color: AppColor.lightIndigo,),
                onPressed: () {
                  // _navigationService.goBack();
                },),

            ],
          ),
          body: Container(),
        ),
      ),
    );
  }
}
