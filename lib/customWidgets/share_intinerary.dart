import 'package:flutter/material.dart';
import 'package:sarya/customWidgets/custom_text_field.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../navigation/navigation_service.dart';

class ShareIntinerary extends StatefulWidget {
  const ShareIntinerary({Key? key}) : super(key: key);

  @override
  State<ShareIntinerary> createState() => _ShareIntineraryState();
}

class _ShareIntineraryState extends State<ShareIntinerary> {

  TextEditingController textEditingController = TextEditingController();
  late NavigationService _navigationService;


  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();

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
            toolbarHeight: 60,
              leading: IconButton(
             icon: const Icon(
               Icons.arrow_back_ios,
               color: AppColor.lightIndigo,
             ),
             onPressed: () {},
           ),
            backgroundColor: AppColor.aquaCasper2,
            title: const Text(
              "Share Intinerary",
              style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100), child: Container(
              color: AppColor.whiteColor,
              height: 100,
              width: size.width,

              child: Container(
                padding:const EdgeInsets.symmetric(
                  horizontal: 30.0
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    CustomTextField(maxLine: 1, textEditingController: textEditingController, size: size, textInputType: TextInputType.text,
                        hintText: 'Search Friends', icon:const Icon(Icons.question_mark))

                  ],),
              ),
            ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 100,
            color: AppColor.whiteColor,
            padding:const  EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 46.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        color: AppColor.colorGrey,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text(
                        "Share",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: AppColor.headingColor2),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _navigationService.navigateTo(soldIntineraryRoute);

                  },
                  child: Container(
                    height: 46.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text(
                        "Sell",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: AppColor.whiteColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            padding:const EdgeInsets.symmetric(horizontal: 25),
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 15.0),
                child: Container(
                    height: 50.0,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border:
                        Border.all(color: AppColor.borderColor2, width: 1)),
                    child: Row(
                      children: [
                        const Icon(Icons.question_mark),
                        const SizedBox(width: 10,),
                        const Text("Abcd",style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400,color: AppColor.headingColor2), ),
                        const Spacer(),
                        Theme(

                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor:  AppColor.aquaCasper),
                          child:Checkbox(
                            value: false,
                            onChanged: (bool? value) {},
                            focusColor:  AppColor.aquaCasper,
                            activeColor: AppColor.aquaCasper,

                          ),
                        ),

                      ],
                    )),
              );
            }),
          ),
        ),
      ),
    );
  }
}
