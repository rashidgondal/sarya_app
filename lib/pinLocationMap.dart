import 'package:flutter/material.dart';
// import 'package:latlong2/latlong.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
//import 'package:flutter_map/flutter_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PinLocationMap extends StatefulWidget {
  final List<LatLng> list_of_marker;
  final double height;
  final double width;
  final Function()? onTap;
  const PinLocationMap(
      {Key? key,
      required this.list_of_marker,
      required this.height,
      this.onTap,
      required this.width})
      : super(key: key);

  @override
  State<PinLocationMap> createState() => _PinLocationMapState();
}

class _PinLocationMapState extends State<PinLocationMap> {
  //LatLngBounds? latLngBounds;
  //List<MarkerLayer> markerList = [];
  String? mapStyle;
  var markers = <MarkerId, Marker>{};
  BitmapDescriptor? flagIcon;
  GoogleMapController? _controller;

  @override
  void initState() {
    loadassets();
    super.initState();
  }

  bool load_assets = false;
  loadassets() async {
    mapStyle =
        await rootBundle.loadString('lib/assets/json_data/map_style.txt');
    flagIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(20, 20),
      ),
      'lib/assets/svgs/flag_icon.png',
    );
    widget.list_of_marker.forEach((element) {
      final markerIdVal = 'marker_id_${element.latitude}_${element.longitude}';
      final markerId = MarkerId(markerIdVal);
      final marker = Marker(
        markerId: markerId,
        position: LatLng(element.latitude, element.longitude),
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
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(19.0760, 72.8777),
                  zoom: 11.5,
                ),
                onMapCreated: (controller) {
                  controller.setMapStyle(mapStyle);
                  if (markers.isNotEmpty) {
                    controller.animateCamera(
                        CameraUpdate.newLatLngBounds(_bounds(markers), 50.0));
                  }
                  onMapCreated(controller);
                },
                myLocationButtonEnabled: false,
                myLocationEnabled: false,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                markers: Set<Marker>.of(markers.values),
                onTap: (v) {
                  widget.onTap!.call();
                },
              ));
  }
}
