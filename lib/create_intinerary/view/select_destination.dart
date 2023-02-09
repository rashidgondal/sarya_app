import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:geojson/geojson.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../helper/shared_prefs.dart';
import '../../locator.dart';
import '../../navigation/navigation_service.dart';

class SelectDestination extends StatefulWidget {
  const SelectDestination({Key? key}) : super(key: key);

  @override
  State<SelectDestination> createState() => _SelectDestinationState();
}

class _SelectDestinationState extends State<SelectDestination> {
  late NavigationService _navigationService;
  var list = [];
  var boolList = [];
  var tempCountryList = [];
  late GoogleMapController c;
  TextEditingController searchController = TextEditingController();
  String searchKeyWord = '';

  // on below line we have set the camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(19.0759837, 72.8776559),
    zoom: 4,
  );

  Set<Polygon> _polygon = HashSet<Polygon>();
  List<GeoJsonFeature> features = [];

  bool loading =  true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    parseAndDrawAssetsOnMap();
    _navigationService = locator<NavigationService>();
    //getUserInfo();
  }

  addPolygon({required String polygonCountry, required List<LatLng> points}) {
    _polygon.add(Polygon(
      // given polygonId
      polygonId: PolygonId(polygonCountry),
      // initialize the list of points to display polygon
      points: points,
      // given color to polygon
      fillColor: Colors.green.withOpacity(0.3),
      // given border color to polygon
      strokeColor: Colors.green,
      geodesic: true,
      // given width of border
      strokeWidth: 4,
    ));
  }

  void addPoints() {
    /*   for( var i=0 ; i < GeoJson.AF.length ; i++ )
    {
      var ltlng= LatLng( GeoJson.AF[ i ][ 1 ], GeoJson.AF[ i ][ 0 ] );
      point.add( ltlng );
    }
*/
    setState(() {});
  }

/*  getUserInfo() async {
    SharedPrefs pref = SharedPrefs();
    list = await pref.getCountries();
    boolList = List.filled(list.length, false);
    print(
        "tempList..1...........${boolList}......length....${boolList.length}");

    setState(() {});
  }*/

  Future<void> parseAndDrawAssetsOnMap() async {
    final geo = GeoJson();

    final data =
        await rootBundle.loadString('lib/assets/json_data/countries.geojson');
    await geo.parse(data, verbose: true);

    features = geo.features;
    print("features ....${features.length}");
    boolList = List.filled(features.length, false);
    setState(() {
      loading = false;
    });
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
            onTap: () {},
            child: Container(
              height: 46.0,
              width: 200.0,
              decoration: BoxDecoration(
                  color: AppColor.buttonColor,
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
                initialCameraPosition: _kGoogle,
                zoomControlsEnabled: true,
                polygons: _polygon,
                onMapCreated: (GoogleMapController controller) {
                  c = controller;
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
                  child:/* searchKeyWord.isEmpty
                      ? ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
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
                                          print("va.......$value");
                                          if (value == null) {
                                            return;
                                          }

                                          if (value == true) {
                                            boolList[index] = true;
                                            tempCountryList.add(list[index]);
                                          } else {
                                            boolList[index] = false;
                                            tempCountryList.removeAt(index);
                                          }

                                          setState(() {});
                                        },
                                        title: Text(
                                          list[index]['name'] ?? '',
                                          style: TextStyle(
                                              fontSize: 17.0,
                                              color: AppColor.colorLiteBlack5),
                                        ))));
                          })
                      : */
                  loading?Center(child: CupertinoActivityIndicator(),):
                  features.isEmpty?
                  Center(child: Text("Data not found."),)

                      :ListView.builder(
                          itemCount: features.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Container(
                                height: 55.0,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.borderColor2, width: 1),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: CheckboxListTile(
                                  contentPadding: EdgeInsets.zero,
                                  value: boolList[index],
                                  onChanged: (bool? value) {
                                    List<LatLng> pointAll = [];

                                    print("va.......$value");
                                    if (value == null) {
                                      return;
                                    }

                                    if (value == true) {
                                      boolList[index] = true;
                                      var a = features[index].geometry;


                                      /*a.forEach((element) {
                                        print("ele..............$element");
                                      });*/
                                      //pointAll.addAll(a);
                                    } else {
                                      boolList[index] = false;
                                      pointAll.removeAt(index);
                                    }

                                    addPolygon(points: pointAll, polygonCountry: '$index', );
                                  },
                                  title: Text(
                                    features[index].properties!['ADMIN'] ?? '',
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        color: AppColor.colorLiteBlack5),
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
