import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
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

  FlagInformation? place_information;
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
          body: Stack(
            children: [
              PinLocationMap(
                height: size.height,
                width: size.width,
                list_of_flag_information: widget.map['listOfMarker'],
                selected_place_information: (FlagInformation v) {
                  if (place_information == null) {
                    place_information = v;
                    setState(() {});
                  } else {
                    place_information = null;
                    setState(() {});
                    Future.delayed(Duration(milliseconds: 500), () {
                      place_information = v;
                      setState(() {});
                    });
                  }
                },
              ),
              place_information == null
                  ? SizedBox()
                  : Positioned(
                      child: Container(
                        height: 70,
                        width: size.width,
                        child: ListView.builder(
                            itemBuilder: (c, i) {
                              return FadeInRight(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "${place_information!.list_of_images[i]}",
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                      decoration:
                                          BoxDecoration(color: Colors.blue),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: place_information!.list_of_images.length,
                            scrollDirection: Axis.horizontal),
                      ),
                      bottom: 20,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
