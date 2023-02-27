import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geojson/geojson.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../create_intinerary/intinerary_view_model/airport_cubits.dart';
import '../../customWidgets/drawer_screen.dart';
import '../../navigation/navigation_service.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../shop/shop_view_model/Status_itinerary_states.dart';
import '../../shop/shop_view_model/status_itinerary_cubits.dart';

class ItineraryScreen extends StatefulWidget {
  const ItineraryScreen({Key? key}) : super(key: key);

  @override
  State<ItineraryScreen> createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  late NavigationService _navigationService;
  String? profilePath;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   Map? map;
  late List<GeoJsonFeature> features;
  var boolList = [];
  @override
  void initState() {
    context.read<StatusItineraryCubits>().getStatusItinerary(status: true);

    parseAndDrawAssetsOnMap();
    super.initState();
    context.read<AirportCubits>().getAirport();
    _navigationService = locator<NavigationService>();
    getUserInfo();
  }


  Future<void> parseAndDrawAssetsOnMap() async {

    final geo = GeoJson();
    final data =
    await rootBundle.loadString('lib/assets/json_data/countries.geojson');
    await geo.parse(data, verbose: true);

    features = geo.features;
    print("features ....${features.length}");
    boolList = List.filled(features.length, false);

  }


  getUserInfo() async {
    print("..........");
    SharedPrefs pref = SharedPrefs();

    map = await pref.getUser();
    setState(() {});

  }

  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
              key: _scaffoldKey,
              backgroundColor: AppColor.whiteColor,
              drawer: DrawerScreen(),
              appBar: AppBar(
                elevation: 0,
                toolbarHeight: 60,
                leading: IconButton(
                    icon: map == null
                        ? SvgPicture.asset('user'.svg, height: 26.0, width: 26.0,)
                        : SvgPicture.network(map!['avatar'], height: 26.0, width: 26.0,),
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    }),
                backgroundColor: AppColor.aquaCasper2,
                title: const Text(
                  "Itinerary",
                  style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: SvgPicture.asset('home_appbar_icon_1'.svg),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: SvgPicture.asset('home_appbar_icon_2'.svg),
                    onPressed: () {
                      _navigationService.navigateTo(draftIntineraryRoute);
                    },
                  ),
                ],
              ),
              body: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: Text(
                          "Created Itineraries",
                          style: TextStyle(
                              fontSize: 17.0, color: AppColor.colorLiteBlack5),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 125,
                        child: BlocBuilder<StatusItineraryCubits, StatusItineraryStates>(
                        builder: (context, state) {
                          if (state is StatusItineraryInitial) {
                            return SizedBox();
                          }

                          if (state is StatusItineraryLoading) {
                            Center(child: CupertinoActivityIndicator());
                          }

                          if (state is StatusItineraryLoaded) {
                            var list = state.list;
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20.0,),
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: list.length,
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (BuildContext context, int index){
                                            if(index == 0){
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30.0,right: 10,top: 0),
                                                child: Container(
                                                  height: 111.0,
                                                  width: 101.0,
                                                  decoration: BoxDecoration(
                                                      color: AppColor.aquaCasper2,
                                                      image: DecorationImage(image: AssetImage("lib/assets/images/img2.jpeg"),
                                                          fit: BoxFit.fill),
                                                      borderRadius: BorderRadius.circular(8.0),
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
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Row(children: [
                                                        Icon(Icons.location_on,color: AppColor.whiteColor,),
                                                        SizedBox(
                                                          width: 70,
                                                          child: Text(
                                                            "${list[index]['title']??''}",
                                                            style: TextStyle(
                                                                fontSize: 10.0, color: AppColor.whiteColor, fontWeight: FontWeight.w500),
                                                          ),
                                                        )
                                                      ],),
                                                      SizedBox(height: 10,),

                                                    ],
                                                  ),
                                                ),
                                              );
                                            }
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0, top: 0),
                                          child: Container(
                                            height: 111.0,
                                            width: 101.0,
                                            decoration: BoxDecoration(
                                                color: AppColor.aquaCasper2,
                                                image: DecorationImage(image: AssetImage("lib/assets/images/img2.jpeg"),
                                                    fit: BoxFit.fill),
                                                borderRadius: BorderRadius.circular(8.0),
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
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Row(children: [
                                                  Icon(Icons.location_on,color: AppColor.whiteColor,),
                                                  SizedBox(
                                                    width: 70,
                                                    child: Text(
                                                      "${list[index]['title']??''}",
                                                      style: TextStyle(
                                                          fontSize: 10.0, color: AppColor.whiteColor, fontWeight: FontWeight.w500),
                                                    ),
                                                  )
                                                ],),
                                                SizedBox(height: 10,),

                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ],

                            );
                          }

                          return Center(child: Text("data not found"),);

                        }
                      )),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: Text(
                          "Purchase Itineraries",
                          style: TextStyle(
                              fontSize: 17.0, color: AppColor.colorLiteBlack5),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  _navigationService.navigateTo(summaryRoutStart);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 30.0, left: 30, top: 10),
                                  child: Container(
                                      height: 86.0,
                                      width: 101.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          border: Border.all(
                                              width: 1, color: AppColor.borderColor)),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            height: 72.0,
                                            width: 72.0,
                                            decoration: BoxDecoration(
                                                color: AppColor.aquaCasper2,
                                                borderRadius:
                                                    BorderRadius.circular(10.0)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Alina Fahim",
                                                style: TextStyle(
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.headingColor),
                                              ),
                                              const SizedBox(
                                                height: 3.0,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Icon(
                                                    Icons.question_mark,
                                                    size: 10.0,
                                                  ),
                                                  Text(
                                                    " United Arab Emirate",
                                                    style: TextStyle(
                                                        fontSize: 11.0,
                                                        fontWeight: FontWeight.w500,
                                                        color: AppColor.subtitleColor),
                                                  ),
                                                ],
                                              ),
                                              const Text(
                                                "3 months Ago, 5 days Package",
                                                style: TextStyle(
                                                    fontSize: 11.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.headingColor2),
                                              ),
                                              const SizedBox(
                                                height: 3.0,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Icon(
                                                    Icons.star,
                                                    color: AppColor.borderColor,
                                                    size: 15.0,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: AppColor.borderColor,
                                                    size: 15.0,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: AppColor.borderColor,
                                                    size: 15.0,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: AppColor.borderColor,
                                                    size: 15.0,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: AppColor.borderColor,
                                                    size: 15.0,
                                                  ),
                                                  Text(
                                                    " (5)",
                                                    style: TextStyle(
                                                        fontSize: 11.0,
                                                        fontWeight: FontWeight.w500,
                                                        color: AppColor.headingColor2),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.navigate_next_sharp,
                                            size: 30.0,
                                            color: AppColor.lightIndigo,
                                          )
                                        ],
                                      )),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: InkWell(
                        onTap: () {
                          _navigationService.navigateTo(destinationRout, arguments: {"country":features, "boolList": boolList});
                        },
                        child: Container(
                          height: 46.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                              color: AppColor.buttonColor.withOpacity(1),
                              borderRadius: BorderRadius.circular(8.0)),
                          child: const Center(
                            child: Text(
                              "Create New Itinerary",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.whiteColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
    ));
  }
}
