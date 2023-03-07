import 'package:flutter/material.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/navigation_service.dart';

import '../../pinLocationMap.dart';
import '../../theme/color_scheme.dart';

class ViewMarkerScreen extends StatefulWidget {
    final Map map;
  const ViewMarkerScreen({Key? key, required this.map}) : super(key: key);

  @override
  State<ViewMarkerScreen> createState() => _ViewMarkerScreenState();
}

class _ViewMarkerScreenState extends State<ViewMarkerScreen> {
  late NavigationService _navigationService;

  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(
        child: Scaffold(
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
              "Places",
              style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
            ),
            centerTitle: true,
          ),
          body: PinLocationMap(
            height: size.height,
            width: size.width,
            list_of_marker: widget.map['listOfMarker'],
          ),
        ),
      ),
    );
  }
}
