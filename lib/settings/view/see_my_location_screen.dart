import 'package:flutter/material.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/text_decorated_icon.dart';

class SeeMyLocation extends StatefulWidget {
  const SeeMyLocation({Key? key}) : super(key: key);

  @override
  State<SeeMyLocation> createState() => _SeeMyLocationState();
}

class _SeeMyLocationState extends State<SeeMyLocation> {
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
            title: const Text("See my location", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
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
                    children: [
                      SizedBox(
                          width: size.width/1.2,
                          child: const Text("Who can see your location when you are using the app?", style: TextStyle(fontSize: 14, color: AppColor.headingColor2),)),
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
                const SizedBox(height: 25,),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                        'Ghost Mode',
                        style:  TextStyle(
                            fontSize: 14.0, color: AppColor.headingColor2, fontWeight: FontWeight.w700)) ,
                    subtitle: const Text(
                        'When enabled, your friends can’t see your location',
                        style:  TextStyle(
                            fontSize: 12.0, color: AppColor.colorLiteBlack4)) ,
                    trailing: Theme(

                      data: Theme.of(context).copyWith(
                          unselectedWidgetColor:  AppColor.aquaCasper),
                      child:Checkbox(
                        value: true,
                        onChanged: (bool? value) {},
                        focusColor:  AppColor.aquaCasper,
                        activeColor: AppColor.aquaCasper,

                      ),
                    )
                    ,
                  ),
                ),
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
                            'Everyone',
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
                        children: [
                          const Text(
                              'Boo',
                              style:  TextStyle(
                                  fontSize: 15.0, color: AppColor.headingColor2)),
                          const Spacer(),
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
                const SizedBox(height: 25,),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child:  Align(
                    alignment: Alignment.centerLeft,
                    child:  Text(
                        'Location requests',
                        style:  TextStyle(
                            fontSize: 15.0, color: AppColor.lightIndigo)),
                  ),
                ),
                const SizedBox(height: 15,),

                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title:  const Text(
                        'Allow friends to request my location',
                        style:  TextStyle(
                            fontSize: 14.0, color: AppColor.headingColor2, fontWeight: FontWeight.w700)) ,
                    subtitle: const Text(
                        'You’ll see location requests in Chat.',
                        style:  TextStyle(
                            fontSize: 12.0, color: AppColor.colorLiteBlack4)) ,
                    trailing: Theme(

                      data: Theme.of(context).copyWith(
                          unselectedWidgetColor:  AppColor.aquaCasper),
                      child:Checkbox(
                        value: true,
                        onChanged: (bool? value) {},
                        focusColor:  AppColor.aquaCasper,
                        activeColor: AppColor.aquaCasper,

                      ),
                    )
                    ,
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
