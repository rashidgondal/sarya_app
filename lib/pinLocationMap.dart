  import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

  class PinLocationMap extends StatefulWidget {
  final List<FlagInformation> list_of_flag_information;
  final double height;
  final double width;
  final Function()? onTap;
  final Function(FlagInformation)? selected_place_information;
  const PinLocationMap(
      {Key? key,
      required this.height,
      this.onTap,
      required this.width,
      required this.list_of_flag_information,
      required this.selected_place_information})
      : super(key: key);

  @override
  State<PinLocationMap> createState() => _PinLocationMapState();
}

  class _PinLocationMapState extends State<PinLocationMap> {
  String? mapStyle;
  var markers = <MarkerId, Marker>{};
  BitmapDescriptor? flagIcon;
  GoogleMapController? _controller;

  @override
  void initState() {
    loadassets();
    super.initState();
  }

  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();

  bool load_assets = false;
  loadassets() async {
    mapStyle =
        await rootBundle.loadString('lib/assets/json_data/map_style.txt');
    flagIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(80, 80),
      ),
      'lib/assets/svgs/flag_icon.png',
    );
    widget.list_of_flag_information.forEach((element) {
      int index = widget.list_of_flag_information.indexOf(element);
      final markerIdVal =
          'marker_id_${element.latLng.latitude}_${element.latLng.longitude}';
      final markerId = MarkerId(markerIdVal);
      final marker = Marker(
        markerId: markerId,
        position: LatLng(element.latLng.latitude, element.latLng.longitude),
        onTap: () {
          widget.selected_place_information!.call(element);
          customInfoWindowController.addInfoWindow!(
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.list_of_flag_information[index].title}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                          Expanded(
                            child: Text(
                              "${widget.list_of_flag_information[index].subTitle}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              Position position = await requestLocation();
                              String url =
                                  'https://www.google.com/maps/dir/?api=1&origin=${position.latitude},${position.longitude}&destination=${element.latLng.latitude},${element.latLng.longitude}&travelmode=driving&dir_action=navigate';
                              launchURL(url);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Text(
                                "View in Google Map",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ],
            ),
            LatLng(element.latLng.latitude, element.latLng.longitude),
          );
        },
        icon: flagIcon!,
      );
      final iceGiants = {markerId: marker};
      markers.addEntries(iceGiants.entries);
    });
    load_assets = true;
    setState(() {});
  }

  LatLngBounds _bounds(Map<MarkerId, Marker> markers) {
    final positions = markers.entries
        .map(
          (marker) => LatLng(
              marker.value.position.latitude, marker.value.position.longitude),
        )
        .toList();
    return _createBounds(positions);
  }

  LatLngBounds _createBounds(List<LatLng> positions) {
    final southwestLat = positions.map((p) => p.latitude).reduce(
        (value, element) => value < element ? value : element); // smallest
    final southwestLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value < element ? value : element);
    final northeastLat = positions.map((p) => p.latitude).reduce(
        (value, element) => value > element ? value : element); // biggest
    final northeastLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value > element ? value : element);
    return LatLngBounds(
        southwest: LatLng(southwestLat, southwestLon),
        northeast: LatLng(northeastLat, northeastLon));
  }

  void onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    final position = await requestLocation();
    if (markers.isEmpty) {
      _gotoPosition(position);
    }
  }

  void _gotoPosition(Position position) async {
    await _controller!
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 11.5,
    )));
  }

  Future<Position> requestLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: widget.width,
        child: load_assets == false
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(19.0760, 72.8777),
                      zoom: 11.5,
                    ),
                    onMapCreated: (controller) {
                      controller.setMapStyle(mapStyle);
                      customInfoWindowController.googleMapController =
                          controller;
                      if (markers.isNotEmpty) {
                        controller.animateCamera(CameraUpdate.newLatLngBounds(
                            _bounds(markers), 50.0));
                      }
                      onMapCreated(controller);
                    },
                    onCameraMove: (position) {
                      customInfoWindowController.onCameraMove!();
                    },
                    myLocationButtonEnabled: false,
                    myLocationEnabled: false,
                    zoomControlsEnabled: true,
                    zoomGesturesEnabled: true,
                    markers: Set<Marker>.of(markers.values),
                    onTap: (v) {
                      customInfoWindowController.hideInfoWindow!();
                      if (widget.onTap != null) {
                        widget.onTap!.call();
                      }
                    },
                  ),
                  CustomInfoWindow(
                    controller: customInfoWindowController,
                    height: 75,
                    width: 150,
                    offset: 50,
                  ),
                ],
              ));
  }
}

  launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  class FlagInformation {
  String title;
  String subTitle;
  LatLng latLng;
  List<String> list_of_images;
  FlagInformation(
      {required this.title,
      required this.subTitle,
      required this.latLng,
      required this.list_of_images});
}
