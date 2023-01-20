import 'package:flutter/material.dart';
import 'package:sarya/customWidgets/text_decorated_icon.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../navigation/navigation_service.dart';

class DrawerScreen extends StatefulWidget {
   const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {


  late NavigationService _navigationService;

  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();

  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.aquaCasper2,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(150),
              child:  Container(

                color: AppColor.aquaCasper2,
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics:const  BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 15,),
                 InkWell(
                   onTap: (){

                   },
                   child:const Padding(
                    padding:  EdgeInsets.only(left: 30, right: 30),
                    child:   TextDecoratedContainer(titleWidget: Text(
                      'Account ',
                      style:  TextStyle(
                          fontSize: 15.0, color: AppColor.headingColor2),
                    ), iconImage: Icon(Icons.question_mark),),
                ),
                 ),
                const SizedBox(height: 1,),
                InkWell(
                  onTap: (){

                  },
                   child:const Padding(
                    padding:  EdgeInsets.only(left: 30, right: 30),
                    child:   TextDecoratedContainer(titleWidget: Text(
                      'Share my location ',
                      style:  TextStyle(
                          fontSize: 15.0, color: AppColor.headingColor2),
                    ), iconImage: Icon(Icons.question_mark),),
                ),
                 ),
                const SizedBox(height: 1,),
                InkWell(
                  onTap: (){

                  },
                   child:const Padding(
                    padding:  EdgeInsets.only(left: 30, right: 30),
                    child:   TextDecoratedContainer(titleWidget: Text(
                      'Add Bank Detail',
                      style:  TextStyle(
                          fontSize: 15.0, color: AppColor.headingColor2),
                    ),
                      iconImage: Icon(Icons.question_mark),
                    icon: Icon(Icons.arrow_forward_ios,color: AppColor.lightIndigo,),
                    ),
                ),
                 ),
                const SizedBox(height: 1,),
                InkWell(
                  onTap: (){

                  },
                   child:const Padding(
                    padding:  EdgeInsets.only(left: 30, right: 30),
                    child:   TextDecoratedContainer(titleWidget: Text(
                      'Contacts',
                      style:  TextStyle(
                          fontSize: 15.0, color: AppColor.headingColor2),
                    ), iconImage: Icon(Icons.question_mark),),
                ),
                 ),
                const SizedBox(height: 1,),
                InkWell(
                  onTap: (){

                  },
                   child:const Padding(
                    padding:  EdgeInsets.only(left: 30, right: 30),
                    child:   TextDecoratedContainer(titleWidget: Text(
                      'Help ',
                      style:  TextStyle(
                          fontSize: 15.0, color: AppColor.headingColor2),
                    ), iconImage: Icon(Icons.question_mark),),
                ),
                 ),
                const SizedBox(height: 1,),
                InkWell(
                  onTap: (){

                  },
                   child:const Padding(
                    padding:  EdgeInsets.only(left: 30, right: 30),
                    child:   TextDecoratedContainer(titleWidget: Text(
                      'Setting',
                      style:  TextStyle(
                          fontSize: 15.0, color: AppColor.headingColor2),
                    ),
                      iconImage: Icon(Icons.question_mark),

                    ),
                ),
                 ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
