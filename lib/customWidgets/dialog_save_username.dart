import 'package:flutter/material.dart';
import 'package:sarya/theme/color_scheme.dart';

import 'custom_text_field.dart';

class SaveUsername extends StatefulWidget {

  const SaveUsername({Key? key})
      : super(key: key);

  @override
  State<SaveUsername> createState() => _SaveUsernameState();
}

class _SaveUsernameState extends State<SaveUsername> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          const SizedBox(height: 10,),
          Container(
            padding:const  EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text(
                        "Save Username",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: AppColor.whiteColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,)

        ],
        contentPadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        content: Container(
          width: size.width,
          height: size.height / 4.5,
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 138,
                width: 136.0,
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  color: AppColor.aquaCasper2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: const [
                   Expanded(child: Center(child: Icon(Icons.question_mark),)),
                  SizedBox(
                    height: 20.0,
                    child: Text(
                      "sara.sara | 25 Freinds",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: AppColor.headingColor2),
                    ),
                  ),
                ],),
              )


            ],
          ),
        ));
  }
}