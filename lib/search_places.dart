import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/theme/color_scheme.dart';
import 'package:geolocator/geolocator.dart';
import 'create_intinerary/model/day_design_intinerary_request.dart'
    as create_intinerary;
import 'create_intinerary/model/day_design_intinerary_request.dart';

class SearchPlacesScreen extends StatefulWidget {
  final Map map;

  const SearchPlacesScreen({Key? key, required this.map}) : super(key: key);

  @override
  State<SearchPlacesScreen> createState() => _SearchPlacesScreenState();
}

const kGoogleApiKey = 'AIzaSyDSVdO9CElCUNqNhzFEwHw_QQF4TP6Pvds';
final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _SearchPlacesScreenState extends State<SearchPlacesScreen> {
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(37.42796, -122.08574), zoom: 4.0);
  Set<Marker> markersList = {};
  late GoogleMapController googleMapController;
  final Mode _mode = Mode.overlay;
  PlacesDetailsResponse? detail;
  String name = 'Search Places';
  List list = [];
  List<create_intinerary.Accomodation> listOfAccommodation = [];

  // create_intinerary.Accomodation     accomodation   = create_intinerary.Accomodation();
  late NavigationService _navigationService;
  TextEditingController tripEstimatedCostController = TextEditingController();

  Map map = {};

  @override
  void initState() {
    perSelected();
   // currentLocation();
    super.initState();
    _navigationService = locator<NavigationService>();
  }

  perSelected() async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "lib/assets/images/flag.png",
    );

    print("widget.map['preSelected'].......${widget.map['preSelected'].length}");
    listOfAccommodation = widget.map['preSelected'];
    for (int i = 0; i < listOfAccommodation.length; i++) {
      markersList.add(Marker(
          icon: markerbitmap,
          markerId: MarkerId("$i"),
          position: LatLng(listOfAccommodation[i].location!.coordinates![1],
              listOfAccommodation[i].location!.coordinates![0]),
          infoWindow: InfoWindow(title: listOfAccommodation[i].name),
          onTap: () {
          }));
    }
      setState(() {

    });
  }

  currentLocation() async {
    Position position = await _determinePosition();
    googleMapController.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(position.latitude, position.longitude), 14.0));

    setState(() {});
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(
        child: Scaffold(
          key: homeScaffoldKey,
          backgroundColor: AppColor.whiteColor,
          appBar: AppBar(
            backgroundColor: AppColor.aquaCasper2,
            elevation: 0,
            title: const Text(
              "Location",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColor.colorBlack,
                  fontSize: 16.0),
            ),
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
          ),
          body: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: initialCameraPosition,
                markers: markersList,
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {
                  googleMapController = controller;
                },
                onTap: (latlng) {
                  getLocationAddress(latLng: latlng);
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: InkWell(
                  onTap: _handlePressButton,
                  child: Container(
                      height: 45,
                      width: size.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: AppColor.lightIndigo, width: 2),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.6),
                                blurRadius: 2),
                            BoxShadow(
                                offset: Offset(-1, -1),
                                color: Colors.white.withOpacity(0.8),
                                blurRadius: 2)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("search_icon".svg),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            name,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColor.lightIndigo,
                                fontSize: 16.0),
                          ),
                        ],
                      )),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 50),
                  child: InkWell(
                    onTap: () {
                      if (widget.map['from'] == 'day') {
                        print(
                            "listOfAccommodation........${listOfAccommodation.length}");
                        _navigationService.goBack(value: listOfAccommodation);
                      } else {
                        _navigationService.goBack(value: map);
                      }
                    },
                    child: Container(
                        height: 45,
                        width: size.width / 2,
                        decoration: BoxDecoration(
                            color: AppColor.lightIndigo,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: AppColor.lightIndigo, width: 2),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.6),
                                  blurRadius: 2),
                              BoxShadow(
                                  offset: Offset(-1, -1),
                                  color: Colors.white.withOpacity(0.8),
                                  blurRadius: 2)
                            ]),
                        child: Center(
                          child: Text(
                            "Add",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColor.whiteColor,
                                fontSize: 16.0),
                          ),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getLocationAddress({required LatLng latLng}) async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "lib/assets/images/flag.png",
    );
    //await Future.delayed(Duration(seconds: 2));
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    print("placemarks...........${placemarks[0].name}");
    print("placemarks...........${placemarks[0].street}");
    name = '${placemarks[0].name ?? ''}  ${placemarks[0].street ?? ''}';

    if (widget.map['from'] == 'day') {
      print("if...........");
      int c = 0;
      int id = c + 1;
      markersList.add(Marker(
          icon: markerbitmap,
          markerId: MarkerId("$id"),
          position: LatLng(latLng.latitude, latLng.longitude),
          infoWindow: InfoWindow(title: name),
          ));
      googleMapController.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(latLng.latitude, latLng.longitude), 14.0));
      listOfAccommodation.add(create_intinerary.Accomodation(
          name: name,
          location: create_intinerary.Location(
              coordinates: [latLng.longitude, latLng.latitude])));
    } else {
      print("else...........");

      map = {
        "name": "$name",
        "coordinate": [
          latLng.longitude,
          latLng.latitude,
        ]
      };

      markersList.clear();
      markersList.add(Marker(
          icon: markerbitmap,
          markerId: MarkerId("0"),
          position: LatLng(latLng.latitude, latLng.longitude),
          infoWindow: InfoWindow(title: name),
          onTap: () {
            print("......press");
            Marker marker = markersList.iterator.current;
          }));
      googleMapController.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(latLng.latitude, latLng.longitude), 14.0));
    }

    setState(() {});
  }

  Future<void> _handlePressButton() async {
    String typeData = widget.map['type'];
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        onError: onError,
        mode: _mode,
        language: 'en',
        strictbounds: false,
        types: [typeData],
        decoration: InputDecoration(
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white))),
        components: [
          Component(Component.country, "pk"),
          Component(Component.country, "usa")
        ]);

    displayPrediction(p!, homeScaffoldKey.currentState);
  }

  void onError(PlacesAutocompleteResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Message',
        message: response.errorMessage!,
        contentType: ContentType.failure,
      ),
    ));

    // homeScaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(response.errorMessage!)));
  }

  Future<void> displayPrediction(Prediction p, ScaffoldState? currentState) async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "lib/assets/images/flag.png",
    );
    GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders());

    detail = await places.getDetailsByPlaceId(p.placeId!);
    print("geometry..................${detail!.result.geometry}");
    print(
        "geometry type..................${detail!.result.geometry!.location}");
    print("geometry type..................${detail!.result.geometry!.bounds}");
    print("result type..................${detail!.result.types}");

    final lat = detail!.result.geometry!.location.lat;
    final lng = detail!.result.geometry!.location.lng;
    name = detail!.result.name;
    if (widget.map['from'] == 'day') {
      markersList.clear();
      markersList.add(Marker(
          icon: markerbitmap,
          markerId: const MarkerId("0"),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(title: name)));
      listOfAccommodation.add(create_intinerary.Accomodation(
          name: name,
          location: create_intinerary.Location(coordinates: [lng, lat])));
      print("listOfAccommodation........${listOfAccommodation.length}");
    } else {
      map = {
        "name": "$name",
        "coordinate": [
          lng,
          lat,
        ]
      };

      markersList.clear();
      markersList.add(Marker(
          icon: markerbitmap,
          markerId: const MarkerId("0"),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(title: name)));
    }
    setState(() {});

    googleMapController
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
  }

}
