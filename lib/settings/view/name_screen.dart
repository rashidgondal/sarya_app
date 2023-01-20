import 'package:flutter/material.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/text_decorated_icon.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
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
            title: const Text("Name", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
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
                    Text("This is how you appear to your friends", style: TextStyle(fontSize: 14, color: AppColor.headingColor2),),
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
                        children: const[
                          Text(
                            'Me',
                            style:  TextStyle(
                                fontSize: 15.0, color: AppColor.headingColor2)),
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
                      child:Row(
                        children:const [
                           Text(
                              'Boo',
                              style:  TextStyle(
                                  fontSize: 15.0, color: AppColor.headingColor2)),
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
