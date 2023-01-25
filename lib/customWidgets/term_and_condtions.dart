import 'package:flutter/material.dart';
import 'package:sarya/authentication/signup/view/success_screen.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../locator.dart';
import '../navigation/navigation_service.dart';
class TermAndCondition extends StatefulWidget {
  final bool isFromSignUp;
  const TermAndCondition({Key? key, required this.isFromSignUp}) : super(key: key);

  @override
  State<TermAndCondition> createState() => _TermAndConditionState();
}

class _TermAndConditionState extends State<TermAndCondition> {
  late NavigationService _navigationService;

    String date = '';
  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();
  }




  @override
  Widget build(BuildContext context) {

    return Container(
      color: AppColor.whiteColor,

      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 60,
            //leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: AppColor.lightIndigo,), onPressed: () {  },),
            automaticallyImplyLeading: false,
            backgroundColor: AppColor.aquaCasper2,
            title: const Text("Term & Condition", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
            centerTitle: true,


          ),

          body: Column(
            children: [
              Container(
                height: 60.0,
                color: AppColor.colorLiteGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                   Icon(Icons.date_range,size: 20,),
                  Text("Last update: January 25, 2023", style: TextStyle(fontSize: 12, color: AppColor.subtitleColor),)
                ],),
              ),
              const SizedBox(height: 20.0,),
              Container(
                padding:const  EdgeInsets.symmetric(horizontal: 33.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:const [
                    Text("Please read these Terms of Use carefully as they apply to your use of this application. If you do not accept the terms and conditions outlines below, please do not continue to use the application. Sarya may revise these Terms and Conditions at any time by updating this page and without prior notice. You are advised to review this page periodically, because these terms and conditions are binding upon you.",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize:17.0 , color: AppColor.colorLiteBlack2,letterSpacing: 1),),
                    SizedBox(height: 30,),
                    Text("Term of use:", style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
                    SizedBox(height: 5.0,),

                    Text("The design and information contained on the application are the property of Sarya and are protected by copyright, trademark and other proprietary rights.",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize:17.0 , color: AppColor.colorLiteBlack2, letterSpacing: 1),),

                  ],
                ),
              ),
              const SizedBox(height: 40.0,),
              widget.isFromSignUp? Column(
                children: [
                  InkWell(
                    onTap: () {

                      _navigationService.navigateTo(successRout);
                    },
                    child: Container(
                      height: 46.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          color: AppColor.buttonColor,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: const Center(
                        child: Text(
                          "Accept",
                          style: TextStyle(
                              fontSize: 15.0, color: AppColor.whiteColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0,),

                  InkWell(
                    onTap: () {
                      _navigationService.navigatePushReplace(loginRout);
                    },
                    child: Container(
                      height: 46.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          color: AppColor.colorGrey,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: const Center(
                        child: Text(
                          "Decline",
                          style: TextStyle(
                              fontSize: 15.0, color: AppColor.whiteColor),
                        ),
                      ),
                    ),
                  ),

                ],
              ): const SizedBox()

            ],
          ),
        ),
      ),
    );
  }
}
