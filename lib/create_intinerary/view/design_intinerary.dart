import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/CheckList_states.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/activity_cubits.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/airport_cubits.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/checklist_cubits.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/transport_cubits.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/trip_cubits.dart';
import 'package:sarya/customWidgets/custom_text_field.dart';
import 'package:sarya/customWidgets/data_loading.dart';
import 'package:sarya/customWidgets/dial_trip_estimation_cost.dart';
import 'package:sarya/customWidgets/dialoge_select_trip_type.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/text_decorated_icon.dart';
import '../intinerary_view_model/Trip_states.dart';
import '../intinerary_view_model/update_intinerary_cubits.dart';
import '../intinerary_view_model/update_intinerary_states.dart';
import '../model/design_intinerary_request.dart';


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
  late NavigationService _navigationService;
  int tripCost = 0;
  List<String> checkList = [];
  List<String> tripType = [];
  final ImagePicker _picker = ImagePicker();
  String path = '';

  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();
    context.read<ActivityCubits>().getActivity();
    context.read<TransportCubits>().getTransport();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                  _builtSaveButton(),
                  const SizedBox(
                    width: 20,
                  ),
                  _builtContinue()
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
                              builder: (BuildContext context) =>  TripEstimationCost()).then((value){

                            print("tripCost.........$value");

                            tripCost = value;
                            setState(() {

                            });
                          });

                        },
                        child: TextDecoratedContainer(
                          titleWidget:     Text(
                            tripCost == 0 ?'Trip Estimated Cost': '$tripCost',
                            style: const TextStyle(
                                fontSize: 15.0, color: AppColor.headingColor2),
                          ),
                          iconImage: Row(children: [SvgPicture.asset("cost_icon".svg)]),

                        ),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      BlocBuilder<TripCubits, TripStates>(
                          builder: (context, state) {
                            List<String> list = [];
                            List<bool> listOfBool = [];
                            if(state is TripLoaded){
                              list = state.response.result??[];
                              listOfBool = state.listOfBool;
                            }
                            return InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>  SelectTripType(tripList:list, boolList: listOfBool,preTripList: tripType,)).then((value){
                                    if(value != null){
                                      tripType = value;
                                      setState(() {

                                      });
                                    }else{
                                      setState(() {

                                      });
                                    }
                                  });


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
                                    )));
                          }

                      ),
                      tripType.isEmpty? SizedBox.shrink(): SizedBox(
                        height: 40,
                        child: ListView.builder(
                            itemCount: tripType.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index){
                              return Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: InkWell(
                                  onTap: (){
                                    tripType.remove(tripType[index]);
                                    setState(() {

                                    });
                                  },
                                  child: Container(
                                      height: 35,
                                      padding: EdgeInsets.symmetric(horizontal: 6,vertical: 5),
                                      decoration: BoxDecoration(
                                        color: AppColor.aquaGreen.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(8),

                                      ),
                                      child:Row(
                                        children: [
                                          Text(
                                            '${tripType[index]}',
                                            style:  TextStyle(
                                                fontSize: 15.0, color: AppColor.whiteColor) ,
                                          ),
                                          SizedBox(width: 5),
                                          Icon(Icons.close, color: AppColor.whiteColor, size: 15,)
                                        ],
                                      )),
                                ),
                              );
                            }),
                      ),
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
                      BlocBuilder<CheckListCubits, CheckListStates>(
                          builder: (context, state) {
                            List<String> listOfCheckList = [];
                            List<bool> listOfBool = [];
                            if (state is CheckListLoaded) {
                              listOfCheckList = state.response.result!.toList() ?? [];
                              listOfBool = state.boolList.toList();
                            }
                            return   InkWell(
                                onTap: (){
                                  _navigationService.navigateTo(checkListRoute,
                                      arguments:{"checklist":listOfCheckList, "listOfBool":listOfBool, "selectedCheckList":checkList})!.then((value) {

                                    if(value != null){
                                      checkList = value;
                                      setState(() {

                                      });
                                    }else{
                                      setState(() {

                                      });
                                    }

                                  });
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


                            );
                          }),
                      const SizedBox(
                        height: 5.0,
                      ),
                      checkList.isEmpty? SizedBox.shrink(): SizedBox(
                        height: 40,
                        child: ListView.builder(
                            itemCount: checkList.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index){
                              return Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: InkWell(
                                  onTap: (){
                                    checkList.remove(checkList[index]);
                                    setState(() {

                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    padding: EdgeInsets.symmetric(horizontal: 6,vertical: 5),
                                    decoration: BoxDecoration(
                                      color: AppColor.aquaGreen.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(8),

                                    ),
                                    child:Row(
                                      children: [
                                        Text(
                              '${checkList[index]}',
                              style:  TextStyle(
                              fontSize: 15.0, color: AppColor.whiteColor) ,
                                        ),
                                        SizedBox(width: 5),
                                        Icon(Icons.close, color: AppColor.whiteColor, size: 15,)
                                      ],
                                    )),
                                ),
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 10.0,
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
          ),
    ),
    );
  }

  Widget _builtContinue(){

    if(
        titleController.text.isEmpty ||
        summaryController.text.isEmpty ||
        intineraryCostController.text.isEmpty ||
        tripCost ==0 ||
        tripType.isEmpty ||
        totalDaysController.text.isEmpty ||
        checkList.isEmpty
    ){
     return Container(
        height: 46.0,
        width: 150.0,
        decoration: BoxDecoration(
            color: AppColor.colorLiteBlack4,
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
      );
    }


    return InkWell(
      onTap: () {
        int totalDay = int.parse(totalDaysController.text);
        int itineraryCost = int.parse(intineraryCostController.text);

        DesignIntineraryRequest createIntineraryRequest = DesignIntineraryRequest(
            title: titleController.text,
            summary: summaryController.text,
            cost: itineraryCost,
            tripCost: tripCost,
            step: 2,
            tripType: tripType,
            totalDays: totalDay,
            checklist: checkList,
            live: false,
            days: []
        );

        context.read<UpdateIntineraryCubits>().doCreateIntinerary(createIntineraryRequest: createIntineraryRequest, navigationService: _navigationService,route: "Continue");

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
    );

  }

  Widget _builtSaveButton(){

    if(
    titleController.text.isEmpty ||
        summaryController.text.isEmpty ||
        intineraryCostController.text.isEmpty ||
        tripCost ==0 ||
        tripType.isEmpty ||
        totalDaysController.text.isEmpty ||
        checkList.isEmpty
    ){
      return Container(
        height: 46.0,
        width: 150.0,
        decoration: BoxDecoration(
            color: AppColor.colorLiteBlack4,
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
      );
    }


    return InkWell(
      onTap: () {
        int totalDay = int.parse(totalDaysController.text);
        int itineraryCost = int.parse(intineraryCostController.text);

        DesignIntineraryRequest createIntineraryRequest = DesignIntineraryRequest(
            title: titleController.text,
            summary: summaryController.text,
            cost: itineraryCost,
            tripCost: tripCost,
            step: 2,
            tripType: tripType,
            totalDays: totalDay,
            checklist: checkList,
            live: false,

            days: []
        );

        context.read<UpdateIntineraryCubits>().doCreateIntinerary(createIntineraryRequest: createIntineraryRequest, navigationService: _navigationService,route: "Save");

      },
      child: Container(
        height: 46.0,
        width: 150.0,
        decoration: BoxDecoration(
            color: AppColor.buttonColor,
            borderRadius: BorderRadius.circular(8.0)),
        child: const Center(
          child: Text(
            "Save",
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: AppColor.whiteColor),
          ),
        ),
      ),
    );

  }





}
