import 'package:flutter/material.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/dialoge_airport_cost.dart';
import '../../customWidgets/dialoge_calender.dart';
import '../../customWidgets/text_decorated_icon.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({Key? key}) : super(key: key);

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {

TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: AppBar(
            elevation: 0,
            title: const Text("Birthday", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
            leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: AppColor.lightIndigo,),
              onPressed: () {
                // _navigationService.goBack();
              },),
            backgroundColor: AppColor.aquaCasper2,
            toolbarHeight: 55.0,
            bottom: PreferredSize(
              preferredSize:const  Size.fromHeight(60),
              child: Container(
                height: 50,
                width: size.width,
                color: AppColor.colorLiteGrey,
                child:Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(
                          width: size.width/1.2,
                          child: const Text("Insert correct date, you are only allowed to change your birthday a limited number of times", style: TextStyle(fontSize: 14, color: AppColor.headingColor2),)),


                    ],
                  ),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Column(
              children:  [
                const SizedBox(height: 15,),
                 InkWell(
                   onTap: (){
                     showDialog(
                         context: context,
                         builder: (BuildContext context) =>  const SelectDate());

                   },
                   child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextDecoratedContainer(titleWidget:   Text(
                        '01/01/2022',
                        style:  TextStyle(
                            fontSize: 15.0, color: AppColor.headingColor2)), iconImage: Icon(Icons.question_mark),),
                ),
                 ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextDecoratedContainer(titleWidget:   Text(
                      'Birthday party',
                      style:  TextStyle(
                          fontSize: 15.0, color: AppColor.headingColor2)), iconImage: Icon(Icons.question_mark),),
                )



              ],
            ),
          ),
        ),
      ),
    );
  }



}
