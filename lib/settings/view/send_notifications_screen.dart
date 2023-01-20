import 'package:flutter/material.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/text_decorated_icon.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  bool _isCheckedMyAccountLogin = false;


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
            title: const Text("Send me notifications", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
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
                    children: const[

                      Text("Who can send notifications directly to you?", style: TextStyle(fontSize: 14, color: AppColor.headingColor2),),


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
                            'Everyone',
                            style:  TextStyle(
                                fontSize: 15.0, color: AppColor.headingColor2)),
                          const  Spacer(),
                          Theme(

                            data: Theme.of(context).copyWith(
                                unselectedWidgetColor:  AppColor.aquaCasper),
                            child:Checkbox(
                              value: _isCheckedMyAccountLogin,
                              onChanged: (bool? value) {
                                
                                setState(() {
                                  _isCheckedMyAccountLogin =value!;

                                });
                              },
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
                              'My Friends',
                              style:  TextStyle(
                                  fontSize: 15.0, color: AppColor.headingColor2)),
                          const  Spacer(),
                          Theme(

                            data: Theme.of(context).copyWith(
                                unselectedWidgetColor:  AppColor.aquaCasper),
                            child:Checkbox(
                              value: false,
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
