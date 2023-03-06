import 'package:flutter/material.dart';

import '../../pinLocationMap.dart';

class ViewMarkerScreen extends StatefulWidget {
    final Map map;
  const ViewMarkerScreen({Key? key, required this.map}) : super(key: key);

  @override
  State<ViewMarkerScreen> createState() => _ViewMarkerScreenState();
}

class _ViewMarkerScreenState extends State<ViewMarkerScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PinLocationMap(
      height: size.height,
      width: size.width,
      list_of_marker: [],
    );
  }
}
