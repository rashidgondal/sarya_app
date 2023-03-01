import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PinLocationMap extends StatefulWidget {
  final List<LatLng> list_of_marker;
  final double height;
  final double width;
  const PinLocationMap(
      {Key? key,
      required this.list_of_marker,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  State<PinLocationMap> createState() => _PinLocationMapState();
}

class _PinLocationMapState extends State<PinLocationMap> {
  LatLngBounds? latLngBounds;
  List<MarkerLayer> markerList = [];
  @override
  void initState() {
    latLngBounds = LatLngBounds();
    widget.list_of_marker.forEach((element) {
      latLngBounds!.extend(element);
      markerList.add(
        MarkerLayer(
          markers: [
            Marker(
              point: element,
              width: 80,
              height: 80,
              builder: (context) => FlutterLogo(),
            ),
          ],
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: FlutterMap(
        options: MapOptions(
            bounds: latLngBounds,
            zoom: 10.2,
            boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(100))),
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: null,
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          ...markerList
        ],
      ),
    );
  }
}
