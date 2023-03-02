import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SaryaMap extends StatefulWidget {
  const SaryaMap({
    Key? key,
    this.zoomLevel = 11.5,
    this.defaultPosition = const LatLng(19.0760, 72.8777),
    this.myLocationButtonEnabled = false,
    this.markers = const <MarkerId, Marker>{},
    this.showAllMarkers = false,
    this.onMapCreated,
    this.onCameraMove,
    this.onMapTap,
    this.myLocationEnabled = true,
  }) : super(key: key);

  final double zoomLevel;
  final LatLng defaultPosition;
  final bool myLocationButtonEnabled;
  final Map<MarkerId, Marker> markers;
  final ValueChanged<GoogleMapController>? onMapCreated;
  final bool showAllMarkers;
  final ValueChanged<CameraPosition>? onCameraMove;
  final ValueChanged<LatLng>? onMapTap;
  final bool myLocationEnabled;

  @override
  _SaryaMapState createState() => _SaryaMapState();
}

class _SaryaMapState extends State<SaryaMap> {
  GoogleMapController? _controller;
  late String _mapStyle;

  @override
  void initState() {
    rootBundle.loadString('lib/assets/json_data/map_style.txt').then((string) {
      _mapStyle = string;
    });
    super.initState();
  }

  void onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    if (widget.onMapCreated != null) {
      widget.onMapCreated!(controller);
    }
    final position = await requestLocation();
    if (!widget.showAllMarkers || widget.markers.isEmpty) {
      _gotoPosition(position);
    }
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

  void _gotoPosition(Position position) async {
    await _controller!
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: widget.zoomLevel,
    )));
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

  LatLngBounds _bounds(Map<MarkerId, Marker> markers) {
    final positions = markers.entries
        .map(
          (marker) => LatLng(
              marker.value.position.latitude, marker.value.position.longitude),
        )
        .toList();
    return _createBounds(positions);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: widget.defaultPosition,
        zoom: widget.zoomLevel,
      ),
      onMapCreated: (controller) {
        controller.setMapStyle(_mapStyle);
        if (widget.showAllMarkers && widget.markers.isNotEmpty) {
          controller.animateCamera(
              CameraUpdate.newLatLngBounds(_bounds(widget.markers), 50.0));
        }
        onMapCreated(controller);
      },
      myLocationButtonEnabled: widget.myLocationEnabled,
      myLocationEnabled: widget.myLocationEnabled,
      markers: Set<Marker>.of(widget.markers.values),
      onCameraMove: widget.onCameraMove,
      onTap: widget.onMapTap,
    );
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }
}
