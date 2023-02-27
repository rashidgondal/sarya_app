import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/utils/constant.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../locator.dart';

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

  var listOfCountries = [];

  SharedPrefs sharedPrefs = SharedPrefs();

  @override
  void initState() {
    getSelectedCountries();
    super.initState();
    _navigationService = locator<NavigationService>();

  }

  getSelectedCountries()async{
    listOfCountries =await sharedPrefs.getDestinationCountries();
    setState(() {

    });
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
              IconButton(
                icon: const Icon(
                  Icons.question_mark,
                  color: AppColor.lightIndigo,
                ),
                onPressed: () {
                  _navigationService.navigateTo(shareIntineraryRoute);
                },
              ),
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
            ):
            widget.routeName  == start ?
            Center(child: InkWell(
              onTap: () {},
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
            Center(child: InkWell(
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
            ) )
          ),
          body: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.200,
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('lib/assets/images/img3.jpeg'),fit: BoxFit.fill)
                  ),
                ),
               const SizedBox(height: 10.0,),
                SizedBox(
                  height: 91.0,
                  child:  ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: listOfCountries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                            SizedBox(
                              height: 60.0,
                              width: 70.0,
                              child: Icon(
                                Icons.question_mark,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${listOfCountries[index]}",
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
                      title: const Text.rich(
                          TextSpan(
                              text: '',
                              children: <InlineSpan>[
                                TextSpan(
                                  text: 'Trip to UAE ',
                                  style:TextStyle(fontSize: 13.0, color: AppColor.lightIndigo, fontWeight: FontWeight.w500),
                                ),
                                TextSpan(
                                  text: 'by Elina',
                                  style:TextStyle(fontSize: 13.0, color: AppColor.colorBlack, fontWeight: FontWeight.w500),
                                )
                              ]
                          )
                      ),
                      subtitle: Row(
                        children: const[
                          Icon(Icons.question_mark),
                          Text(
                            " United Arab Emirate",
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
                        child:const Center(
                          child: Text(
                            "\$155",
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
                  child: Container(
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
                  ),
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
                      child:  Text("${widget.map['summary']}", style: TextStyle(fontSize: 12.0,color: AppColor.headingColor2,fontWeight: FontWeight.w400),)),
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
                                text: '\$${"${widget.map['tripCost']}"}',
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
                                text: '${"${widget.map['totalDays']}"}',
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
                                text: '${"${widget.map['tripType']}"}',
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
                          child: GridView.builder(
                            itemCount: listIncluded.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics:const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 65.0,
                                  width: 65.0,
                                  decoration: BoxDecoration(
                                      color: AppColor.aquaCasper2,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: AppColor.borderColor2, width: 1)),
                                  child: Center(
                                    child: SvgPicture.asset("${listIncluded[index]['icon']}".svg),
                                  ),

                                ),
                                const SizedBox(height: 5,),
                                 Text("${listIncluded[index]['title']}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12.0,color: AppColor.colorBlack,fontWeight: FontWeight.w500),)
                          ]),


                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 0.0,
                            ),
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
