import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/home/home_view_model/stop_itinerary_cubits.dart';
import 'package:sarya/home/model/stop_request.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/navigation_service.dart';

import '../../core/network/routes/api_routes.dart';
import '../../navigation/router_path.dart';
import '../../pinLocationMap.dart';
import '../../theme/color_scheme.dart';

class ViewMarkerScreen extends StatefulWidget {
  final Map map;
  const ViewMarkerScreen({Key? key, required this.map}) : super(key: key);

  @override
  State<ViewMarkerScreen> createState() => _ViewMarkerScreenState();
}

class _ViewMarkerScreenState extends State<ViewMarkerScreen> with TickerProviderStateMixin {
  late NavigationService _navigationService;
  late TabController _tabControllerMain;
  List<List<FlagInformation>> list = [];

  @override
  void initState() {
    int day = widget.map['step'] ;
    print("day..........$day");
    list = widget.map['listOfMarker'];
    print("widget.map['listOfMarker'].....${widget.map['listOfMarker'].length}");
    _tabControllerMain = TabController(length: widget.map['totalDays'], vsync: this, initialIndex: day);

    super.initState();
    _navigationService = locator<NavigationService>();
  }
  List<Widget> listOfTab = [];

  FlagInformation? place_information;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 0,
            automaticallyImplyLeading: false,
            backgroundColor: AppColor.aquaCasper2,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Container(
                child: Row(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: IconButton(
                        onPressed: (){
                          int day = _tabControllerMain.index ;

                          StopRequest stopRequest = StopRequest(itinerary:
                                StopItinerary(
                                    sId: widget.map['id'], active: true,
                                    day: day));

                          context.read<StopItineraryStateCubits>().getStopItinerary(stopRequest: stopRequest, service: _navigationService, buttonName: 'back');
                        },
                        icon: Icon(Icons.arrow_back_ios,size: 30,),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: TabBar(
                          controller: _tabControllerMain,
                          indicatorColor: Colors.transparent,
                          labelColor: AppColor.whiteColor,
                          unselectedLabelColor:
                          AppColor.headingColor,
                          padding: EdgeInsets.zero,
                            isScrollable: true,
                            labelStyle: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700),
                          indicator: BoxDecoration(
                              color: AppColor.lightIndigo,
                              boxShadow: [
                            BoxShadow(
                                offset: Offset(-1, -1),
                                color: Colors.grey.withOpacity(0.4),
                                blurRadius: 2),
                            BoxShadow(
                                offset: Offset(2, 2),
                                color: Colors.white.withOpacity(0.8),
                                blurRadius: 2)
                          ], borderRadius: BorderRadius.circular(20)),
                          onTap: (i) {
                            print("i...........$i");
                          },
                          tabs: list.map<Widget>((e){
                            int day = list.indexOf(e);
                            return Container(
                              height: 30,
                              width: 50,
                              child: Center(
                                  child: Text(
                                    "Day ${day+1}",
                                  )),
                            );
                          }).toList()

                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap: (){
                        int day = _tabControllerMain.index +1;

                        _navigationService.navigateTo(tripCompletedRoute,arguments: {"id":widget.map['id'], "day":"$day"});
                      },
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                          color: AppColor.stopColor,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text("Stop", style: TextStyle(color: AppColor.whiteColor,fontSize: 14),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            centerTitle: true,
          ),
          body:  TabBarView(
            controller: _tabControllerMain,
            children: list.map<Widget>((e){
              return  Stack(
                children: [
                  PinLocationMap(
                    height: size.height,
                    width: size.width,
                    list_of_flag_information: e,
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
                                  child: InkWell(
                                    onTap: (){

                                      var image = "${ApiRoutes.picBaseURL}${place_information!.list_of_images[i]}";


                                      _navigationService.navigateTo(
                                          storyViewRoute,
                                          arguments: [image]);
                                    },
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                        "${ApiRoutes.picBaseURL}${place_information!.list_of_images[i]}",
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
                              ),
                            );
                          },
                          itemCount: place_information!.list_of_images.length,
                          scrollDirection: Axis.horizontal),
                    ),
                    bottom: 20,
                  )
                ],
              );
            }).toList()



          ),
        ),
      ),
    );
  }
}