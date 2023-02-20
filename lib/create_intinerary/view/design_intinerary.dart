import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sarya/customWidgets/custom_text_field.dart';
import 'package:sarya/customWidgets/dial_trip_estimation_cost.dart';
import 'package:sarya/customWidgets/dialoge_select_trip_type.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/text_decorated_icon.dart';

class DesignIntineraryScreen extends StatefulWidget {
  const DesignIntineraryScreen({Key? key}) : super(key: key);
  @override
  State<DesignIntineraryScreen> createState() => _DesignIntineraryScreenState();
}

class _DesignIntineraryScreenState extends State<DesignIntineraryScreen> {

  TextEditingController titleController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController intineraryCostController = TextEditingController();
  TextEditingController totalDaysController = TextEditingController();
  TextEditingController tripEstimatedCostController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  late NavigationService _navigationService;

  final ImagePicker _picker = ImagePicker();
  String path = '';

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
               color: AppColor.subtitleColor,
             ),
             onPressed: () {},
           ),
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.aquaCasper2,
          title: const Text(
            "Design your Intinerary",
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

                  _navigationService.navigateTo(draftIntineraryRoute);
                },
                child: Container(
                  height: 46.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      color: AppColor.colorLiteBlack4,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: AppColor.colorBlack),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  _navigationService.navigateTo(dayDesignRoute);
                },
                child: Container(
                  height: 46.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      color: AppColor.buttonColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Center(
                    child: Text(
                      "Continue",
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
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  CustomTextField(
                    hintText: 'Intinerary title',
                    size: size,
                    maxLine: 1,
                    textInputType: TextInputType.text,
                    textEditingController: titleController,
                      icon:Row(children: [SvgPicture.asset("t_icon".svg)],)
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  CustomTextField(
                    hintText: 'Summary',
                    size: size,
                    maxLine: 4,
                    textInputType: TextInputType.text,
                    textEditingController: summaryController,
                      icon:Row(children: [SvgPicture.asset("summary_icon".svg)]),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  CustomTextField(
                    hintText: 'Intinerary Cost',
                    size: size,
                    maxLine: 1,
                    textInputType: TextInputType.number,
                    textEditingController: intineraryCostController,
                    icon:Row(children: [SvgPicture.asset("cost_icon".svg)]),                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  InkWell(
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>  TripEstimationCost(textEditingController: tripEstimatedCostController,));

                    },
                    child: TextDecoratedContainer(
                      titleWidget:     Text(
                        'Trip Estimated Cost',
                        style: const TextStyle(
                            fontSize: 15.0, color: AppColor.headingColor2),
                      ),
                      iconImage: Row(children: [SvgPicture.asset("cost_icon".svg)]),

                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>  SelectTripType(textEditingController: searchController,));
                      },
                      child: TextDecoratedContainer(
                        titleWidget:     Text(
                          'Select Trip Type',
                          style: const TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Row(children: [SvgPicture.asset("type_icon".svg)]),
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColor.lightIndigo,
                          size: 20,
                        ))),
                  const SizedBox(
                    height: 2.0,
                  ),
                  CustomTextField(
                    hintText: 'Total Days',
                    size: size,
                    maxLine: 1,
                    textInputType: TextInputType.number,
                    textEditingController: totalDaysController,
                    icon: Row(children: [SvgPicture.asset("days_icon".svg)]),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  InkWell(
                      onTap: (){
                        _navigationService.navigateTo(checkListRoute);
                      },
                      child: TextDecoratedContainer(
                          titleWidget:     Text(
                            'Checklist',
                            style: const TextStyle(
                                fontSize: 15.0, color: AppColor.headingColor2),
                          ),
                          iconImage: Row(children: [SvgPicture.asset("checklist_icon".svg)]),
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColor.lightIndigo,
                            size: 20,
                          ))


                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        'Upload Intinerary Profile Image.',
                        style:  TextStyle(
                            fontSize: 15.0, color: AppColor.headingColor2),
                      ),
                      InkWell(
                        onTap: ()async{
                          XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                          if(image != null){
                            setState(() {
                              path = image.path;
                            });
                          }
                        },
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 30,
                          color: AppColor.lightIndigo,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 55.0,
                        width: 55.0,
                        decoration: BoxDecoration(
                            color: AppColor.aquaCasper,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1, color: AppColor.borderColor)),
                        child: path.isEmpty?
                               SizedBox():
                               Image.file(File(path)),
                      ),
                    ],
                  )
                ],
              )),
        ),
      )),
    );
  }




/*  TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                    label:const Icon(Icons.question_mark),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColor.borderColor2, ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColor.aquaGreen, ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintText: "Summary"
                ),
              ),*/

}
