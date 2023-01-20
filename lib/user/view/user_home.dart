import 'package:flutter/material.dart';
import 'package:sarya/customWidgets/text_decorated_icon.dart';
import 'package:sarya/theme/color_scheme.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: AppBar(
            backgroundColor: AppColor.whiteColor,
            elevation: 0,
            toolbarHeight: 0,
            bottom: PreferredSize(
              preferredSize:const Size.fromHeight(240),
              child: Container(
                color: AppColor.aquaCasper2,
                height: 240,
                width: size.width,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            color: AppColor.lightIndigo,
                          ),
                          const  SizedBox(height: 15,),

                          const Text("Lujain", style: TextStyle(fontSize: 29, color: AppColor.colorBlack,fontWeight: FontWeight.w700),)
                          ,
                          const  SizedBox(height: 15,)
                          ,const Text("sara.sara | 25 friends", style: TextStyle(fontSize: 13, color: AppColor.headingColor2,fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ),
                    const Padding(
                      padding:  EdgeInsets.only(right: 18.0, top: 12),
                      child:  Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.close, size: 25,color: AppColor.colorBlack,),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          body: Container(
            padding:const  EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 15,),
                  const TextDecoratedContainer(titleWidget:
                  Text("Share my location", style: TextStyle(fontSize: 15, color: AppColor.headingColor2,fontWeight: FontWeight.w400),)
                    , iconImage: Icon(Icons.question_mark),),
                  const TextDecoratedContainer(titleWidget:
                  Text("Share Username", style: TextStyle(fontSize: 15, color: AppColor.headingColor2,fontWeight: FontWeight.w400),)
                    , iconImage: Icon(Icons.question_mark)),
                  const TextDecoratedContainer(titleWidget:
                  Text("Block", style: TextStyle(fontSize: 15, color: AppColor.headingColor2,fontWeight: FontWeight.w400),)
                    , iconImage: Icon(Icons.question_mark),),
                  const TextDecoratedContainer(titleWidget:
                  Text("Remove Friend", style: TextStyle(fontSize: 15, color: AppColor.headingColor2,fontWeight: FontWeight.w400),)
                    , iconImage: Icon(Icons.question_mark),),
                        TextDecoratedContainer(
                    titleWidget:const Text("Mute", style: TextStyle(fontSize: 15, color: AppColor.headingColor2,fontWeight: FontWeight.w400),)
                    , iconImage:const Icon(Icons.question_mark),
                    icon: Switch(value: true,onChanged: (v){

                    },),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
