import 'package:flutter/material.dart';
import 'package:sarya/theme/color_scheme.dart';

import 'custom_text_field.dart';

class BankHelp extends StatefulWidget {


  const BankHelp({Key? key})
      : super(key: key);

  @override
  State<BankHelp> createState() => _BankHelpState();
}

class _BankHelpState extends State<BankHelp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          Container(
            padding:const  EdgeInsets.symmetric(horizontal: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {

             

                  },
                  child: Container(
                    height: 46.0,
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
          height: size.width/2.8,
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const[

               Text(
                "Transfer Payments",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: AppColor.colorBlue),
              ),
               SizedBox(
                height: 20,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "These bank detail will be used to transfer Intinerary payments.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      color: AppColor.colorBlack),
                ),
              ),
            ],
          ),
        ));
  }
}