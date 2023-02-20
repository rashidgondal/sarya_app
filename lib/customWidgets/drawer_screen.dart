import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarya/customWidgets/text_decorated_icon.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../authentication/signin/signin_view_model/signin_cubits.dart';
import '../authentication/signin/signin_view_model/signin_states.dart';
import '../navigation/navigation_service.dart';

class DrawerScreen extends StatefulWidget {

   const DrawerScreen({Key? key,}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

    late NavigationService _navigationService;
    Map? map;
    bool isSwitched = false;
    SharedPrefs sharedPrefs = SharedPrefs();


  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();
    getUserInfo();
  }

  getUserInfo() async {
    print("..........");

    isSwitched = await sharedPrefs.getDarkMode() ?? false;
    map = await sharedPrefs.getUser();
    setState(() {});

  }

  void toggleSwitch(bool value) async{


    if(isSwitched == false)
    {
      sharedPrefs.saveDarkMode(true);
      setState(() {
        isSwitched = true;
      });
    }
    else
    {
      sharedPrefs.saveDarkMode(false);

      setState(() {

        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }

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
            toolbarHeight: 0,
            automaticallyImplyLeading: false,
            backgroundColor: AppColor.aquaCasper2,
            bottom: PreferredSize(
          preferredSize:const Size.fromHeight(240),
          child: Container(
            color: AppColor.aquaCasper2,
            height: 240,
            width: size.width,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 169,
                        child:  map ==null?
                        SvgPicture.asset('user'.svg):
                        SvgPicture.network(map!["avatar"]!, height: 60,width: 169,) ,
                      ),
                      const  SizedBox(height: 15,),
                      Text("${map==null?"":map!["firstName"]??''} ${map==null?"":map!["lastName"]??''}", style:const TextStyle(fontSize: 29, color: AppColor.colorBlack,fontWeight: FontWeight.w700),),
                      const  SizedBox(height: 15,)
                      ,Text("${map==null?"":map!["userName"]??''} | 0 friends", style: TextStyle(fontSize: 13, color: AppColor.headingColor2,fontWeight: FontWeight.w500),)
                    ],
                  ),

                ),
                Padding(
                  padding:const  EdgeInsets.only(right: 18.0, top: 12),
                  child:  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child:const Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.close, size: 25,color: AppColor.lightIndigo,),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),


          ),
          body: SingleChildScrollView(
            physics:const  BouncingScrollPhysics(),
            child: Container(
              color: AppColor.whiteColor,
              child: Column(
                children: [
                  const SizedBox(height: 15,),
                  InkWell(
                     onTap: (){

                     },
                     child: Padding(
                      padding: const  EdgeInsets.only(left: 30, right: 30),
                      child:   TextDecoratedContainer(titleWidget:const Text(
                        'Account ',
                        style:  TextStyle(
                            fontSize: 15.0, color: AppColor.headingColor2),
                      ), iconImage: SvgPicture.asset('summary_icon'.svg),),
                  ),
                   ),
                  const SizedBox(height: 1,),
                  InkWell(
                    onTap: (){

                    },
                     child:const Padding(
                      padding:  EdgeInsets.only(left: 30, right: 30),
                      child:   TextDecoratedContainer(titleWidget: Text(
                        'Share my location ',
                        style:  TextStyle(
                            fontSize: 15.0, color: AppColor.headingColor2),
                      ), iconImage: Icon(Icons.share_location, color: AppColor.lightIndigo,size: 18,),),
                  ),
                   ),
                  const SizedBox(height: 1,),
                  InkWell(
                    onTap: (){
                      _navigationService.navigateTo(bankDetailRoute);
                    },
                     child:const Padding(
                      padding:  EdgeInsets.only(left: 30, right: 30),
                      child:   TextDecoratedContainer(titleWidget: Text(
                        'Bank Detail',
                        style:  TextStyle(
                            fontSize: 15.0, color: AppColor.headingColor2),
                      ),
                        iconImage: Icon(Icons.account_balance,color: AppColor.lightIndigo,size: 18,),
                      icon: Icon(Icons.arrow_forward_ios,color: AppColor.lightIndigo,),
                      ),
                  ),
                   ),
                  const SizedBox(height: 1,),
                  InkWell(
                    onTap: (){

                    },
                     child: Padding(
                      padding:const  EdgeInsets.only(left: 30, right: 30),
                      child:   TextDecoratedContainer(titleWidget:const Text(
                        'Contacts',
                        style:  TextStyle(
                            fontSize: 15.0, color: AppColor.headingColor2),
                      ), iconImage: SvgPicture.asset('contacts'.svg),),
                  ),
                   ),
                  const SizedBox(height: 1,),
                  InkWell(
                    onTap: (){

                    },
                     child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child:   TextDecoratedContainer(titleWidget:const Text(
                        'Help ',
                        style:  TextStyle(
                            fontSize: 15.0, color: AppColor.headingColor2),
                      ), iconImage: SvgPicture.asset('help'.svg),),
                  ),
                   ),
                  const SizedBox(height: 1,),
                  InkWell(
                    onTap: (){

                      _navigationService.navigateTo(settingRoute);
                      },
                     child: Padding(
                      padding:const  EdgeInsets.only(left: 30, right: 30),
                      child:   TextDecoratedContainer(titleWidget:const Text(
                        'Setting',
                        style:  TextStyle(
                            fontSize: 15.0, color: AppColor.headingColor2),
                      ),
                        iconImage: SvgPicture.asset('help'.svg),

                      ),
                  ),
                   ),
                  const SizedBox(height: 1,),
                  Padding(
                    padding:const  EdgeInsets.only(left: 30, right: 30),
                    child:   TextDecoratedContainer(titleWidget:const Text(
                      'Dark Mode',
                      style:  TextStyle(
                          fontSize: 15.0, color: AppColor.headingColor2),
                    ),
                      iconImage: SvgPicture.asset('help'.svg),
                      icon: Transform.scale(
                          scale: 1.5,
                          child: Switch(
                            onChanged: toggleSwitch,
                            value: isSwitched,
                            activeColor: AppColor.lightIndigo,
                            activeTrackColor:AppColor.colorBlue ,
                            inactiveThumbColor: AppColor.headingColor2.withOpacity(0.5),
                            inactiveTrackColor: AppColor.headingColor.withOpacity(0.5),
                          )
                      ),

                    ),
                  ),
                  const SizedBox(height: 1,),
                  InkWell(
                    onTap: (){
                      SharedPrefs pref = SharedPrefs();
                      pref.clearCache();
                      _navigationService.navigatePushReplace(loginRout);
                    },
                    child: Padding(
                      padding:const  EdgeInsets.only(left: 30, right: 30),
                      child:   TextDecoratedContainer(titleWidget:const Text(
                        'Logout',
                        style:  TextStyle(
                            fontSize: 15.0, color: AppColor.headingColor2),
                      ),
                        iconImage: SvgPicture.asset('exit'.svg),

                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
