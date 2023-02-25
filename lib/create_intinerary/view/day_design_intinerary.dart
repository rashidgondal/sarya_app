import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/activity_cubits.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/activity_states.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/transport_cubits.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/transport_states.dart';
import 'package:sarya/customWidgets/dialoge_activities_excursion.dart';
import 'package:sarya/customWidgets/text_decorated_icon.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../customWidgets/dialoge_airport_cost.dart';
import '../../customWidgets/dialoge_type_of_transport.dart';
import '../../locator.dart';
import '../model/create_intinerary_request.dart' as create_intenerary;

class DayDesignIntineraryScreen extends StatefulWidget {
  const DayDesignIntineraryScreen({Key? key}) : super(key: key);

  @override
  State<DayDesignIntineraryScreen> createState() =>
      _DayDesignIntineraryScreenState();
}

class _DayDesignIntineraryScreenState extends State<DayDesignIntineraryScreen> {
  TextEditingController textEditingController = TextEditingController();
  int dayLength = 5;
  late NavigationService _navigationService;
  List<create_intenerary.Days> list_of_days = [];

  @override
  void initState() {
    for (var i = 0; i < dayLength; i++) {
      list_of_days
          .add(create_intenerary.Days(airport: '', country: '', market: ''));
    }
    super.initState();
    _navigationService = locator<NavigationService>();
  }

  int selected_index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(
          child: Scaffold(
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
                  style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
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
                          height: 50,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: list_of_days.length,
                              itemBuilder: (BuildContext context, int index) {
                                int day = index + 1;
                                return InkWell(
                                  onTap: () {
                                    selected_index = index;
                                    setState(() {});
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30.0,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: selected_index == index
                                              ? AppColor.lightIndigo
                                              : Colors.grey,
                                          borderRadius: BorderRadius.circular(15.0),
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
                                      const SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Container(
                                      height: 2,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: AppColor.colorGrey,
                                          borderRadius: BorderRadius.circular(5)),
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
                          height: 5.0,
                        ),
                        SizedBox(
                            height: 91.0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: const [
                                      SizedBox(
                                        height: 60.0,
                                        width: 70.0,
                                        child: Icon(
                                          Icons.question_mark,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Malaysia",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColor.headingColor2,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    width: 20,
                                  );
                                },
                              ),
                            )
                            /*    Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  height: 60.0,
                                  width: 70.0,
                                  child: Icon(Icons.question_mark, ),
                                ),
                                SizedBox(height: 5,),
                                Text("Malaysia", style: TextStyle(fontSize: 16,color: AppColor.headingColor2, fontWeight: FontWeight.w500),)


                              ],
                            ),
                            const SizedBox(width: 20,),
                            Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  height: 60.0,
                                  width: 70.0,
                                  child: Icon(Icons.question_mark, ),
                                ),
                                SizedBox(height: 5,),
                                Text("Dubai", style: TextStyle(fontSize: 16,color: AppColor.colorBlue,fontWeight: FontWeight.w500),)


                              ],
                            ),


                          ],
                        ),*/
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
                    InkWell(
                      onTap: () {
                        _navigationService.navigateTo(draftIntineraryRoute);
                      },
                      child: Container(
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
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        //_navigationService.navigateTo(summaryRoutSold);
                        if (selected_index < list_of_days.length) {
                          if(list_of_days[selected_index].airport!.isNotEmpty){
                            selected_index++;
                            setState(() {});
                          }else{
                            print('please input airpot code');
                          }
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
                    ),
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
                                  builder: (BuildContext context) => AirportSelection(
                                        textEditingController: textEditingController,
                                      )).then((value) {
                                list_of_days[selected_index].airport = 'Dubai';
                                setState(() {});
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
                                      fontSize: 15.0, color: AppColor.headingColor2),
                                ),
                                iconImage: Row(
                                  children: [SvgPicture.asset('airplane_icon'.svg)],
                                ))),
                        BlocBuilder<TransportCubits, TransportStates>(
                            builder: (context, state) {
                              List<String> list = [];
                              List<bool>    listOfBool = [];
                              if(state is TransportLoaded){
                                list = state.response.result??[];
                                listOfBool = state.listOfBool;
                              }
                              return   InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => TypeOfTransport(
                                          textEditingController: textEditingController,
                                          tripList: list,
                                          boolList: listOfBool,
                                        ));
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
                                            fontSize: 15.0, color: AppColor.headingColor2),
                                      ),
                                      iconImage: Row(
                                        children: [SvgPicture.asset('transport_icoon'.svg)],
                                      )));
                            }

                        ),
                        InkWell(
                            onTap: () {
                              _navigationService.navigateTo(searchPlacesRoute);
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
                                      fontSize: 15.0, color: AppColor.headingColor2),
                                ),
                                iconImage: Row(
                                  children: [SvgPicture.asset('accomadation'.svg)],
                                ))),
                        BlocBuilder<ActivityCubits, ActivityStates>(
                            builder: (context, state) {
                              List<String> list = [];
                              List<bool> listOfBool = [];
                              if(state is ActivityLoaded){
                                list = state.activityTypeResponse.result??[];
                                listOfBool = state.listOfBool;
                              }
                              return  InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            ActivitiesExcursion(
                                              textEditingController: textEditingController,
                                              listOfActivity: list,
                                              listOfBool:listOfBool,
                                            ));
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
                                          fontSize: 15.0, color: AppColor.headingColor2),
                                    ),
                                    iconImage: Row(
                                      children: [SvgPicture.asset('activityy_Icon'.svg)],
                                    ),
                                  ));
                            }

                        ),
                        InkWell(
                          onTap: (){
                            _navigationService.navigateTo(foodShoppingRoute, arguments: {"title":"Breakfast"});
                          },
                          child: TextDecoratedContainer(
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: AppColor.lightIndigo,
                              size: 20,
                            ),
                            titleWidget: Text(
                              'Breakfast',
                              style: TextStyle(
                                  fontSize: 15.0, color: AppColor.headingColor2),
                            ),
                            iconImage: Row(
                              children: [SvgPicture.asset('breakfast_icon'.svg)],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            _navigationService.navigateTo(foodShoppingRoute, arguments: {"title":"Lunch"});

                          },
                          child: TextDecoratedContainer(
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: AppColor.lightIndigo,
                                size: 20,
                              ),
                              titleWidget: Text(
                                'Lunch',
                                style: TextStyle(
                                    fontSize: 15.0, color: AppColor.headingColor2),
                              ),
                              iconImage: Row(
                                children: [SvgPicture.asset('lunch_icon'.svg)],
                              )),
                        ),
                        InkWell(
                          onTap: (){
                            _navigationService.navigateTo(foodShoppingRoute, arguments: {"title":"Dinner"});
                          },
                          child: TextDecoratedContainer(
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: AppColor.lightIndigo,
                              size: 20,
                            ),
                            titleWidget: Text(
                              'Dinner',
                              style: TextStyle(
                                  fontSize: 15.0, color: AppColor.headingColor2),
                            ),
                            iconImage: Row(
                              children: [SvgPicture.asset('dinner_icon'.svg)],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            _navigationService.navigateTo(foodShoppingRoute, arguments: {"title": "Coffee Shops Clubs & Lounges"});

                          },
                          child: TextDecoratedContainer(
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: AppColor.lightIndigo,
                                size: 20,
                              ),
                              titleWidget: Text(
                                'Coffee Shops Clubs & Lounges',
                                style: TextStyle(
                                    fontSize: 15.0, color: AppColor.headingColor2),
                              ),
                              iconImage: Row(
                                children: [SvgPicture.asset('coffee_icon'.svg)],
                              )),
                        ),
                        InkWell(
                          onTap: (){
                            _navigationService.navigateTo(foodShoppingRoute, arguments: {"title": "Market, Malls & Store"});

                          },
                          child: TextDecoratedContainer(
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: AppColor.lightIndigo,
                                size: 20,
                              ),
                              titleWidget: Text(
                                'Market, Malls & Store',
                                style: TextStyle(
                                    fontSize: 15.0, color: AppColor.headingColor2),
                              ),
                              iconImage: Row(
                                children: [SvgPicture.asset('market_icon'.svg)],
                              )),
                        ),
                      ],
                    )),
              ),
      )),
    );
  }


}
