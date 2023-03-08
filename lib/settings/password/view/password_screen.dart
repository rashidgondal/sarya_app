import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarya/customWidgets/custom_text_field.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../../customWidgets/text_decorated_icon.dart';
import '../../../helper/shared_prefs.dart';
import '../../../navigation/navigation_service.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {

  TextEditingController passTextEditingController = TextEditingController();

  late NavigationService _navigationService;

  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();
    getUserInfo();
  }

  getUserInfo() async {
    print("..........");
    SharedPrefs pref = SharedPrefs();

    Map map = await pref.getUser();
    passTextEditingController.text = map['pass'] ?? '';

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(
        child: GestureDetector(
          onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: AppColor.whiteColor,
            appBar: AppBar(
              elevation: 0,
              title: const Text("Password", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
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
                  child:   Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          SizedBox(
                              width: size.width/1.2,
                              child:const Text("Please enter your current password.", style: TextStyle(fontSize: 14, color: AppColor.headingColor2),)),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            body: Column(
              children:  [
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CustomTextField(
                    maxLine: 1,
                    textEditingController: passTextEditingController,
                    size: size,
                    textInputType: TextInputType.phone,
                    hintText: '',
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'lock'.svg,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                passTextEditingController.text.isEmpty?
                const  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child:  Text(
                      "Forget your password?",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: AppColor.headingColor2),
                    ),
                  ),
                ):
                const SizedBox(),
                const Spacer(),
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    height: 46.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        color: passTextEditingController.text.isEmpty?AppColor.colorLiteGrey :AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child:  Center(
                      child: Text(
                        passTextEditingController.text.isEmpty?"Ok":"Save",
                        style:  TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: passTextEditingController.text.isEmpty? AppColor.headingColor2 :AppColor.whiteColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 150,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
