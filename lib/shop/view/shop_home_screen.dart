import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geojson/geojson.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/shop/shop_view_model/public_cubits.dart';
import 'package:sarya/shop/shop_view_model/public_states.dart';
import 'package:sarya/theme/color_scheme.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../customWidgets/drawer_screen.dart';
import '../../../navigation/navigation_service.dart';
import '../../core/network/routes/api_routes.dart';
import '../model/public_itinerary_response.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late NavigationService _navigationService;
  String? profilePath;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Map? map;
  late List<GeoJsonFeature> features;
  var boolList = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    getUserInfo();
    super.initState();
    _navigationService = locator<NavigationService>();
    context.read<PublicItineraryCubits>().getPublicItinerary();
  }

  getUserInfo() async {
    SharedPrefs pref = SharedPrefs();
    map = await pref.getUser();
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        getUserInfo();
        context.read<PublicItineraryCubits>().getPublicItinerary();
      },
      child: SafeArea(
          child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColor.whiteColor,
        drawer: DrawerScreen(),
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 60,
          leading: IconButton(
              icon: map == null
                  ? SvgPicture.asset(
                      'user'.svg,
                      height: 26.0,
                      width: 26.0,
                    )
                  : SvgPicture.network(
                      map!['avatar'],
                      height: 26.0,
                      width: 26.0,
                    ),
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              }),
          backgroundColor: AppColor.aquaCasper2,
          title: const Text(
            "Shop",
            style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Please tell us where you\nwant to Travel",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: AppColor.colorBlack,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Let's find a suitable package for you",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: AppColor.colorLiteBlack2,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    _navigationService.navigateTo(searchItineraryRoute);
                  },
                  child: Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: AppColor.bgColor,
                          borderRadius: BorderRadius.circular(24)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Search for Location",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: AppColor.colorLiteBlack2,
                                  fontWeight: FontWeight.w400),
                            ),
                            SvgPicture.asset(
                              "search_icon".svg,
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 15),
              //   child: Text(
              //     "Recommended",
              //     style: TextStyle(
              //         fontSize: 20.0,
              //         color: AppColor.colorBlack,
              //         fontWeight: FontWeight.w700),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   child:
              //       BlocBuilder<PublicItineraryCubits, PublicItineraryStates>(
              //           builder: (context, state) {
              //     List<PublicResult> list = [];
              //     if (state is PublicItineraryInitial) {
              //       return Center(
              //         child: SizedBox(),
              //       );
              //     }
              //
              //     if (state is PublicItineraryLoading) {
              //       return Center(
              //         child: CupertinoActivityIndicator(),
              //       );
              //     }
              //
              //     if (state is PublicItineraryLoaded) {
              //       PublicItineraryResponse response =
              //           state.publicItineraryResponse;
              //       list = response.result ?? [];
              //     }
              //     if (list.isEmpty) {
              //       return Center(
              //         child: Text(
              //           "Data not found",
              //           style: TextStyle(
              //               fontSize: 14.0,
              //               color: AppColor.colorLiteBlack2,
              //               fontWeight: FontWeight.w500),
              //         ),
              //       );
              //     }
              //     return CarouselSlider.builder(
              //       itemCount: list.length,
              //       itemBuilder: (BuildContext context, int itemIndex,
              //               int pageViewIndex) =>
              //           InkWell(
              //         onTap: () {
              //           _navigationService.navigateTo(summaryRoutStart,
              //               arguments: {"id": list[itemIndex].sId});
              //         },
              //         child: Container(
              //           decoration: BoxDecoration(
              //               color: AppColor.aquaCasper2,
              //               image: DecorationImage(
              //                   image: NetworkImage(
              //                       "${ApiRoutes.picBaseURL}${list[itemIndex].profileImg}"),
              //                   fit: BoxFit.fill),
              //               borderRadius: BorderRadius.circular(16.0),
              //               boxShadow: [
              //                 BoxShadow(
              //                     offset: const Offset(2, 2),
              //                     color: Colors.grey.withOpacity(0.6),
              //                     blurRadius: 3),
              //                 BoxShadow(
              //                     offset: const Offset(-3, -3),
              //                     color: Colors.grey.withOpacity(0.1),
              //                     blurRadius: 3)
              //               ]),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             children: [
              //               Row(
              //                 children: [
              //                   Icon(
              //                     Icons.location_on,
              //                     color: AppColor.whiteColor,
              //                   ),
              //                   SizedBox(
              //                     width: 120,
              //                     child: Text(
              //                       "${list[itemIndex].title}",
              //                       style: TextStyle(
              //                           fontSize: 14.0,
              //                           color: AppColor.whiteColor,
              //                           fontWeight: FontWeight.w500),
              //                     ),
              //                   )
              //                 ],
              //               ),
              //               SizedBox(
              //                 height: 10,
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       options: CarouselOptions(
              //           viewportFraction: 0.48,
              //           aspectRatio: 2 / 1,
              //           enableInfiniteScroll: true,
              //           enlargeFactor: 0.5,
              //           autoPlay: true),
              //     );
              //   }),
              // ),
              // const SizedBox(
              //   height: 20.0,
              // ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Top Rated",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: AppColor.colorBlack,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              BlocBuilder<PublicItineraryCubits, PublicItineraryStates>(
                  builder: (context, state) {
                List<PublicResult> list = [];
                if (state is PublicItineraryInitial) {
                  return Center(
                    child: SizedBox(),
                  );
                }

                if (state is PublicItineraryLoading) {
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                }

                if (state is PublicItineraryLoaded) {
                  PublicItineraryResponse response =
                      state.publicItineraryResponse;
                  list = response.result ?? [];
                }
                if (list.isEmpty) {
                  return Center(
                    child: Text(
                      "Data not found",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: AppColor.colorLiteBlack2,
                          fontWeight: FontWeight.w500),
                    ),
                  );
                }
                return ListView.builder(
                    itemCount: list.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          _navigationService.navigateTo(summaryRoutPurchase,
                              arguments: {"id": list[index].sId});
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 15.0, left: 15, top: 10),
                          child: Container(
                              height: 86.0,
                              width: 101.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      width: 1, color: AppColor.borderColor)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 72.0,
                                    width: 72.0,
                                    child: CachedNetworkImage(
                                      imageUrl: "${ApiRoutes.picBaseURL}${list[index].profileImg}",
                                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                                          CircularProgressIndicator(value: downloadProgress.progress),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),

                                    decoration: BoxDecoration(
                                        color: AppColor.aquaCasper2,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${list[index].title}",
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.headingColor),
                                      ),
                                      const SizedBox(
                                        height: 3.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.question_mark,
                                            size: 10.0,
                                          ),
                                          Text(
                                            "${list[index].destination.toString().replaceAll('[', '').replaceAll(']', '').trim()}",
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.w500,
                                                color: AppColor.subtitleColor),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "${timeago.format(DateTime.parse('${list[index].createdAt}'))} , ${list[index].totalDays} day package",
                                        style: TextStyle(
                                            fontSize: 11.0,
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.headingColor2),
                                      ),
                                      const SizedBox(
                                        height: 3.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Icon(
                                            Icons.star,
                                            color: AppColor.borderColor,
                                            size: 15.0,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: AppColor.borderColor,
                                            size: 15.0,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: AppColor.borderColor,
                                            size: 15.0,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: AppColor.borderColor,
                                            size: 15.0,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: AppColor.borderColor,
                                            size: 15.0,
                                          ),
                                          Text(
                                            "(5)",
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.w500,
                                                color: AppColor.headingColor2),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: AppColor.aquaCasper2,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      "\$${list[index].cost}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                          color: AppColor.lightIndigo),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  )
                                ],
                              )),
                        ),
                      );
                    });
              }),
            ],
          ),
        ),
      )),
    );
  }
}
