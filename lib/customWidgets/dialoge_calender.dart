import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sarya/theme/color_scheme.dart';

import 'custom_text_field.dart';

class SelectDate extends StatefulWidget {


  const SelectDate({Key? key})
      : super(key: key);

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 40.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        color: AppColor.colorLiteBlack4,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: AppColor.colorBlack),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text(
                        "OK",
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
          child:
          CupertinoDatePicker(
            onDateTimeChanged: (v){},
            maximumYear: 2030,
            minimumYear: 1980,
            mode: CupertinoDatePickerMode.date,
          ),
        ));
  }
}