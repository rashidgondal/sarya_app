import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../customWidgets/drawer_screen.dart';
import '../../navigation/navigation_service.dart';

class ItineraryScreen extends StatefulWidget {
  const ItineraryScreen({Key? key}) : super(key: key);

  @override
  State<ItineraryScreen> createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  late NavigationService _navigationService;
  String? profilePath;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   Map? map;

  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();
    getProfilePicture();
    getUserInfo();
  }

  getProfilePicture() async {
    SharedPrefs pref = SharedPrefs();

    profilePath = await pref.getProfilePath();
    setState(() {});
  }

  getUserInfo() async {
    print("..........");
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
    getUserInfo();
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.whiteColor,
      drawer: DrawerScreen(
        profilePath: profilePath,
        map: map == null? {}: map!,
      ),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        leading: IconButton(
            icon: profilePath == null
                ? SvgPicture.asset('user'.svg, height: 16.0, width: 16.0,)
                : SvgPicture.network(profilePath!, height: 16.0, width: 16.0,),
            onPressed: () => _scaffoldKey.currentState!.openDrawer()),
        backgroundColor: AppColor.aquaCasper2,
        title: const Text(
          "Itinerary",
          style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset('home_appbar_icon_1'.svg),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset('home_appbar_icon_2'.svg),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  "Created Itineraries",
                  style: TextStyle(
                      fontSize: 17.0, color: AppColor.colorLiteBlack5),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 115,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return InkWell(
                          onTap: () {
                            _navigationService.navigateTo(summaryRoutStart);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 15.0, left: 30),
                            child: Container(
                              height: 111.0,
                              width: 101.0,
                              decoration: BoxDecoration(
                                  color: AppColor.aquaCasper2,
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                        );
                      }

                      return InkWell(
                        onTap: () {
                          _navigationService.navigateTo(summaryRoutStart);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                            height: 111.0,
                            width: 101.0,
                            decoration: BoxDecoration(
                                color: AppColor.aquaCasper2,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  "Purchase Itineraries",
                  style: TextStyle(
                      fontSize: 17.0, color: AppColor.colorLiteBlack5),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          _navigationService.navigateTo(summaryRoutStart);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 30.0, left: 30, top: 10),
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
                                      const Text(
                                        "Alina Fahim",
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
                                        children: const [
                                          Icon(
                                            Icons.question_mark,
                                            size: 10.0,
                                          ),
                                          Text(
                                            " United Arab Emirate",
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.w500,
                                                color: AppColor.subtitleColor),
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        "3 months Ago, 5 days Package",
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
                                            " (5)",
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
                                  const Icon(
                                    Icons.navigate_next_sharp,
                                    size: 30.0,
                                    color: AppColor.lightIndigo,
                                  )
                                ],
                              )),
                        ),
                      );
                    }),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: InkWell(
                onTap: () {
                  _navigationService.navigateTo(destinationRout);
                },
                child: Container(
                  height: 46.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      color: AppColor.buttonColor.withOpacity(1),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Center(
                    child: Text(
                      "Create New Itinerary",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: AppColor.whiteColor),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
