import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minio/minio.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/CheckList_states.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/activity_cubits.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/airport_cubits.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/checklist_cubits.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/transport_cubits.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/trip_cubits.dart';
import 'package:sarya/create_intinerary/view/foodAndShoppingInfo.dart';
import 'package:sarya/customWidgets/custom_text_field.dart';
import 'package:sarya/customWidgets/data_loading.dart';
import 'package:sarya/customWidgets/dial_trip_estimation_cost.dart';
import 'package:sarya/customWidgets/dialoge_select_trip_type.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/text_decorated_icon.dart';
import '../../helper/helper_methods.dart';
import '../intinerary_view_model/Trip_states.dart';
import '../intinerary_view_model/update_intinerary_cubits.dart';
import '../intinerary_view_model/update_intinerary_states.dart';
import '../model/design_intinerary_request.dart';


class DesignIntineraryScreen extends StatefulWidget {
  final Map map;
  const DesignIntineraryScreen({Key? key, required this.map}) : super(key: key);
  @override
  State<DesignIntineraryScreen> createState() => _DesignIntineraryScreenState();
}

class _DesignIntineraryScreenState extends State<DesignIntineraryScreen> {

  TextEditingController titleController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController intineraryCostController = TextEditingController();
  TextEditingController totalDaysController = TextEditingController();
  List<String> listOfCheckList = [];
  late NavigationService _navigationService;
  int tripCost = 0;
  List<String> checkList = [];
  List<String> tripType = [];
  final ImagePicker _picker = ImagePicker();
  String itineraryCost ='', totalDays = '';
  SharedPrefs pref = SharedPrefs();
  List<Widget> widgetList = [];


  @override
  void initState() {
    widgetList = List<Widget>.generate(99, (int index){
      int i = index +1;
      return Text("$i");
    }, growable: true);

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
                        hintText: 'Itinerary Cost ',
                        size: size,
                        maxLine: 1,
                        prefix: itineraryCost.isEmpty? null :Text(
                          'Itinerary Cost ',
                          style:TextStyle(
                              fontSize: 12.0, color: AppColor.headingColor2),
                        ),
                        textInputType: TextInputType.number,
                        onChange: (v){
                          itineraryCost =v;
                          setState(() {

                          });
                        },
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
                              if(value != null) {
                                print("tripCost.........$value");

                                tripCost = value;
                                setState(() {

                                });
                              }
                          });

                        },
                        child: TextDecoratedContainer(
                          titleWidget:     Text(
                            tripCost == 0 ?'Trip Estimated Cost': 'Trip Cost $tripCost',
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
                      InkWell(
                        onTap: (){

                          cupertino_picker_sheet(context: context, child_items: widgetList, selected_index: (int i ) {
                            int ii = i+1;
                            totalDays = ii.toString();

                            setState(() {
                            });
                          });
                        },
                        child: TextDecoratedContainer(
                            titleWidget:     Text(
                              'Total Days: $totalDays ',
                              style: const TextStyle(
                                  fontSize: 15.0, color: AppColor.headingColor2),
                            ),
                            iconImage: Row(children: [SvgPicture.asset("type_icon".svg)]),
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: AppColor.lightIndigo,
                              size: 20,
                            )),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      BlocBuilder<CheckListCubits, CheckListStates>(
                          builder: (context, state) {
                            List<bool> listOfBool = [];
                            if (state is CheckListLoaded) {
                              listOfCheckList = state.response.result!.toList() ?? [];
                              listOfBool = state.boolList.toList();
                            }
                            return   InkWell(
                                onTap: (){
                                 /* if(checkList.isNotEmpty){
                                    checkList.forEach((element) {
                                      if(listOfCheckList.contains(element)){

                                      }else{
                                        listOfCheckList.add(element);
                                        listOfBool.add(true);
                                      }
                                    });
                                  }*/
                                  _navigationService.navigateTo(checkListRoute,
                                      arguments:{ "checklist": listOfCheckList,
                                                  "listOfBool": listOfBool,
                                                  "bool": false,
                                                   "selectedCheckList": checkList})!.then((value) {
                                            //getCheckList();
                                    if(value != null){
                                      checkList = value;
                                      setState(() {});

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
                                  filesModel = ListOfFilesModel(
                                      file: File(image.path),
                                      percentage: 0.0,
                                      name_of_file:  '${DateTime.now().toUtc().millisecondsSinceEpoch}${image.name}'
                                  );
                                  UploadFile(filesModel!);
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
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                            child: filesModel ==null?
                            SizedBox():
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                height: 100.0,
                                width: 100.0,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 120.0,
                                      width: 120.0,
                                      child: Image.file(
                                          File(filesModel!
                                              .file!
                                              .path),
                                          fit: BoxFit.fill),
                                    ),
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Transform.translate(
                                          offset: Offset(12, -12),
                                          child: IconButton(
                                              onPressed: () {
                                                DeleteFile(
                                                    filesModel!);
                                                filesModel = null;
                                                setState(() {});
                                              },
                                              icon: Icon(Icons.cancel)),
                                        )),
                                    Visibility(
                                      visible: (filesModel!
                                          .percentage! *
                                          100)
                                          .toInt() !=
                                          100,
                                      child: Center(
                                        child: CircularPercentIndicator(
                                          radius: 25.0,
                                          lineWidth: 4.0,
                                          percent: filesModel!
                                              .percentage!,
                                          center: Text(
                                              (filesModel!
                                                  .percentage! *
                                                  100)
                                                  .toInt()
                                                  .toString() +
                                                  '%',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green)),
                                          progressColor: Color(0xFF5e59ed),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(

                                    color: AppColor.aquaCasper2,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
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

    if( titleController.text.isEmpty ||
            summaryController.text.isEmpty ||
            intineraryCostController.text.isEmpty ||
            tripCost ==0 ||
            tripType.isEmpty ||
            totalDays.isEmpty ||
            checkList.isEmpty ||
                filesModel == null){
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
        int totalDay = int.parse(totalDays);
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
            profileImg: filesModel!.name_of_file,
            days: []
        );
        print("createIntineraryRequest ......${createIntineraryRequest.toJson()}");
        context.read<UpdateIntineraryCubits>().updateDesignIntineraryPage(createIntineraryRequest: createIntineraryRequest, navigationService: _navigationService,route: "Continue", destination: widget.map['destination'], itineraryId: widget.map['id']);

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
        totalDays.isEmpty ||
        checkList.isEmpty ||
        filesModel == null ){
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

        int totalDay = int.parse(totalDays);
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
            profileImg: filesModel == null? "":filesModel!.name_of_file,
            live: false,

            days: []
        );
        context.read<UpdateIntineraryCubits>().updateDesignIntineraryPage(createIntineraryRequest: createIntineraryRequest, navigationService: _navigationService,route: "Save", itineraryId: widget.map['id']);

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

  ListOfFilesModel? filesModel;

  UploadFile(ListOfFilesModel file_model) async {
    final minio = Minio(
        endPoint: 's3.me-south-1.amazonaws.com',
        accessKey: 'AKIAUNGGSVHDAGLUFYNY',
        secretKey: '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',
        region: 'me-south-1');
    // String result =
    //     await minio.fPutObject('testingsarya', '${file.name}', '${file.path}');
    Uint8List bytes = File(file_model.file!.path).readAsBytesSync();
    print(bytes.length);
    print('name_of_file...........${file_model.name_of_file}');
    String result = await minio.putObject(
      'sarya-assets',
      'itinerary/${file_model.name_of_file}',
      Stream<Uint8List>.value(bytes),
      onProgress: (result) {
        filesModel!.percentage = result / bytes.length;
        setState(() {});
      },
    );
    print('result......$result');
  }

  DeleteFile(ListOfFilesModel model) async {
    final minio = Minio(
        endPoint: 's3.me-south-1.amazonaws.com',
        accessKey: 'AKIAUNGGSVHDAGLUFYNY',
        secretKey: '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',
        region: 'me-south-1');
    await minio.removeObject('sarya-assets', 'itinerary/${model.name_of_file}');
    print('Delete file');
  }


}
