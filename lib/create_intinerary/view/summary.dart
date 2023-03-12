import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/activity_states.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/checklist_cubits.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/home/home_view_model/itinerary_by_id_cubits.dart';
import 'package:sarya/home/home_view_model/itinerary_by_id_states.dart';
import 'package:sarya/home/home_view_model/purchase_itinerary_by_id_cubits.dart';
import 'package:sarya/home/home_view_model/start_itinerary_cubits.dart';
import 'package:sarya/home/itineraryByIDResponse.dart';
import 'package:sarya/home/model/start_request.dart';
import 'package:sarya/pinLocationMap.dart';
import 'package:sarya/utils/constant.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../core/network/routes/api_routes.dart';
import '../../helper/helper_methods.dart';
import '../../home/model/purchase_itinerary_request.dart' as req;
import '../../locator.dart';
import '../intinerary_view_model/CheckList_states.dart';
import '../intinerary_view_model/activity_cubits.dart';
import '../intinerary_view_model/summary_update_intinerary_cubits.dart';
import '../model/summary_update_intinerary_request.dart' ;

class SummaryScreen extends StatefulWidget {
  final String routeName;
  final Map map;
  const SummaryScreen({Key? key, required this.routeName,required this.map}) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {


  // on below line we have set the camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(19.0759837, 72.8776559),
    zoom: 1,
  );

  Set<Marker> _marker = HashSet<Marker>();
  late GoogleMapController _mapController;

  late NavigationService _navigationService;
  List listIncluded =[{"title":"Checklist","icon":"checklist_icon"},{"title":"Airport","icon":"airplane_icon"},{"title":"Transport","icon":"transport_icoon"},{"title":"Accommodation","icon":"accomadation"},
    {"title":"Activities","icon":"activityy_Icon"},{"title":"Breakfast","icon":"lunch_icon"},{"title":"Lunch","icon":"lunch_icon"},{"title":"Dinner","icon":"lunch_icon"},{"title":"Shopping","icon":"market_icon"},{"title":"Restaurant","icon":"coffee_icon"}
  ];

  late Map signInResponse;

  SharedPrefs sharedPrefs = SharedPrefs();
  String user = '';
  String userName = '';
  String nationality = '';

  @override
  void initState() {
    String id = widget.map['id'];
    print("id...........$id");
    getSelectedCountries();
    context.read<ItineraryByIDCubits>().getItineraryByID(itineraryID: id, callTyp: widget.routeName );
    super.initState();
    _navigationService = locator<NavigationService>();
  }


  getSelectedCountries()async{
     signInResponse =await sharedPrefs.getUser();
      user = "${signInResponse['firstName']} ${signInResponse['lastName']}";
      nationality = "${signInResponse['nationality']}";
      userName = "${signInResponse['userName']}";
     setState(() {

    });

  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(
        child:   BlocBuilder<ItineraryByIDCubits, ItineraryByIDStates>(
            builder: (context, state) {
              if (state is ItineraryByIDInitial) {
                return SizedBox();
              }

              if (state is ItineraryByIDLoading) {
                Center(child: CupertinoActivityIndicator());
              }

              if (state is ItineraryByIDLoaded) {
                ByIDResult byIDResult = state.byIDResult;
                var destination = byIDResult.destination;
                List<List<FlagInformation>> list = state.listOfLatLng??[];
                ByIDState? stateID = state.state;

                return  Scaffold(
                  backgroundColor: AppColor.whiteColor,
                  appBar: AppBar(
                    elevation: 0,
                    toolbarHeight: 60,
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColor.lightIndigo,
                      ),
                      onPressed: () {
                        _navigationService.goBack();
                      },
                    ),
                    backgroundColor: AppColor.aquaCasper2,
                    title:const Text(
                      "Summary",
                      style:  TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
                    ),
                    centerTitle: true,
                    actions: [
                      /*        IconButton(
                icon: const Icon(
                  Icons.question_mark,
                  color: AppColor.lightIndigo,
                ),
                onPressed: () {
                  _navigationService.navigateTo(shareIntineraryRoute);
                },
              ),*/
                    ],
                  ),
                  bottomNavigationBar: Container(
                      height: 120,
                      color: AppColor.whiteColor,
                      child:
                      widget.routeName  == sold ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              String id = widget.map['id'];
                              SummaryUpdateIntineraryRequest summary = SummaryUpdateIntineraryRequest(live: true,step: 4);
                              context.read<SummaryUpdateIntineraryCubits>().summaryUpdateIntineraryPage(summaryUpdateIntineraryRequest:summary, navigationService:  _navigationService, route:"Save", id: id);
                              // _navigationService.navigateTo(draftIntineraryRoute);
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
                              String id = widget.map['id'];

                              SummaryUpdateIntineraryRequest summary = SummaryUpdateIntineraryRequest(live: true,step: 4);
                              context.read<SummaryUpdateIntineraryCubits>().summaryUpdateIntineraryPage(summaryUpdateIntineraryRequest:summary, navigationService:  _navigationService, route:"Sold", id: id, );

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
                      ):
                      widget.routeName  == start ? Center(child: InkWell(
                        onTap: () {
                         if(widget.map['type'] == 'active') {
                           StartRequest startRequest = StartRequest(
                               itinerary: StartItinerary(
                                   sId: widget.map['id'], active: true));

                           context.read<StartItineraryStateCubits>()
                               .setStartItineraryState(
                               startRequest: startRequest);
                         }

                         if(stateID != null) {
                           int day = stateID.day??0;
                           _navigationService.navigateTo(mapViewRoute,
                               arguments: {
                                 "listOfMarker": list,
                                 'totalDays': byIDResult.totalDays,
                                 "id": widget.map['id'],
                                 "step": day
                               });
                         }else{
                           _navigationService.navigateTo(mapViewRoute,
                               arguments: {
                                 "listOfMarker": list,
                                 'totalDays': byIDResult.totalDays,
                                 "id": widget.map['id'],
                                 "step": 0
                               });

                           
                         }
                        },
                        child: Container(
                          height: 46.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                              color: AppColor.buttonColor,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: const Center(
                            child: Text(
                              "Start",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.whiteColor),
                            ),
                          ),
                        ),
                      ) ):
                      widget.routeName  == purchase ?
                      Center(child: InkWell(
                        onTap: () {
                          req.PurchaseItineraryRequest request = req.PurchaseItineraryRequest(itinerary: req.Itinerary(
                              sId: widget.map["id"],
                              userName: userName
                          ));
                          context.read<PurchaseItineraryByIDCubits>().purchaseItinerary(request: request, navigationService: _navigationService);


                        },
                        child: Container(
                          height: 46.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                              color: AppColor.buttonColor,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: const Center(
                            child: Text(
                              "Purchase",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.whiteColor),
                            ),
                          ),
                        ),
                      )) :SizedBox.shrink()
                    /*    Center(child: InkWell(
                onTap: () {},
                child: Container(
                  height: 46.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      color: AppColor.buttonColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Center(
                    child: Text(
                      "Edit",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: AppColor.whiteColor),
                    ),
                  ),
                ),
              ) )*/
                  ),
                  body: SingleChildScrollView(
                      physics:const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            height: size.height * 0.200,
                            width: size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage("${ApiRoutes.picBaseURL}${byIDResult.profileImg}"),fit: BoxFit.fill)
                            ),
                          ),
                          const SizedBox(height: 10.0,),
                          SizedBox(
                            height: 91.0,
                            child:destination == null? SizedBox.shrink() :destination.isEmpty? SizedBox.shrink() :ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: destination.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {

                                var image_index = Flags.listOfFlag.indexWhere(
                                        (element) =>
                                    element ==
                                        "lib/assets/flags/${destination[index]}.png");

                                return Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children:  [
                                      SizedBox(
                                          height: 60.0,
                                          width: 70.0,
                                          child: image_index != -1
                                              ? Image.asset(Flags
                                              .listOfFlag[image_index])
                                              : Icon(
                                            Icons.flag,
                                            size: 40,
                                            color: AppColor.lightIndigo,
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${ destination.isEmpty? "":destination[index]}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColor.headingColor2,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  width: 20,
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 15.0,),
                          Padding(
                            padding: const EdgeInsets.only(left: 27.0, right: 27.0),
                            child: Container(
                              height: 76,
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  borderRadius:BorderRadius.circular(15) ,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(2, 2),
                                        color: Colors.grey.withOpacity(0.6),
                                        blurRadius: 3),
                                    BoxShadow(
                                        offset: const Offset(-3, -3),
                                        color: Colors.grey.withOpacity(0.1),
                                        blurRadius: 3)
                                  ]
                              ),
                              child: ListTile(
                                title:  Text.rich(
                                    TextSpan(
                                        text: '',
                                        children: <InlineSpan>[
                                          TextSpan(
                                            text: 'Trip to ${destination == null?"": destination![0]} ',
                                            style:TextStyle(fontSize: 13.0, color: AppColor.lightIndigo, fontWeight: FontWeight.w500),
                                          ),
                                          TextSpan(
                                            text: 'by $user',
                                            style:TextStyle(fontSize: 13.0, color: AppColor.colorBlack, fontWeight: FontWeight.w500),
                                          )
                                        ]
                                    )
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      "$nationality",
                                      style:  TextStyle(fontSize: 12.0, color: AppColor.colorLiteBlack5),
                                    ),
                                  ],
                                ),
                                trailing: Container(
                                  height: 30,
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColor.aquaCasper.withOpacity(0.5)
                                  ),
                                  child: Center(
                                    child: Text(
                                      "\$${byIDResult.cost??''}",
                                      style:  TextStyle(fontSize: 13.0, color: AppColor.lightIndigo),
                                    ),

                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25.0,),
                          Padding(
                            padding: const EdgeInsets.only(left: 27.0, right: 27.0),
                            child: Builder(
                              builder: (context) {
                                List<FlagInformation> listOfFlag = [];
                                list.forEach((element) {
                                  listOfFlag.addAll(element);
                                });
                                return PinLocationMap(
                                  height: 146,
                                  width: size.width,
                                  onTap: (){

                                  },
                                  list_of_flag_information: listOfFlag,
                                  selected_place_information: (FlagInformation ) {  },
                                );
                              }
                            )

                            /*Container(
                    height: 146,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: AppColor.colorBlue,
                        borderRadius:BorderRadius.circular(15) ,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(2, 2),
                              color: Colors.grey.withOpacity(0.6),
                              blurRadius: 3),
                          BoxShadow(
                              offset: const Offset(-3, -3),
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 3)
                        ]
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: GoogleMap(
                        mapType: MapType.normal,
                        markers: _marker,
                        initialCameraPosition: _kGoogle,
                        mapToolbarEnabled: false,
                        myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                        zoomControlsEnabled: true,

                        onMapCreated: (GoogleMapController controller) {
                          _mapController = controller;
                        },
                      ),
                    ),
                  )*/,
                          ),
                          const SizedBox(height: 15.0,),
                          const Padding(
                            padding:  EdgeInsets.only(left: 29.0, right: 27.0),
                            child:  Align(
                                alignment: Alignment.centerLeft,
                                child:  Text("Summary", style: TextStyle(fontSize: 14.0,color: AppColor.colorBlue,fontWeight: FontWeight.w500),)),
                          ),
                          const SizedBox(height: 5.0,),
                          Padding(
                            padding:  EdgeInsets.only(left: 29.0, right: 27.0),
                            child:  Align(
                                alignment: Alignment.centerLeft,
                                child:  Text("${byIDResult.summary??''}", style: TextStyle(fontSize: 12.0,color: AppColor.headingColor2,fontWeight: FontWeight.w400),)),
                          ),
                          const SizedBox(height: 15.0,),
                          Padding(
                            padding:  EdgeInsets.only(left: 29.0, right: 27.0),
                            child:  Align(
                              alignment: Alignment.centerLeft,
                              child:  Text.rich(
                                  TextSpan(
                                      text: '',
                                      children: <InlineSpan>[
                                        TextSpan(
                                          text: 'Trip Cost ',
                                          style:TextStyle(fontSize: 14.0, color: AppColor.headingColor2, fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(
                                          text: '\$${"${byIDResult.tripCost??''}"}',
                                          style:TextStyle(fontSize: 13.0, color: AppColor.headingColor2, fontWeight: FontWeight.w500),
                                        )
                                      ]
                                  )
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0,),
                          Padding(
                            padding:  EdgeInsets.only(left: 29.0, right: 27.0),
                            child:  Align(
                              alignment: Alignment.centerLeft,
                              child:  Text.rich(
                                  TextSpan(
                                      text: '',
                                      children: <InlineSpan>[
                                        TextSpan(
                                          text: 'Trip Days: ',
                                          style:TextStyle(fontSize: 14.0, color: AppColor.headingColor2, fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(
                                          text: '${"${byIDResult.totalDays??''}"}',
                                          style:TextStyle(fontSize: 13.0, color: AppColor.headingColor2, fontWeight: FontWeight.w500),
                                        )
                                      ]
                                  )
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0,),
                          Padding(
                            padding:  EdgeInsets.only(left: 29.0, right: 27.0),
                            child:  Align(
                              alignment: Alignment.centerLeft,
                              child:  Text.rich(
                                  TextSpan(
                                      text: '',
                                      children: <InlineSpan>[
                                        TextSpan(
                                          text: 'Trip type: ',
                                          style:TextStyle(fontSize: 14.0, color: AppColor.headingColor2, fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(
                                          text: '${"${byIDResult.tripType == null?"":byIDResult.tripType![0]}"}',
                                          style:TextStyle(fontSize: 13.0, color: AppColor.headingColor2, fontWeight: FontWeight.w500),
                                        )
                                      ]
                                  )
                              ),
                            ),
                          ),
                          const SizedBox(height: 15.0,),
                          const Padding(
                            padding:  EdgeInsets.only(left: 29.0, right: 27.0),
                            child:  Align(
                                alignment: Alignment.centerLeft,
                                child:  Text("Included", style: TextStyle(fontSize: 14.0,color: AppColor.colorBlue,fontWeight: FontWeight.w500),)),
                          ),
                          const SizedBox(height: 10.0,),
                          Padding(
                              padding:const  EdgeInsets.only(left: 20.0, right: 27.0),
                              child: Wrap(
                                spacing: 20,
                                runSpacing: 20,
                                children: [
                                  BlocBuilder<CheckListCubits, CheckListStates>(
                                      builder: (context, state) {
                                        List<bool> listOfBool = [];
                                        List<String>  checkList = [];
                                        if (state is CheckListLoaded) {
                                          checkList = state.response.result!.toList() ?? [];
                                          listOfBool = state.boolList.toList();
                                        }
                                        return   Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: (){

                                                  List<String> preSelectedCheckList = byIDResult.checklist??[];

                                                  print("preSelectedCheckList.....${preSelectedCheckList.length}");
                                                  _navigationService.navigateTo(checkListRoute,
                                                      arguments:{ "checklist": checkList,
                                                        "listOfBool": listOfBool,
                                                        "bool": true,
                                                        "selectedCheckList": preSelectedCheckList});



                                                },
                                                child: Container(
                                                  height: 65.0,
                                                  width: 65.0,
                                                  decoration: BoxDecoration(
                                                    color: AppColor.aquaCasper2,
                                                    borderRadius: BorderRadius.circular(10),

                                                  ),
                                                  child: Center(
                                                    child: SvgPicture.asset("${listIncluded[0]['icon']}".svg),
                                                  ),

                                                ),
                                              ),
                                              const SizedBox(height: 5,),
                                              Text("${listIncluded[0]['title']}",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 12.0,color: AppColor.colorBlack,fontWeight: FontWeight.w500),)
                                            ]);;
                                      }),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: (){



                                          },
                                          child: Container(
                                            height: 65.0,
                                            width: 65.0,
                                            decoration: BoxDecoration(
                                              color: AppColor.aquaCasper2,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: SvgPicture.asset("${listIncluded[1]['icon']}".svg),
                                            ),

                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                        Text("${listIncluded[1]['title']}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12.0,color: AppColor.colorBlack,fontWeight: FontWeight.w500),)
                                      ]),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: (){



                                          },
                                          child: Container(
                                            height: 65.0,
                                            width: 65.0,
                                            decoration: BoxDecoration(
                                              color: AppColor.aquaCasper2,
                                              borderRadius: BorderRadius.circular(10),

                                            ),
                                            child: Center(
                                              child: SvgPicture.asset("${listIncluded[2]['icon']}".svg),
                                            ),

                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                        Text("${listIncluded[2]['title']}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12.0,color: AppColor.colorBlack,fontWeight: FontWeight.w500),)
                                      ]),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: (){



                                          },
                                          child: Container(
                                            height: 65.0,
                                            width: 65.0,
                                            decoration: BoxDecoration(
                                              color: AppColor.aquaCasper2,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: SvgPicture.asset("${listIncluded[3]['icon']}".svg),
                                            ),

                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                        Text("${listIncluded[3]['title']}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12.0,color: AppColor.colorBlack,fontWeight: FontWeight.w500),)
                                      ]),
                                  BlocBuilder<ActivityCubits, ActivityStates>(
                                      builder: (context, state) {
                                        List<String> list = [];
                                        List<bool> listOfBool = [];
                                        if (state is ActivityLoaded) {
                                          list = state.activityTypeResponse.result ?? [];
                                          listOfBool = state.listOfBool;
                                        }
                                        return  Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: (){

                                                },
                                                child: Container(
                                                  height: 65.0,
                                                  width: 65.0,
                                                  decoration: BoxDecoration(
                                                    color: AppColor.aquaCasper2,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Center(
                                                    child: SvgPicture.asset("${listIncluded[4]['icon']}".svg),
                                                  ),

                                                ),
                                              ),
                                              const SizedBox(height: 5,),
                                              Text("${listIncluded[4]['title']}",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 12.0,color: AppColor.colorBlack,fontWeight: FontWeight.w500),)
                                            ]);
                                      }),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: (){


                                            List<String> nameOfImage = byIDResult
                                                .days![0].breakfast!.imagesPublic!;
                                            List<String> linkPath = List<
                                                String>.generate(
                                                nameOfImage.length, (
                                                index) => '${ApiRoutes
                                                .picBaseURL}${nameOfImage[index]}');

                                            _navigationService.navigateTo(
                                                storyViewRoute,
                                                arguments: linkPath);

                                          },
                                          child: Container(
                                            height: 65.0,
                                            width: 65.0,
                                            decoration: BoxDecoration(
                                              color: AppColor.aquaCasper2,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: SvgPicture.asset("${listIncluded[5]['icon']}".svg),
                                            ),

                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                        Text("${listIncluded[5]['title']}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12.0,color: AppColor.colorBlack,fontWeight: FontWeight.w500),)
                                      ]),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: (){

                                            List<String> nameOfImage = byIDResult
                                                .days![0].lunch!.imagesPublic!;
                                            List<String> linkPath = List<
                                                String>.generate(
                                                nameOfImage.length, (
                                                index) => '${ApiRoutes
                                                .picBaseURL}${nameOfImage[index]}');

                                            _navigationService.navigateTo(
                                                storyViewRoute,
                                                arguments: linkPath);


                                          },
                                          child: Container(
                                            height: 65.0,
                                            width: 65.0,
                                            decoration: BoxDecoration(
                                              color: AppColor.aquaCasper2,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: SvgPicture.asset("${listIncluded[6]['icon']}".svg),
                                            ),

                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                        Text("${listIncluded[6]['title']}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12.0,color: AppColor.colorBlack,fontWeight: FontWeight.w500),)
                                      ]),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: (){

                                            List<String> nameOfImage = byIDResult
                                                .days![0].dinner!.imagesPublic!;
                                            List<String> linkPath = List<
                                                String>.generate(
                                                nameOfImage.length, (
                                                index) => '${ApiRoutes
                                                .picBaseURL}${nameOfImage[index]}');

                                            _navigationService.navigateTo(
                                                storyViewRoute,
                                                arguments: linkPath);

                                          },
                                          child: Container(
                                            height: 65.0,
                                            width: 65.0,
                                            decoration: BoxDecoration(
                                              color: AppColor.aquaCasper2,
                                              borderRadius: BorderRadius.circular(10),


                                            ),
                                            child: Center(
                                              child: SvgPicture.asset("${listIncluded[7]['icon']}".svg),
                                            ),

                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                        Text("${listIncluded[7]['title']}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12.0,color: AppColor.colorBlack,fontWeight: FontWeight.w500),)
                                      ]),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: (){

                                            List<String> nameOfImage = byIDResult
                                                .days![0].marketMallsStores!.imagesPublic!;
                                            List<String> linkPath = List<
                                                String>.generate(
                                                nameOfImage.length, (
                                                index) => '${ApiRoutes
                                                .picBaseURL}${nameOfImage[index]}');

                                            _navigationService.navigateTo(
                                                storyViewRoute,
                                                arguments: linkPath);



                                          },
                                          child: Container(
                                            height: 65.0,
                                            width: 65.0,
                                            decoration: BoxDecoration(
                                              color: AppColor.aquaCasper2,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: SvgPicture.asset("${listIncluded[8]['icon']}".svg),
                                            ),

                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                        Text("${listIncluded[8]['title']}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12.0,color: AppColor.colorBlack,fontWeight: FontWeight.w500),)
                                      ]),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: (){

                                            List<String> nameOfImage = byIDResult
                                                .days![0].coffeeClubsLounges!.imagesPublic!;
                                            List<String> linkPath = List<
                                                String>.generate(
                                                nameOfImage.length, (
                                                index) => '${ApiRoutes
                                                .picBaseURL}${nameOfImage[index]}');

                                            _navigationService.navigateTo(
                                                storyViewRoute,
                                                arguments: linkPath);



                                          },
                                          child: Container(
                                            height: 65.0,
                                            width: 65.0,
                                            decoration: BoxDecoration(
                                              color: AppColor.aquaCasper2,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: SvgPicture.asset("${listIncluded[9]['icon']}".svg),
                                            ),

                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                        Text("${listIncluded[9]['title']}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12.0,color: AppColor.colorBlack,fontWeight: FontWeight.w500),)
                                      ]),
                                ],)

                          ),

                        ],
                      )




                  ),

                );
              }

              return SizedBox();

            })




      ),
    );
  }
}
