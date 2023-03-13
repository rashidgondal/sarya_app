import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:places_api/places_api.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/activity_cubits.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/activity_states.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/day_update_intinerary_cubits.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/transport_cubits.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/transport_states.dart';
import 'package:sarya/customWidgets/dialoge_activities_excursion.dart';
import 'package:sarya/customWidgets/text_decorated_icon.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/helper/helper_methods.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../customWidgets/dialoge_airport_cost.dart';
import '../../customWidgets/dialoge_type_of_transport.dart';
import '../../locator.dart';
import '../../search_places/SearchPlacesMap.dart';
import '../model/day_design_intinerary_request.dart' as create_intenerary;

class DayDesignIntineraryScreen extends StatefulWidget {
  final Map map;

  const DayDesignIntineraryScreen({Key? key, required this.map})
      : super(key: key);

  @override
  State<DayDesignIntineraryScreen> createState() =>
      _DayDesignIntineraryScreenState();
}

class _DayDesignIntineraryScreenState extends State<DayDesignIntineraryScreen> {
  TextEditingController textEditingController = TextEditingController();
  late NavigationService _navigationService;
  List<create_intenerary.Days> list_of_days = [];
  List<create_intenerary.Accomodation> list_of_accommodation = [];
  var countryList = [];
  List<Place> listOfSelectedPlaces = [];
  create_intenerary.Accomodation accomodation = create_intenerary.Accomodation();

  @override
  void initState() {
    int dayLength = widget.map['totalDays'];
    countryList = widget.map['country'];
    list_of_days[selected_index].country = countryList[selected_flag];

    for (var i = 0; i < dayLength; i++) {
      list_of_days.add(create_intenerary.Days(
        airport: '',
        country: '',
        coffeeClubsLounges: create_intenerary.Breakfast(),
        activities: [],
        accomodation: [],
        breakfast: create_intenerary.Breakfast(),
        lunch: create_intenerary.Breakfast(),
        dinner: create_intenerary.Breakfast(),
        marketMallsStores: create_intenerary.Breakfast(),
      ));
    }
    super.initState();
    _navigationService = locator<NavigationService>();
  }

  int selected_index = 0;
  int selected_flag = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 90,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.subtitleColor,
            ),
            onPressed: () {
              _navigationService.goBack();
            },
          ),
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.aquaCasper2,
          title: const Text(
            "Design your Intinerary",
            style: TextStyle(
                fontSize: 17.0, color: AppColor.colorLiteBlack5),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(140),
            child: Container(
              color: AppColor.whiteColor,
              height: 170,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 3.0,
                  ),
                  SizedBox(
                    height: 35,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: list_of_days.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          int day = index + 1;
                          return InkWell(
                            onTap: () {
                              selected_index = index;
                              setState(() {});
                            },
                            child:   Container(
                              height: 30.0,
                              width: 80,
                              decoration: BoxDecoration(
                                color: selected_index == index
                                    ? AppColor.lightIndigo
                                    : Colors.grey,
                                borderRadius:
                                BorderRadius.circular(15.0),
                              ),
                              child: Center(
                                  child: Text(
                                    "Day $day",
                                    style: TextStyle(
                                        color: AppColor.whiteColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ),
                          );
                        },
                        separatorBuilder:
                            (BuildContext context, int index) {
                          return Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 2,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: AppColor.colorGrey,
                                    borderRadius:
                                    BorderRadius.circular(5)),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Container(
                                height: 2,
                                width: 2,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.colorGrey,
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Container(
                                height: 2,
                                width: 2,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.colorGrey,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                      height: 91.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: countryList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var image_index = Flags.listOfFlag.indexWhere(
                                    (element) =>
                                element ==
                                    "lib/assets/flags/${countryList[index]}.png");

                            return InkWell(
                              onTap: () {
                                list_of_days[selected_index].country = countryList[index];
                                selected_flag = index;
                                setState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5, ),
                                decoration: BoxDecoration(
                                    color:selected_flag == index? AppColor.aquaCasper2: AppColor.whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                               ),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 50.0,
                                        width: 70.0,
                                        child: image_index != -1
                                            ? Image.asset(Flags
                                            .listOfFlag[image_index])
                                            : Icon(
                                          Icons.flag,
                                          size: 40,
                                          color: AppColor.lightIndigo,
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${countryList[index]}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color:selected_flag == index? AppColor.lightIndigo: AppColor.borderColor2,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder:
                              (BuildContext context, int index) {
                            return SizedBox(
                              width: 20,
                            );
                          },
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 100,
          color: AppColor.whiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSave(),
              const SizedBox(
                width: 20,
              ),
              _buildContinue()
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 1.0,
                  ),
                  InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                AirportSelection()).then((value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              list_of_days[selected_index].airport ='';
                              return;
                            }

                            list_of_days[selected_index].airport =
                            value[0];
                            setState(() {});
                          }
                        });
                      },
                      child: TextDecoratedContainer(
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColor.lightIndigo,
                            size: 20,
                          ),
                          titleWidget: Text(
                            list_of_days[selected_index].airport!.isEmpty
                                ? 'Airport Code'
                                : '${list_of_days[selected_index].airport}',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: AppColor.headingColor2),
                          ),
                          iconImage: Row(
                            children: [
                              SvgPicture.asset('airplane_icon'.svg)
                            ],
                          ))),
                  BlocBuilder<TransportCubits, TransportStates>(
                      builder: (context, state) {
                        List<String> list = [];
                        List<bool> listOfBool = [];
                        if (state is TransportLoaded) {
                          list = state.response.result ?? [];
                          listOfBool = state.listOfBool;
                        }
                        return InkWell(
                            onTap: () {
                              _navigationService.navigateTo(checkListRoute,
                                  arguments:{
                                    "title": "Transport",
                                    "checklist": list,
                                    "listOfBool": listOfBool,
                                    "bool": false,
                                    "selectedCheckList": list_of_days[selected_index].transportation??[]})!.then((value) {
                                //getCheckList();
                                if(value != null){
                                  list_of_days[selected_index].transportation = value;
                                  setState(() {});

                                }else{
                                  setState(() {

                                  });
                                }

                              });


                            },
                            child: TextDecoratedContainer(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: AppColor.lightIndigo,
                                  size: 20,
                                ),
                                titleWidget: Text(
                                  'Type of transport',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: AppColor.headingColor2),
                                ),
                                iconImage: Row(
                                  children: [
                                    SvgPicture.asset('transport_icoon'.svg)
                                  ],
                                )));
                      }),
                  list_of_days[selected_index].transportation == null?SizedBox.shrink():
                  list_of_days[selected_index].transportation!.isEmpty? SizedBox.shrink():
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                        itemCount:  list_of_days[selected_index].transportation!.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: InkWell(
                              onTap: (){
                                list_of_days[selected_index].transportation!.remove( list_of_days[selected_index].transportation![index]);
                                setState(() {

                                });
                              },
                              child: Container(
                                  height: 35,
                                  padding: EdgeInsets.symmetric(horizontal: 6,vertical: 5),
                                  decoration: BoxDecoration(
                                    color: AppColor.aquaGreen.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(8),

                                  ),
                                  child:Row(
                                    children: [
                                      Text(
                                        '${ list_of_days[selected_index].transportation![index]}',
                                        style:  TextStyle(
                                            fontSize: 15.0, color: AppColor.whiteColor) ,
                                      ),
                                      SizedBox(width: 5),
                                      Icon(Icons.close, color: AppColor.whiteColor, size: 15,)
                                    ],
                                  )),
                            ),
                          );
                        }),
                  ),
                  InkWell(
                      onTap: () async{
                        await showCupertinoModalBottomSheet(
                        expand: true,
                        useRootNavigator: true,
                        context: context,
                        builder: (modalContext) =>
                            PlacesSearchModal(
                              passedContext: context,
                              modalContext: modalContext,
                              title: 'Accommodation',
                              signleSearch: false,
                              onPlaceSelected: (List<Place>? places) {
                                if (places != null) {

                                  var list = places.map((e) => create_intenerary.Accomodation(name: e.name, location:create_intenerary.Location(coordinates: [e.geometry.location.lng,e.geometry.location.lat]) )).toList();
                                  print('length................... ${list!.length}');

                                  list_of_days[selected_index].accomodation = list;

                                  /*  listOfSelectedPlaces = places!;
                                  //list_of_accommodation.add(create_intenerary.Accomodation());
                                  print('length ${places!.length}');
                                  print('marker_id_${places![0].geometry.location.lat}_${places[0].geometry.location.lng}');
                                  print('${places![0].name}');
                                  print('${places![0].vicinity}');*/
                                }
                              },
                            ),
                        ).then((value) {

                        });
                      },
                      child: TextDecoratedContainer(
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColor.lightIndigo,
                            size: 20,
                          ),
                          titleWidget: Text(
                            'Accommodation',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: AppColor.headingColor2),
                          ),
                          iconImage: Row(
                            children: [
                              SvgPicture.asset('accomadation'.svg)
                            ],
                          ))),
                  list_of_days[selected_index].accomodation == null?SizedBox.shrink():
                  list_of_days[selected_index].accomodation!.isEmpty? SizedBox.shrink():
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                        itemCount:  list_of_days[selected_index].accomodation!.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: InkWell(
                              onTap: (){
                                list_of_days[selected_index].accomodation!.remove( list_of_days[selected_index].accomodation![index]);
                                setState(() {

                                });
                              },
                              child: Container(
                                  height: 35,
                                  padding: EdgeInsets.symmetric(horizontal: 6,vertical: 5),
                                  decoration: BoxDecoration(
                                    color: AppColor.aquaGreen.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(8),

                                  ),
                                  child:Row(
                                    children: [
                                      Text(
                                        '${ list_of_days[selected_index].accomodation![index].name}',
                                        style:  TextStyle(
                                            fontSize: 15.0, color: AppColor.whiteColor) ,
                                      ),
                                      SizedBox(width: 5),
                                      Icon(Icons.close, color: AppColor.whiteColor, size: 15,)
                                    ],
                                  )),
                            ),
                          );
                        }),
                  ),
                  BlocBuilder<ActivityCubits, ActivityStates>(
                      builder: (context, state) {
                        List<String> listActivity = [];
                        List<bool> boolData = [];
                        if (state is ActivityLoaded) {
                          listActivity = state.activityTypeResponse.result ?? [];
                          print("selectedCheckList...${ state.listOfBool.toString()}...selected_index..$selected_index}");

                          boolData = state.listOfBool;
                        }

                        return InkWell(
                            onTap: () {

                              print("selectedCheckList...${boolData.toString()}...selected_index..$selected_index......listActivity..${listActivity}.....${list_of_days[selected_index].activities.toString()}");

                              _navigationService.navigateTo(checkListRoute,
                                  arguments:{
                                    "title": "Activities and Excursion",
                                    "checklist": listActivity,
                                    "listOfBool": boolData,
                                    "bool": false,
                                    "selectedCheckList": list_of_days[selected_index].activities??[]})!.then((value) {
                                //getCheckList();
                                if(value != null){
                                  list_of_days[selected_index].activities = value;
                                  setState(() {});

                                }else{
                                  setState(() {

                                  });
                                }

                              });

                            },
                            child: TextDecoratedContainer(
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: AppColor.lightIndigo,
                                size: 20,
                              ),
                              titleWidget: Text(
                                'Activities and Excursion',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: AppColor.headingColor2),
                              ),
                              iconImage: Row(
                                children: [
                                  SvgPicture.asset('activityy_Icon'.svg)
                                ],
                              ),
                            ));
                      }),
                  list_of_days[selected_index].activities == null?SizedBox.shrink():
                  list_of_days[selected_index].activities!.isEmpty? SizedBox.shrink():
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                        itemCount:  list_of_days[selected_index].activities!.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: InkWell(
                              onTap: (){
                                list_of_days[selected_index].activities!.remove( list_of_days[selected_index].activities![index]);
                                setState(() {

                                });
                              },
                              child: Container(
                                  height: 35,
                                  padding: EdgeInsets.symmetric(horizontal: 6,vertical: 5),
                                  decoration: BoxDecoration(
                                    color: AppColor.aquaGreen.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(8),

                                  ),
                                  child:Row(
                                    children: [
                                      Text(
                                        '${ list_of_days[selected_index].activities![index]}',
                                        style:  TextStyle(
                                            fontSize: 15.0, color: AppColor.whiteColor) ,
                                      ),
                                      SizedBox(width: 5),
                                      Icon(Icons.close, color: AppColor.whiteColor, size: 15,)
                                    ],
                                  )),
                            ),
                          );
                        }),
                  ),
                  InkWell(
                    onTap: () {
                      _navigationService.navigateTo(foodShoppingRoute,
                          arguments: {
                            "title": "Breakfast",
                            "name": list_of_days[selected_index].breakfast!.name??'',
                            "coordinate": list_of_days[selected_index].breakfast!.location?.coordinates??[],
                            "promo":list_of_days[selected_index].breakfast!.coupon??'',
                            "rate":list_of_days[selected_index].breakfast!.rating??0.0,
                            "comment":list_of_days[selected_index].breakfast!.comments??'',
                            "public_image_path":list_of_days[selected_index].breakfast!.imagesPublicPath??[],
                            "selected_image_path":list_of_days[selected_index].breakfast!.imagesSelectPath??[],
                            "selected_image_names":list_of_days[selected_index].breakfast!.imagesPublic??[],
                            "selected_image_names":list_of_days[selected_index].breakfast!.images??[],
                          })!.then((value) {
                        if (value != null) {
                          list_of_days[selected_index].breakfast = value;

                        setState(() {

                        });
                        }
                      });
                    },
                    child: TextDecoratedContainer(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColor.lightIndigo,
                        size: 20,
                      ),
                      titleWidget: Text(
                        'Breakfast ${list_of_days[selected_index].breakfast!.name??''}',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: AppColor.headingColor2),
                      ),
                      iconImage: Row(
                        children: [
                          SvgPicture.asset('breakfast_icon'.svg)
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _navigationService.navigateTo(foodShoppingRoute,
                          arguments: {"title": "Lunch",
                            "name": list_of_days[selected_index].lunch!.name??'',
                            "coordinate": list_of_days[selected_index].lunch!.location?.coordinates??[],
                            "promo":list_of_days[selected_index].lunch!.coupon??'',
                            "rate":list_of_days[selected_index].lunch!.rating??0.0,
                            "comment":list_of_days[selected_index].lunch!.comments??'',
                            "public_image_path":list_of_days[selected_index].lunch!.imagesPublicPath??[],
                            "selected_image_path":list_of_days[selected_index].lunch!.imagesSelectPath??[],
                            "selected_image_names":list_of_days[selected_index].lunch!.imagesPublic??[],
                            "selected_image_names":list_of_days[selected_index].lunch!.images??[],
                          })!.then((value) {
                        if (value != null) {
                          list_of_days[selected_index].lunch = value;
                          setState(() {

                          });
                        }
                      });
                    },
                    child: TextDecoratedContainer(
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColor.lightIndigo,
                          size: 20,
                        ),
                        titleWidget: Text(
                          'Lunch ${list_of_days[selected_index].lunch!.name??''}',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: AppColor.headingColor2),
                        ),
                        iconImage: Row(
                          children: [SvgPicture.asset('lunch_icon'.svg)],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      _navigationService.navigateTo(foodShoppingRoute,
                          arguments: {"title": "Dinner",
                            "name": list_of_days[selected_index].dinner!.name??'',
                            "coordinate": list_of_days[selected_index].dinner!.location?.coordinates??[],
                            "promo":list_of_days[selected_index].dinner!.coupon??'',
                            "rate":list_of_days[selected_index].dinner!.rating??0.0,
                            "comment":list_of_days[selected_index].dinner!.comments??'',
                            "public_image_path":list_of_days[selected_index].dinner!.imagesPublicPath??[],
                            "selected_image_path":list_of_days[selected_index].dinner!.imagesSelectPath??[],
                            "selected_image_names":list_of_days[selected_index].dinner!.imagesPublic??[],
                            "selected_image_names":list_of_days[selected_index].dinner!.images??[],

                          })!.then((value) {
                        if (value != null) {
                          list_of_days[selected_index].dinner = value;
                          setState(() {
                          });
                        }
                      });
                    },
                    child: TextDecoratedContainer(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColor.lightIndigo,
                        size: 20,
                      ),
                      titleWidget: Text(
                        'Dinner ${ list_of_days[selected_index].dinner!.name??''}',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: AppColor.headingColor2),
                      ),
                      iconImage: Row(
                        children: [SvgPicture.asset('dinner_icon'.svg)],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _navigationService.navigateTo(foodShoppingRoute,
                          arguments: {
                            "title": "Coffee Shops Clubs & Lounges",
                            "name": list_of_days[selected_index].coffeeClubsLounges!.name??'',
                            "coordinate": list_of_days[selected_index].coffeeClubsLounges!.location?.coordinates??[],
                            "promo":list_of_days[selected_index].coffeeClubsLounges!.coupon??'',
                            "rate":list_of_days[selected_index].coffeeClubsLounges!.rating??0.0,
                            "comment":list_of_days[selected_index].coffeeClubsLounges!.comments??'',
                            "public_image_path":list_of_days[selected_index].coffeeClubsLounges!.imagesPublicPath??[],
                            "selected_image_path":list_of_days[selected_index].coffeeClubsLounges!.imagesSelectPath??[],
                            "selected_image_names":list_of_days[selected_index].coffeeClubsLounges!.imagesPublic??[],
                            "selected_image_names":list_of_days[selected_index].coffeeClubsLounges!.images??[],
                          })!.then((value) {
                        if (value != null) {
                          list_of_days[selected_index]
                              .coffeeClubsLounges = value;
                            setState(() {

                            });
                        }
                      });
                    },
                    child: TextDecoratedContainer(
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColor.lightIndigo,
                          size: 20,
                        ),
                        titleWidget: Text(
                          'Coffee Shops Clubs & Lounges ${list_of_days[selected_index].coffeeClubsLounges!.name??''}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: AppColor.headingColor2),
                        ),
                        iconImage: Row(
                          children: [SvgPicture.asset('coffee_icon'.svg)],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      _navigationService.navigateTo(foodShoppingRoute,
                          arguments: {
                            "title": "Market, Malls & Store",
                            "name": list_of_days[selected_index].marketMallsStores!.name??'',
                            "coordinate": list_of_days[selected_index].marketMallsStores!.location?.coordinates??[],
                            "promo":list_of_days[selected_index].marketMallsStores!.coupon??'',
                            "rate":list_of_days[selected_index].marketMallsStores!.rating??0.0,
                            "comment":list_of_days[selected_index].marketMallsStores!.comments??'',
                            "public_image_path":list_of_days[selected_index].marketMallsStores!.imagesPublicPath??[],
                            "selected_image_path":list_of_days[selected_index].marketMallsStores!.imagesSelectPath??[],
                            "selected_image_names":list_of_days[selected_index].marketMallsStores!.imagesPublic??[],
                            "selected_image_names":list_of_days[selected_index].marketMallsStores!.images??[],
                          })!.then((value) {
                        if (value != null) {
                          list_of_days[selected_index].marketMallsStores =
                              value;
                          setState(() {

                          });
                        }
                      });
                    },
                    child: TextDecoratedContainer(
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColor.lightIndigo,
                          size: 20,
                        ),
                        titleWidget: Text(
                          'Market, Malls & Store ${list_of_days[selected_index].marketMallsStores!.name??''}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: AppColor.headingColor2),
                        ),
                        iconImage: Row(
                          children: [SvgPicture.asset('market_icon'.svg)],
                        )),
                  ),
                ],
              )),
        ),
      )
           ),
    );
  }

  Widget _buildSave(){


      if (list_of_days[selected_index].airport ==null ||
          list_of_days[selected_index].transportation == null ||
          list_of_days[selected_index].accomodation == null ||
          list_of_days[selected_index].accomodation == null ||
          list_of_days[selected_index].breakfast == null ||
          list_of_days[selected_index].lunch == null ||
          list_of_days[selected_index].dinner == null ||
          list_of_days[selected_index].marketMallsStores == null ||
          list_of_days[selected_index].coffeeClubsLounges == null
      ) {
        return Container(
          height: 46.0,
          width: 150.0,
          decoration: BoxDecoration(
              color: AppColor.colorLiteBlack4,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Center(
            child: Text(
              "Save",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: AppColor.colorBlack),
            ),
          ),
        );
      }

      return InkWell(
      onTap: () {
        print("selected index.....$selected_index");


        if (selected_index+1 == list_of_days.length) {
            create_intenerary.DayDesignIntineraryRequest
            request = create_intenerary.DayDesignIntineraryRequest(
              step: 3,
              days: list_of_days,
              live: false,
            );

            String id = widget.map['id'];
            context
                .read<DayUpdateIntineraryCubits>()
                .dayUpdateIntineraryPage(
                itineraryId: id,
                dayDesignIntineraryRequest: request,
                navigationService: _navigationService,
                route: "Save",);

        }else{
          selected_index++;
          setState(() {});
        }
      },
      child: Container(
        height: 46.0,
        width: 150.0,
        decoration: BoxDecoration(
            color: AppColor.buttonColor,
            borderRadius: BorderRadius.circular(8.0)),
        child: const Center(
          child: Text(
            "Save",
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: AppColor.whiteColor),
          ),
        ),
      ),
    );

  }

  Widget _buildContinue(){

    if (list_of_days[selected_index].airport == null ||
        list_of_days[selected_index].transportation == null ||
        list_of_days[selected_index].accomodation == null ||
        list_of_days[selected_index].activities == null ||
        list_of_days[selected_index].breakfast == null ||
        list_of_days[selected_index].lunch == null ||
        list_of_days[selected_index].dinner == null ||
        list_of_days[selected_index].marketMallsStores == null ||
        list_of_days[selected_index].coffeeClubsLounges == null||
        list_of_days[selected_index].country == null
    ) {
      return Container(
        height: 46.0,
        width: 150.0,
        decoration: BoxDecoration(
            color: AppColor.colorLiteBlack4,
            borderRadius: BorderRadius.circular(8.0)),
        child: const Center(
          child: Text(
            "Continue",
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: AppColor.colorBlack),
          ),
        ),
      );
    }

    return InkWell(
      onTap: () {

        print("selected index.....${selected_index+1}.....lenght....${list_of_days.length}");

        if (selected_index+1 == list_of_days.length) {
          create_intenerary.DayDesignIntineraryRequest
          request = create_intenerary.DayDesignIntineraryRequest(
            step: 3,
            days: list_of_days,
            live: false,
          );

          String id = widget.map['id'];
          context
              .read<DayUpdateIntineraryCubits>()
              .dayUpdateIntineraryPage(
              itineraryId: id,
              dayDesignIntineraryRequest: request,
              navigationService: _navigationService,
              route: "Continue",
          );

        }else{
          selected_index++;
          setState(() {

          });
        }
      },
      child: Container(
        height: 46.0,
        width: 150.0,
        decoration: BoxDecoration(
            color: AppColor.buttonColor,
            borderRadius: BorderRadius.circular(8.0)),
        child: const Center(
          child: Text(
            "Continue",
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: AppColor.whiteColor),
          ),
        ),
      ),
    );
  }

}
