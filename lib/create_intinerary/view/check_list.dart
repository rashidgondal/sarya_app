import 'package:flutter/material.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';

class CheckListScreen extends StatefulWidget {
  const CheckListScreen({Key? key}) : super(key: key);

  @override
  State<CheckListScreen> createState() => _CheckListScreenState();
}

class _CheckListScreenState extends State<CheckListScreen> {

  late NavigationService _navigationService;
  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(
        child:  Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 60,
               leading: IconButton(
             icon: const Icon(
               Icons.arrow_back_ios,
               color: AppColor.subtitleColor,
             ),
             onPressed: () {
               _navigationService.goBack();
             },
           ),
            backgroundColor: AppColor.aquaCasper2,
            title: const Text(
              "CheckList",
              style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: Container(
            height: 100,
            color: AppColor.whiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    _navigationService.navigatePushReplace(designIntineraryRoute);

                  },
                  child: Container(
                    height: 46.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text(
                        "Done",
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
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              children: [
               const SizedBox(height: 20,),
                Expanded(
                  child: GridView.builder(
                    itemCount: 100,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 44.0,
                          width: 150.0,
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColor.borderColor2, width: 1)),
                          child: Row(
                            children: [
                              const Text(
                                "Adventure",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.headingColor),
                              ),
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
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 20.0,
                        mainAxisExtent: 50.0),
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
