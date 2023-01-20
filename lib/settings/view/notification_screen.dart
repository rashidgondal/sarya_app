import 'package:flutter/material.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/text_decorated_icon.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
            title: const Text("Notifications", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
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
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const[
                    SizedBox(width: 40.0,),
                    Text("Please enable/disable Notifications", style: TextStyle(fontSize: 14, color: AppColor.headingColor2),),
                  ],
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
                  child: Container(
                      height: 50.0,
                      width: size.width,

                    padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border:
                          Border.all(color: AppColor.borderColor2, width: 1)),
                      child: Row(
                        children: [
                         const Text(
                            'Enable Notification',
                            style:  TextStyle(
                                fontSize: 15.0, color: AppColor.headingColor2)),
                          const  Spacer(),
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
                )),
                const SizedBox(height: 15,),
                Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 50.0,
                      width: size.width,

                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border:
                          Border.all(color: AppColor.borderColor2, width: 1)),
                      child: Row(
                        children: [
                          const Text(
                              'Friend suggestions',
                              style:  TextStyle(
                                  fontSize: 15.0, color: AppColor.headingColor2)),
                          const  Spacer(),
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
                    )),
                const SizedBox(height: 15,),
                Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 50.0,
                      width: size.width,

                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border:
                          Border.all(color: AppColor.borderColor2, width: 1)),
                      child: Row(
                        children: [
                          const Text(
                              'Vibrate',
                              style:  TextStyle(
                                  fontSize: 15.0, color: AppColor.headingColor2)),
                          const  Spacer(),
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
                    )),
                const SizedBox(height: 15,),
                Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 50.0,
                      width: size.width,

                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border:
                          Border.all(color: AppColor.borderColor2, width: 1)),
                      child: Row(
                        children: [
                          const Text(
                              'Sound',
                              style:  TextStyle(
                                  fontSize: 15.0, color: AppColor.headingColor2)),
                          const  Spacer(),
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
                    )),
                const SizedBox(height: 15,),
                Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 50.0,
                      width: size.width,

                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border:
                          Border.all(color: AppColor.borderColor2, width: 1)),
                      child: Row(
                        children: [
                          const Text(
                              'Ring',
                              style:  TextStyle(
                                  fontSize: 15.0, color: AppColor.headingColor2)),
                          const  Spacer(),
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
                    )),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
