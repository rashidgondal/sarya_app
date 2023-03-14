import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/home/home_view_model/sold_itineraries_cubits.dart';
import 'package:sarya/home/home_view_model/sold_itineraries_states.dart';
import 'package:sarya/home/home_view_model/sold_itinerary_by_id_cubits.dart';
import 'package:sarya/home/home_view_model/sold_itinerary_by_id_states.dart';
import 'package:sarya/home/model/sold_Itinerary_detail_response.dart';
import 'package:sarya/home/model/sold_all_response.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../core/network/routes/api_routes.dart';

class SoldItineraryDetail extends StatefulWidget {
  final SoldAllResult soldAllResult;

  const SoldItineraryDetail({Key? key, required this.soldAllResult})
      : super(key: key);

  @override
  State<SoldItineraryDetail> createState() => _SoldItineraryDetailState();
}

class _SoldItineraryDetailState extends State<SoldItineraryDetail> {
  late NavigationService _navigationService;

  @override
  void initState() {
    context
        .read<SoldItineraryByIDCubits>()
        .getSoldItineraryByID(itineraryID: '${widget.soldAllResult.sId}');
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
          backgroundColor: AppColor.whiteColor,
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
              "Sold Itineraries",
              style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
            ),
            centerTitle: true,
          ),
          body: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 30.0,
                    left: 30,
                  ),
                  child: Container(
                      height: 96.0,
                      width: size.width,
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
                            height: 82.0,
                            width: 82.0,
                            decoration: BoxDecoration(
                                color: AppColor.aquaCasper2,
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "${ApiRoutes.picBaseURL}${widget.soldAllResult.profileImg}"),
                                    fit: BoxFit.fill)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.soldAllResult.title}",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.headingColor),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.soldAllResult.destination.toString().replaceAll('[', '').replaceAll(']', '').trim()}",
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.subtitleColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Total Purchases: ${widget.soldAllResult.totalPurchases}",
                                style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.subtitleColor),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                  height: 16,
                                  decoration: BoxDecoration(
                                      color: AppColor.aquaCasper2,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                      ),
                                      child: Text(
                                        "\$ ${widget.soldAllResult.totalRevenue}",
                                        style: TextStyle(
                                            fontSize: 9.0,
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.lightIndigo),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      )),
                ),
                BlocBuilder<SoldItineraryByIDCubits, SoldItineraryByIDStates>(
                    builder: (context, state) {
                  if (state is SoldItineraryByIDInitial) {
                    return SizedBox();
                  }

                  if (state is SoldItineraryByIDLoading) {
                    Center(child: CupertinoActivityIndicator());
                  }

                  if (state is SoldItineraryByIDLoaded) {
                    List<DetailResult> list = state.result;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  right: 30.0, left: 30, top: 10),
                              child: Container(
                                  height: 96.0,
                                  width: 101.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          width: 1,
                                          color: AppColor.borderColor)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${list[index].purchaseTime ?? ''}",
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.headingColor),
                                      ),
                                    ],
                                  )),
                            );
                          }),
                    );
                  }

                  return Center(
                    child: Text("data not found"),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
