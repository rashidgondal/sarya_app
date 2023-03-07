import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geojson/geojson.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/checklist_cubits.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../customWidgets/data_loading.dart';
import '../../helper/helper_methods.dart';
import '../../helper/shared_prefs.dart';
import '../../locator.dart';
import '../../navigation/navigation_service.dart';
import '../../navigation/router_path.dart';
import '../intinerary_view_model/create_intinerary_cubits.dart';
import '../intinerary_view_model/create_intinerary_states.dart';
import '../intinerary_view_model/trip_cubits.dart';
import '../model/create_intinerary_request.dart';
import 'package:flutter/services.dart' show rootBundle;


class SelectDestination extends StatefulWidget {
  final Map map;
  const SelectDestination({Key? key, required this.map}) : super(key: key);

  @override
  State<SelectDestination> createState() => _SelectDestinationState();
}

class _SelectDestinationState extends State<SelectDestination> {
  late NavigationService _navigationService;
  var boolList = [];
  List<String> tempCountryList = [];
  late GoogleMapController _mapController;
  TextEditingController searchController = TextEditingController();
  String searchKeyWord = '';
  SharedPrefs sharedPrefs = SharedPrefs();

  // on below line we have set the camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(19.0759837, 72.8776559),
    zoom: 4,
  );

  Set<Polygon> _polygon = HashSet<Polygon>();
  Set<Marker> _marker = HashSet<Marker>();
  List<GeoJsonFeature> features = [];
  bool loading = true;




  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {

    features  = widget.map['country'];
    boolList  = widget.map['boolList'];
    super.initState();
    _navigationService = locator<NavigationService>();

  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
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
                onPressed: () {
                  _navigationService.goBack();
                },
              ),
              backgroundColor: AppColor.aquaCasper2,
              title: const Text(
                "Select Destination",
                style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
              ),
              centerTitle: true,
            ),
            bottomNavigationBar: Container(
              height: 100.0,
              color: AppColor.whiteColor,
              child: Center(
                child: InkWell(
                  onTap:tempCountryList.isEmpty? null:() async{
                    Map map = await sharedPrefs.getUser();
                    String userName = map['userName'];
                    print("userName.........$userName");
                    CreateIntineraryRequest createIntineraryRequest = CreateIntineraryRequest(destination: tempCountryList, live: false,step: 1, userName: userName);
                   context.read<CreateIntineraryCubits>().createIntinerary(createIntineraryRequest: createIntineraryRequest, navigationService: _navigationService, context: context);
                   // _navigationService.navigateTo(designIntineraryRoute);

                  },
                  child: Container(
                    height: 46.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                        color:tempCountryList.isEmpty? AppColor.headingColor2:AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: AppColor.colorGrey,
                  padding: const EdgeInsets.only(top: 1),
                  child: Container(
                    height: size.height * 0.350,
                    color: AppColor.aquaCasper2,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      markers: _marker,
                      initialCameraPosition: _kGoogle,
                      zoomControlsEnabled: true,
                      polygons: _polygon,
                      onMapCreated: (GoogleMapController controller) {
                        _mapController = controller;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          Container(
                            height: 50.0,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                color: AppColor.bgColor,
                                border:
                                Border.all(color: AppColor.borderColor2, width: 1),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: TextFormField(
                              controller: searchController,
                              onChanged: (v) {
                                searchKeyWord = v;
                                setState(() {

                                });
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.search),
                                  hintText: "Search Destination",
                                  hintStyle: TextStyle(
                                      fontSize: 15.0, color: AppColor.headingColor2)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child:
                            features.isEmpty
                                ? Center(
                              child: Text("Data not found."),
                            )
                                : ListView.builder(
                                itemCount: features.length,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  print("searchKeyWord....$searchKeyWord");
                                  if(searchKeyWord.isNotEmpty && !features[index].properties!['ADMIN'].toString().toLowerCase().contains(searchKeyWord.toLowerCase())){
                                    return SizedBox();
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Container(
                                      height: 55.0,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColor.borderColor2,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(10.0)),
                                      child: CheckboxListTile(
                                        contentPadding: EdgeInsets.zero,
                                        value: boolList[index],
                                        onChanged: (bool? value) {

                                          log('click');
                                          log('features = ${features[index].geometry}');

                                          print("va.......$value");
                                          if (value == null) {
                                            return;
                                          }

                                          if (value == true) {

                                            tempCountryList.add(features[index].properties!['ADMIN']);
                                            boolList[index] = true;
                                            if(features[index].geometry is GeoJsonPolygon){
                                              GeoJsonPolygon polygon =
                                                  features[index].geometry;
                                              List<LatLng> latlng = [];

                                              polygon.geoSeries
                                                  .forEach((element) {
                                                element.geoPoints.forEach((e) {
                                                  latlng.add(LatLng(
                                                      e.latitude, e.longitude));
                                                });
                                              });
                                              // _marker.add(Marker(markerId: MarkerId('$index'),position: latlng.first));
                                              _polygon.add(Polygon(
                                                // given polygonId
                                                polygonId: PolygonId('$index'),
                                                // initialize the list of points to display polygon
                                                points: latlng,
                                                // given color to polygon
                                                fillColor: Colors.green.withOpacity(0.3),
                                                // given border color to polygon
                                                strokeColor: Colors.green,
                                                geodesic: true,
                                                // given width of border
                                                strokeWidth: 4,
                                              ));
                                              _mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: latlng.first,zoom: 4)));

                                            }
                                            else{
                                              GeoJsonMultiPolygon polygon =
                                                  features[index].geometry;
                                              List<LatLng> latlng = [];

                                              polygon.polygons
                                                  .forEach((element) {
                                                element.geoSeries.forEach((e) {
                                                  e.geoPoints.forEach((e1) {
                                                    latlng.add(LatLng(
                                                        e1.latitude, e1.longitude));
                                                  });

                                                });
                                              });

                                              _mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: latlng.first,zoom: 4)));
                                              // _marker.add(Marker(markerId: MarkerId('$index'),position: latlng[0]));
                                              _polygon.add(Polygon(
                                                // given polygonId
                                                polygonId: PolygonId('$index'),
                                                // initialize the list of points to display polygon
                                                points: latlng,
                                                // given color to polygon
                                                fillColor: Colors.green.withOpacity(0.3),
                                                // given border color to polygon
                                                strokeColor: Colors.green,
                                                geodesic: true,
                                                // given width of border
                                                strokeWidth: 4,
                                              ));
                                              setState(() {});
                                            }
                                            setState(() {});

                                          }
                                          else {
                                            tempCountryList.remove(features[index].properties!['ADMIN']);
                                            boolList[index] = false;
                                            if(features[index].geometry is GeoJsonPolygon){
                                              List<LatLng> latlng = [];

                                              GeoJsonPolygon polygon =
                                                  features[index].geometry;
                                              polygon.geoSeries
                                                  .forEach((element) {
                                                element.geoPoints.forEach((e) {
                                                  latlng.add(LatLng(
                                                      e.latitude, e.longitude));
                                                });
                                              });

                                              //  _marker.remove(Marker(markerId: MarkerId('$index'),position: latlng[0]));


                                              _polygon.remove(Polygon(
                                                // given polygonId
                                                polygonId: PolygonId('$index'),
                                                // initialize the list of points to display polygon
                                                points: latlng,
                                                // given color to polygon
                                                fillColor: Colors.green.withOpacity(0.3),
                                                // given border color to polygon
                                                strokeColor: Colors.green,
                                                geodesic: true,
                                                // given width of border
                                                strokeWidth: 4,
                                              ));

                                            }
                                            else{
                                              List<LatLng> latlng = [];

                                              GeoJsonMultiPolygon polygon =
                                                  features[index].geometry;
                                              polygon.polygons
                                                  .forEach((element) {
                                                element.geoSeries.forEach((e) {
                                                  e.geoPoints.forEach((e1) {
                                                    latlng.add(LatLng(
                                                        e1.latitude, e1.longitude));
                                                  });


                                                });
                                              });
                                              //  _marker.remove(Marker(markerId: MarkerId('$index'),position: latlng[0]));

                                              _polygon.remove(Polygon(
                                                // given polygonId
                                                polygonId: PolygonId('$index'),
                                                // initialize the list of points to display polygon
                                                points: latlng,
                                                // given color to polygon
                                                fillColor: Colors.green.withOpacity(0.3),
                                                // given border color to polygon
                                                strokeColor: Colors.green,
                                                geodesic: true,
                                                // given width of border
                                                strokeWidth: 4,
                                              ));
                                            }
                                            setState(() {});
                                            return;
                                          }



                                        },
                                        title: Text(
                                          features[index]
                                              .properties!['ADMIN'] ??
                                              '',
                                          style: TextStyle(
                                              fontSize: 17.0,
                                              color:
                                              AppColor.colorLiteBlack5),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    )),
              ],
            ),


          ));
  }
}
