import 'package:flutter/material.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/dialoge_airport_cost.dart';
import '../../customWidgets/dialoge_calender.dart';
import '../../customWidgets/text_decorated_icon.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {

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
            centerTitle: true,
            title: const Text("Add your Contacts", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
            leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: AppColor.lightIndigo,),
              onPressed: () {
                // _navigationService.goBack();
              },),
            backgroundColor: AppColor.aquaCasper2,
            toolbarHeight: 55.0,
          ),
          body: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Column(
              children:  [
                const SizedBox(height: 15,),
                 InkWell(
                   onTap: (){

                   },
                   child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextDecoratedContainer(titleWidget:   Text(
                        'Sync Contacts',
                        style:  TextStyle(
                            fontSize: 15.0, color: AppColor.headingColor2)), iconImage: Icon(Icons.question_mark),),
                ),
                 ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextDecoratedContainer(titleWidget:   Text(
                      'Add by username',
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
