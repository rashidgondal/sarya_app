import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../../helper/shared_prefs.dart';
import '../../../locator.dart';
import '../../../navigation/navigation_service.dart';
import '../../../navigation/router_path.dart';


class AvatarScreen extends StatefulWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  State<AvatarScreen> createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {

  late NavigationService _navigationService;
  String picUrl = '';

  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();
    getUserInfo();
  }

  getUserInfo() async {
    SharedPrefs pref = SharedPrefs();
    Map map = await pref.getUser();
    picUrl = map['avatar'] ?? '';
    setState(() {});
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
            title: const Text("Avatar", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
            leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: AppColor.lightIndigo,),
              onPressed: () {
                _navigationService.goBack();
              },),
            backgroundColor: AppColor.aquaCasper2,
            toolbarHeight: 55.0,
            bottom: PreferredSize(
              preferredSize:const  Size.fromHeight(60),
              child: Container(
                height: 50,
                width: size.width,
                color: AppColor.colorLiteGrey,
                child: Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: size.width/1.2,
                          child:const Text("You can use this email address to log in, or for password recovery.", style: TextStyle(fontSize: 14, color: AppColor.headingColor2),)),
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

                SizedBox(
                    height: size.height / 3.0,
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100.0,
                            width: 100.0,
                            child: picUrl ==''?
                            SvgPicture.asset('user'.svg):
                            SvgPicture.network(picUrl,) ,
                      ),

                        ],),

                    )),



                Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 30),
                    child: InkWell(
                      onTap: (){
                        _navigationService.navigateTo(avatarRout,
                            arguments: {'isFromSignUp':false})!.then((value) {
                          getUserInfo();
                        });
                      },
                      child: Container(
                        height: 50.0,
                        width: size.width,

                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColor.colorLiteGrey,
                            borderRadius: BorderRadius.circular(10.0),
                            border:
                            Border.all(color: AppColor.borderColor2, width: 1)),
                        child: Row(
                          children: const[
                            Text(
                                'Change my Avatar',
                                style:  TextStyle(
                                    fontSize: 15.0, color: AppColor.headingColor2)),
                          ],
                        ),
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
