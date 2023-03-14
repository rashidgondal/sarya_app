import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geojson/geojson.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/home/home_view_model/created_itinerary_states.dart';
import 'package:sarya/home/home_view_model/purchase_itineraries_cubits.dart';
import 'package:sarya/home/home_view_model/purchase_itineraries_states.dart';
import 'package:sarya/home/model/all_purchases_response.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../core/network/routes/api_routes.dart';
import '../../create_intinerary/intinerary_view_model/activity_cubits.dart';
import '../../create_intinerary/intinerary_view_model/checklist_cubits.dart';
import '../../create_intinerary/intinerary_view_model/transport_cubits.dart';
import '../../create_intinerary/intinerary_view_model/trip_cubits.dart';
import '../../customWidgets/drawer_screen.dart';
import '../../helper/helper_methods.dart';
import '../../navigation/navigation_service.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:timeago/timeago.dart' as timeago;
import '../../pinLocationMap.dart';
import '../home_view_model/created_itinerary_cubits.dart';

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
    _navigationService = locator<NavigationService>();

    context.read<PurchaseItinerariesCubits>().getPurchaseItinerary(isEmpty: ()async{
      final geo = GeoJson();
      final data =
          await rootBundle.loadString('lib/assets/json_data/countries.geojson');
      await geo.parse(data, verbose: true);

      features = geo.features;
      boolList = List.filled(features.length, false);
      _navigationService.navigateTo(destinationRout, arguments: {"country":features, "boolList": boolList});
    });
    Flags.getImages();
    parseAndDrawAssetsOnMap();
    super.initState();
    getUserInfo();
    context.read<TripCubits>().getTrip();
    context.read<CheckListCubits>().getCheckList();
    context.read<ActivityCubits>().getActivity();
    context.read<TransportCubits>().getTransport();
    getCurrentLocation();
  }

  getCurrentLocation()async{
    Position position = await CurrentLocation.determinePosition();
     CurrentLocation.lat = position.latitude;
    CurrentLocation.lng = position.longitude;
  }

  Future<void> parseAndDrawAssetsOnMap() async {

    final geo = GeoJson();
    final data =
    await rootBundle.loadString('lib/assets/json_data/countries.geojson');
    await geo.parse(data, verbose: true);

    features = geo.features;
    boolList = List.filled(features.length, false);

  }

  getUserInfo() async {
    SharedPrefs pref = SharedPrefs();

    map = await pref.getUser();
    setState(() {});

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
                        :

                    map!['avatar'] ==null? SvgPicture.asset('user'.svg, height: 26.0, width: 26.0,):SvgPicture.network(map!['avatar'], height: 26.0, width: 26.0,),
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
                    onPressed: () {
                      _navigationService.navigateTo(soldIntineraryRoute);

                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset('home_appbar_icon_2'.svg),
                    onPressed: () {
                      _navigationService.navigateTo(draftIntineraryRoute);
                    },
                  ),
                ],
              ),
              body: RefreshIndicator(
                onRefresh: () async{
                  getUserInfo();
                  context.read<PurchaseItinerariesCubits>().getPurchaseItinerary(isEmpty: (){
                    _navigationService.navigateTo(destinationRout, arguments: {"country":features, "boolList": boolList});

                  });
                },
                child: Stack(
                  children: [
                    BlocBuilder<PurchaseItinerariesCubits, PurchaseItinerariesStates>(
                        builder: (context, state) {
                          List<Purchased> purchasedItineraries = [];
                          List<Created> createdItineraries = [];
                          List<Active> activeItineraries = [];

                          if (state is PurchaseItineraryInitial) {
                            return SizedBox();
                          }

                          if (state is PurchaseItineraryLoading) {
                            Center(child: CupertinoActivityIndicator());
                          }

                          if (state is PurchaseItineraryLoaded) {
                            purchasedItineraries = state.purchasedItineraries;
                            createdItineraries  = state.createdItineraries;
                            activeItineraries  = state.activeItineraries;

                          }

                          return SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
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
                                createdItineraries.isEmpty? SizedBox.shrink():  SizedBox(
                                    height: 125,
                                    child: ListView.builder(
                                        itemCount: createdItineraries.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        padding: EdgeInsets.only(top: 10),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (BuildContext context, int index){
                                          if(index == 0){
                                            return InkWell(
                                              onTap: (){
                                                String id = createdItineraries[index].sId??'';
                                                _navigationService.navigateTo(
                                                    summaryRoutEdit, arguments:{ "id": id, "type":""});


                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30.0,right: 10,top: 0),
                                                child: Container(
                                                  height: 111.0,
                                                  width: 101.0,
                                                  decoration: BoxDecoration(
                                                      color: AppColor.aquaCasper2,
                                                      image: DecorationImage(
                                                          onError: (o, s){

                                                          },
                                                          image: NetworkImage("${ApiRoutes.picBaseURL}${createdItineraries[index].profileImg}",),
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
                                                            "${createdItineraries[index].title??''}",
                                                            style: TextStyle(
                                                                fontSize: 10.0, color: AppColor.whiteColor, fontWeight: FontWeight.w500),
                                                          ),
                                                        )
                                                      ],),
                                                      SizedBox(height: 10,),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          return InkWell(
                                            onTap: (){
                                              String id = createdItineraries[index].sId??'';
                                              _navigationService.navigateTo(
                                                  summaryRoutEdit, arguments:{ "id": id, "type":""});

                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0, top: 0),
                                              child: Container(
                                                height: 111.0,
                                                width: 101.0,
                                                decoration: BoxDecoration(
                                                    color: AppColor.aquaCasper2,
                                                    image:createdItineraries[index].profileImg == null?null :DecorationImage(image: NetworkImage("${ApiRoutes.picBaseURL}${createdItineraries[index].profileImg}"),
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
                                                          "${createdItineraries[index].title??''}",
                                                          style: TextStyle(
                                                              fontSize: 10.0, color: AppColor.whiteColor, fontWeight: FontWeight.w500),
                                                        ),
                                                      )
                                                    ],),
                                                    SizedBox(height: 10,),

                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        })


                                ),
                                activeItineraries.isEmpty?SizedBox.shrink():    const SizedBox(
                                  height: 30.0,
                                ),
                                activeItineraries.isEmpty?SizedBox.shrink():    const Padding(
                                  padding: EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    "Active Itineraries",
                                    style: TextStyle(
                                        fontSize: 17.0, color: AppColor.colorLiteBlack5),
                                  ),
                                ),
                                activeItineraries.isEmpty?SizedBox.shrink():    SizedBox(
                                    height: 125,
                                    child: ListView.builder(
                                        itemCount: activeItineraries.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        padding: EdgeInsets.only(top: 10),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (BuildContext context, int index){
                                          if(index == 0){
                                            return InkWell(
                                              onTap: (){
                                                _navigationService.navigateTo(summaryRoutStart ,arguments: {"id":purchasedItineraries[index].sId, "type":""});
                                                },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30.0,right: 10,top: 0),
                                                child: Container(
                                                  height: 111.0,
                                                  width: 101.0,
                                                  decoration: BoxDecoration(
                                                      color: AppColor.aquaCasper2,
                                                      image: DecorationImage(image: NetworkImage("${ApiRoutes.picBaseURL}${activeItineraries[index].profileImg}"),
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
                                                            "${activeItineraries[index].title??''}",
                                                            style: TextStyle(
                                                                fontSize: 10.0, color: AppColor.whiteColor, fontWeight: FontWeight.w500),
                                                          ),
                                                        )
                                                      ],),
                                                      SizedBox(height: 10,),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          return InkWell(
                                            onTap: (){
                                              String id = activeItineraries[index].sId??'';
                                              _navigationService.navigateTo(
                                                  summaryRoutEdit, arguments:{ "id": id, "type":"active"});

                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0, top: 0),
                                              child: Container(
                                                height: 111.0,
                                                width: 101.0,
                                                decoration: BoxDecoration(
                                                    color: AppColor.aquaCasper2,
                                                    image:activeItineraries[index].profileImg == null?null :DecorationImage(image: NetworkImage("${ApiRoutes.picBaseURL}${activeItineraries[index].profileImg}"),
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
                                                          "${activeItineraries[index].title??''}",
                                                          style: TextStyle(
                                                              fontSize: 10.0, color: AppColor.whiteColor, fontWeight: FontWeight.w500),
                                                        ),
                                                      )
                                                    ],),
                                                    SizedBox(height: 10,),

                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        })
                                ),
                                SizedBox(height: 10,),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                purchasedItineraries.isEmpty?SizedBox.shrink(): const Padding(
                                  padding: EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    "Purchased Itineraries",
                                    style: TextStyle(
                                        fontSize: 17.0, color: AppColor.colorLiteBlack5),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                ListView.builder(
                                    itemCount: purchasedItineraries.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          _navigationService.navigateTo(summaryRoutStart ,arguments: {"id":purchasedItineraries[index].sId, "type":"active"});
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0, left: 15, top: 10),
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
                                                    child: CachedNetworkImage(
                                                      imageUrl: "${ApiRoutes.picBaseURL}${purchasedItineraries[index].profileImg}",
                                                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                          CircularProgressIndicator(value: downloadProgress.progress),
                                                      errorWidget: (context, url, error) => SizedBox.shrink(),
                                                    ),


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
                                                      Text(
                                                        "${purchasedItineraries[index].title}",
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
                                                        children: [

                                                          Text(
                                                            "${purchasedItineraries[index].destination.toString().replaceAll('[', '').replaceAll(']', '').trim()}",
                                                            style: TextStyle(
                                                                fontSize: 11.0,
                                                                fontWeight: FontWeight.w500,
                                                                color: AppColor.subtitleColor),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        '',
                                                        //"${timeago.format(DateTime.parse('${purchasedItineraries[index].createdAt}'))} , ${purchasedItineraries[index].totalDays} day package",
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
                                                            "(5)",
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
                                               /*   Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 10, vertical: 10),
                                                    decoration: BoxDecoration(
                                                      color: AppColor.aquaCasper2,
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                    child: Text(
                                                      */
                                                  /*"\$${purchasedItineraries[index].cost}"*//*"",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 10,
                                                          color: AppColor.lightIndigo),
                                                    ),
                                                  ),*/
                                                  SizedBox(
                                                    width: 5,
                                                  )
                                                ],
                                              )),
                                        ),
                                      );
                                    })
                              ],
                            ),
                          );


                        }
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
              ),
    ));
  }
}
