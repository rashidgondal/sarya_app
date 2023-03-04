import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/core/network/routes/api_routes.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/shop/shop_view_model/search_cubits.dart';
import 'package:sarya/shop/shop_view_model/search_states.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../navigation/router_path.dart';
import '../model/search_itinerary_response.dart';

class SearchItineraryScreen extends StatefulWidget {
  const SearchItineraryScreen({Key? key}) : super(key: key);

  @override
  State<SearchItineraryScreen> createState() => _SearchItineraryScreenState();
}

class _SearchItineraryScreenState extends State<SearchItineraryScreen> {
  late NavigationService _navigationService;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();
  }


  @override
  Widget build(BuildContext context) {
    return  Container(
      color: AppColor.whiteColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 60,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: AppColor.lightIndigo,),
                onPressed: () {
                  _navigationService.goBack();
                }),
            backgroundColor: AppColor.aquaCasper2,
            title: const Text(
              "Search Itinerary",
              style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
            ),
            centerTitle: true,

          ),
          body:Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    height: 48,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColor.bgColor,
                        borderRadius: BorderRadius.circular(24)
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (v){
                          context.read<SearchItineraryCubits>().getSearchItinerary(searchKeyWord: v);
                            setState(() {

                            });
                        },
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                            fontSize: 14.0,
                            color: AppColor.colorBlack,
                            fontWeight: FontWeight.w500),
                        decoration:  InputDecoration(
                            isDense: false,
                            suffixIconConstraints:const BoxConstraints(
                              minWidth: 5,
                              minHeight: 45,
                            ),

                            border: InputBorder.none,
                            hintText: "Search for Location",
                            fillColor: AppColor.aquaCasper,
                            contentPadding: EdgeInsets.zero,
                            /*  suffixIcon: SizedBox(
                              height: 25, width: 35,
                              child: Row(
                                children: [
                                  SvgPicture.asset("search_icon".svg, height: 25, width: 25,),
                                  SizedBox(width: 10,)
                                ],
                              ),
                            ),*/
                            hintStyle: TextStyle(
                                fontSize: 15.0,
                                color: AppColor.subtitleColor,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  BlocBuilder<SearchItineraryCubits, SearchItineraryStates>(
                      builder: (context, state) {
                        List<SearchResult> list = [];
                        if (state is SearchItineraryInitial) {
                          return Center(child: SizedBox(),);
                        }

                        if (state is SearchItineraryLoading) {
                          return Center(child: CupertinoActivityIndicator(),);
                        }

                        if (state is SearchItineraryLoaded) {
                          SearchItineraryResponse response = state.searchItineraryResponse;
                          list = response.result?? [];
                        }

                        if(list.isEmpty){
                          return Center(
                            child: Text(
                              "Data not found",
                              style: TextStyle(
                                  fontSize: 14.0, color: AppColor.colorLiteBlack2, fontWeight: FontWeight.w500),
                            ),
                          );
                        }

                        return  ListView.builder(
                            itemCount: list.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  _navigationService.navigateTo(summaryRoutStart);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                      height: 86.0,
                                      width: 101.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          image: DecorationImage(image: NetworkImage("${ApiRoutes.picBaseURL}${list[index].profileImg}"),fit: BoxFit.fill),

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
                                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                            decoration: BoxDecoration(
                                              color: AppColor.aquaCasper2,
                                              borderRadius: BorderRadius.circular(20),

                                            ),
                                            child: Text("\$111", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: AppColor.lightIndigo),) ,
                                          ),
                                          SizedBox(width: 5,)
                                        ],
                                      )),
                                ),
                              );
                            });

                      }),
                ],
              ),
            ),

          ) ,
        ),
      ),
    );
  }
}
