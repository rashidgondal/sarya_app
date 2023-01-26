import 'package:flutter/material.dart';
import 'package:sarya/customWidgets/custom_text_field.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../../customWidgets/text_decorated_icon.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {

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
            title: const Text("Password", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
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
                            child:const Text("Please enter your current password.", style: TextStyle(fontSize: 14, color: AppColor.headingColor2),)),
                    ],
                  ),
                ),
              ),
            ),
          ),

          body: Column(
            children:  [
              const SizedBox(height: 15,),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 30),
                child: CustomTextField(
                    maxLine: 1,
                    textEditingController: textEditingController,
                    size: size,
                    textInputType: TextInputType.text,
                    hintText: "Password", icon:const Icon(Icons.question_mark)),
              ),
              const SizedBox(height: 5,),
              textEditingController.text.isEmpty? const  Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child:  Text(
                    "Forget your password?",
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: AppColor.headingColor2),
                  ),
                ),
              ):const SizedBox(),
              const Spacer(),
              InkWell(
                onTap: () {

                },
                child: Container(
                  height: 46.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      color: AppColor.buttonColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child:  Center(
                    child: Text(
                      textEditingController.text.isEmpty?"Ok":"Save",
                      style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: AppColor.whiteColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 150,),

            ],
          ),
        ),
      ),
    );
  }
}
