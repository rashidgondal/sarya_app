import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/home/home_view_model/sold_itineraries_states.dart';
import 'package:sarya/home/model/sold_all_response.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../core/network/routes/api_routes.dart';
import '../../navigation/navigation_service.dart';
import '../home_view_model/draft_itinerary_cubits.dart';
import '../home_view_model/draft_itinerary_states.dart';
import '../home_view_model/sold_itineraries_cubits.dart';

class SoldItineraryScreen extends StatefulWidget {
  const SoldItineraryScreen({Key? key}) : super(key: key);

  @override
  State<SoldItineraryScreen> createState() => _SoldItineraryScreenState();
}

class _SoldItineraryScreenState extends State<SoldItineraryScreen> {

  late NavigationService _navigationService;
  @override
  void initState() {
    context.read<SoldItinerariesCubits>().getAllSoldItinerary();
    super.initState();
    _navigationService = locator<NavigationService>();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
       color: AppColor.whiteColor,
      child: SafeArea(
          child:
      Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 60,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: AppColor.subtitleColor,), onPressed: () {
            _navigationService.goBack();
          },),
          backgroundColor: AppColor.aquaCasper2,
          title: const Text("Sold Itineraries", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
          centerTitle: true,
        ),
        body:  BlocBuilder<SoldItinerariesCubits, SoldItinerariesStates>(
            builder: (context, state) {
              if (state is SoldItineraryInitial) {
                return SizedBox();
              }

              if (state is SoldItineraryLoading) {
                Center(child: CupertinoActivityIndicator());
              }

              if (state is SoldItineraryLoaded) {
                List<SoldAllResult> list = state.result;
                return
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0,),
                      Expanded(
                        child: ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (BuildContext context, int index){
                              return Padding(padding: const EdgeInsets.only(right: 30.0, left: 30, top: 10),
                                child: InkWell(
                                  onTap: (){
                                    _navigationService.navigateTo(soldDetailViewRoute, arguments: list[index]);
                                  },
                                  child: Container(
                                      height: 96.0,
                                      width: 101.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          border: Border.all(width: 1, color: AppColor.borderColor)
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(width: 5,),
                                          Container(
                                            height: 82.0,
                                            width: 82.0,
                                            decoration: BoxDecoration(
                                                color: AppColor.aquaCasper2,
                                                borderRadius: BorderRadius.circular(10.0),
                                                image: DecorationImage(image: NetworkImage(
                                                    "${ApiRoutes.picBaseURL}${list[index].profileImg}"
                                                ),
                                                    fit: BoxFit.fill
                                                )
                                            ),

                                          ),
                                          const SizedBox(width: 10,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                               Text("${list[index].title??''}", style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500 ,color: AppColor.headingColor),),
                                              const SizedBox(height: 5.0,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children:  [
                                                  Text(
                                                    "${list[index].destination.toString().replaceAll('[', '').replaceAll(']', '').trim()}",
                                                    style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w500 ,color: AppColor.subtitleColor),),
                                                ],
                                              ),
                                              const SizedBox(height: 5.0,),
                                              Text("Total Purchases: ${list[index].totalPurchases??''}", style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500 ,color: AppColor.subtitleColor),),
                                              const SizedBox(height: 5.0,),

                                              Container(
                                                  height: 16,
                                                  decoration: BoxDecoration(
                                                      color: AppColor.aquaCasper2,
                                                      borderRadius: BorderRadius.circular(7)
                                                  ),
                                                  child: Center(
                                                    child:  Padding(
                                                      padding:  EdgeInsets.only(left: 8, right: 8,),
                                                      child: Text("\$${list[index].totalRevenue}", style: TextStyle(fontSize: 9.0, fontWeight: FontWeight.w500 ,color: AppColor.lightIndigo),),
                                                    ),
                                                  )),


                                            ],),
                                          const Spacer(),
                                          const Icon(Icons.navigate_next_sharp, size: 30.0, color: AppColor.lightIndigo,)

                                        ],)

                                  ),
                                ),);
                            }),
                      ),
                    ],

                  );
              }

              return Center(
                child: Text("data not found"),
              );
            })



      )),
    );
  }
}
