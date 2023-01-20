import 'package:flutter/material.dart';
import 'package:sarya/theme/color_scheme.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: AppBar(
            elevation: 0,
            title: Row(
              children: const[
                Icon(Icons.question_mark, color: AppColor.colorBlack,),
                 SizedBox(width: 10,),
                 Text("Friends", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
              ],
            ),
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
              IconButton(icon: const Icon(Icons.question_mark, color: AppColor.lightIndigo,),
                onPressed: () {
                  // _navigationService.goBack();
                },),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Container(
                color: AppColor.colorLiteGrey,
                height: 60,
                child:const ListTile(
                  leading: Icon(Icons.question_mark),
                  horizontalTitleGap: 0,
                  title: Text("Team Sarya: Welcome Sara! Let us show you some of the features!", style: TextStyle(fontSize: 14, color: AppColor.headingColor2),),

                ),
              ),
            ),
          ),
          body: Container(),
        ),
      ),
    );
  }
}
