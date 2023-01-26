import 'package:flutter/material.dart';
import 'package:sarya/customWidgets/custom_text_field.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../../customWidgets/text_decorated_icon.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {

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
            title: const Text("Email", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
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
                child:   Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        SizedBox(
                            width: size.width/1.2,
                            child:const Text("You can use this email address to log in, or for password recovery.", style: TextStyle(fontSize: 14, color: AppColor.headingColor2),)),
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
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: (){

                      },
                      child:const TextDecoratedContainer(

                        titleWidget: Text(
                          'Sarya@gmail.com',
                          style:  TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),)),
                ),


                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      const Text(
                        "Your email is verified",
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColor.headingColor2),
                      ),
                      const SizedBox(width: 10,),
                      Theme(

                        data: Theme.of(context).copyWith(
                            unselectedWidgetColor:  AppColor.aquaCasper),
                        child:Checkbox(
                          value: true,
                          onChanged: (bool? value) {},
                          focusColor:  AppColor.aquaCasper,
                          activeColor: AppColor.aquaCasper,

                        ),
                      )
                    ],
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
