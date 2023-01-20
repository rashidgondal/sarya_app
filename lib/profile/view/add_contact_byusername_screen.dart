import 'package:flutter/material.dart';
import 'package:sarya/customWidgets/custom_text_field.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/dialoge_airport_cost.dart';
import '../../customWidgets/dialoge_calender.dart';
import '../../customWidgets/text_decorated_icon.dart';

class AddContactByUsername extends StatefulWidget {
  const AddContactByUsername({Key? key}) : super(key: key);

  @override
  State<AddContactByUsername> createState() => _AddContactByUsernameState();
}

class _AddContactByUsernameState extends State<AddContactByUsername> {

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
            title: const Text("Add by username", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
            leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: AppColor.lightIndigo,),
              onPressed: () {
                // _navigationService.goBack();
              },),
            backgroundColor: AppColor.aquaCasper2,
            toolbarHeight: 55.0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              physics:const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 15,),
                  CustomTextField(maxLine: 1, textEditingController: textEditingController, size: size, textInputType: TextInputType.text, hintText: 'Search..', icon:const  Icon(Icons.question_mark))

              /*    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index){
                    return  InkWell(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>  const SelectDate());

                      },
                      child:  TextDecoratedContainer(titleWidget:  const Text(
                          'Abc',
                          style:  TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2)), iconImage: Icon(Icons.question_mark),
                        icon:  Container(
                        height: 15, width: 15,color: AppColor.colorBlue,
                          child:const  Center(child: Icon(Icons.add, size: 15, color: AppColor.whiteColor,),),
                      ),),
                    );
                  }),*/
                ],
              )
              ),
          ),
          ),
        ),

    );
  }



}
