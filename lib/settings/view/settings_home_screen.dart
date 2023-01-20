import 'package:flutter/material.dart';
import 'package:sarya/customWidgets/dialoge_share_user_name.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/text_decorated_icon.dart';

class SettingsHome extends StatefulWidget {
  const SettingsHome({Key? key}) : super(key: key);

  @override
  State<SettingsHome> createState() => _SettingsHomeState();
}

class _SettingsHomeState extends State<SettingsHome> {
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
            title: const Text("Settings", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
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
                      Text("Account", style: TextStyle(fontSize: 14, color: AppColor.headingColor2),),
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
                  child: InkWell(
                      onTap: (){

                      },
                      child:const TextDecoratedContainer(
                       
                        titleWidget: Text(
                          'Name',
                          style:  TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),)),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: (){

                      },
                      child:const TextDecoratedContainer(
                       
                        titleWidget: Text(
                          'Avatar',
                          style:  TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),)),
                ),
                InkWell(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>  const ShareUsername());
                  },
                  child: Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 30),
                    child: InkWell(
                        onTap: (){

                        },
                        child:const TextDecoratedContainer(

                          titleWidget: Text(
                            'Share Username',
                            style:  TextStyle(
                                fontSize: 15.0, color: AppColor.headingColor2),
                          ),
                          iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),)),
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: (){

                      },
                      child:const TextDecoratedContainer(
                       
                        titleWidget: Text(
                          'Mobile Number',
                          style:  TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),)),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: (){

                      },
                      child:const TextDecoratedContainer(
                       
                        titleWidget: Text(
                          'Email',
                          style:  TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),)),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: (){

                      },
                      child:const TextDecoratedContainer(
                       
                        titleWidget: Text(
                          'Password',
                          style:  TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),)),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: (){

                      },
                      child:const TextDecoratedContainer(
                       
                        titleWidget: Text(
                          'Birthday',
                          style:  TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),)),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: (){

                      },
                      child:const TextDecoratedContainer(
                       
                        titleWidget: Text(
                          'Notifications',
                          style:  TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),)),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: (){

                      },
                      child:const TextDecoratedContainer(
                       
                        titleWidget: Text(
                          'Help',
                          style:  TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),)),
                ),
                const SizedBox(height: 15,),
                Container(
                  height: 50,
                  width: size.width,
                  color: AppColor.colorLiteGrey,
                  child:Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const[
                      SizedBox(width: 40.0,),
                      Text("Who can", style: TextStyle(fontSize: 14, color: AppColor.headingColor2),),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: (){

                      },
                      child:const TextDecoratedContainer(
                       
                        titleWidget: Text(
                          'Contact me',
                          style:  TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),)),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: (){

                      },
                      child:const TextDecoratedContainer(
                       
                        titleWidget: Text(
                          'Send me notifications',
                          style:  TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),)),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: (){

                      },
                      child:const TextDecoratedContainer(
                       
                        titleWidget: Text(
                          'See my location',
                          style:  TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),)),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
