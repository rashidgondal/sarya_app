import 'package:flutter/material.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/text_decorated_icon.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {

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
            title: const Text("Help", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
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
                      Icon(Icons.question_mark),
                      Text(" What can we help you with? ", style: TextStyle(fontSize: 14, color: AppColor.headingColor2),),
                      Spacer(),
                      Icon(Icons.question_mark),

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
                            'My account login',
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
                              'Report a safety concern',
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
                              'My Sarya isn’t working',
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
                              'I have a chat question',
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
                              'I have a map question',
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
                              'I have a privacy question',
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
                              'I have feedback',
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
                const SizedBox(height: 25,),


                _isCheckedMyAccountLogin ?
                const  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child:  Align(
                    alignment: Alignment.centerLeft,
                    child:  Text(
                        'Tell us more..',
                        style:  TextStyle(
                            fontSize: 15.0, color: AppColor.textColor)),
                  ),
                ):
                const SizedBox(),


                _isCheckedMyAccountLogin ?
                   _buildOnCheck(size: size):
                    const SizedBox()

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOnCheck({required Size size}){
    return Column(
      children: [
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
                      'My account login',
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
                      'Report a safety concern',
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
                      'My Sarya isn’t working',
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
                      'I have a chat question',
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
                      'I have a map question',
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
                      'I have a privacy question',
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
                      'I have feedback',
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
    );
  }


}
