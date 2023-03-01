import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/home/home_view_model/draft_itinerary_states.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/home/home_view_model/draft_itinerary_cubits.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../customWidgets/delete_all_confirm_dialoge_.dart';
import '../../navigation/navigation_service.dart';

class DraftItineraryScreen extends StatefulWidget {
  const DraftItineraryScreen({Key? key}) : super(key: key);

  @override
  State<DraftItineraryScreen> createState() => _DraftItineraryScreenState();
}

class _DraftItineraryScreenState extends State<DraftItineraryScreen> {

  late NavigationService _navigationService;
  @override
  void initState() {
    context.read<DraftItineraryCubits>().getDraftItinerary();
    super.initState();
    _navigationService = locator<NavigationService>();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
       color: AppColor.whiteColor,
      child: SafeArea(
          child: Scaffold(
              backgroundColor: AppColor.whiteColor,
              appBar: AppBar(
                elevation: 0,
                toolbarHeight: 60,
                leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: AppColor.lightIndigo,), onPressed: () {
                  _navigationService.goBack();
                },),
                backgroundColor: AppColor.aquaCasper2,
                title: const Text("Draft Itineraries", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
                centerTitle: true,
                actions: [
                  IconButton(onPressed: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                        DialogDeleteAllConfirm()).then((value){

                      context.read<DraftItineraryCubits>().getDraftItinerary(onDelete: (){
                        setState(() {

                        });

                      });


                    });
                  }, icon: SvgPicture.asset('delete_icon'.svg))
                ],
              ),
              body: BlocBuilder<DraftItineraryCubits, DraftItineraryStates>(
              builder: (context, state) {

                    if (state is DraftItineraryInitial) {
                      return SizedBox();
                    }

                    if (state is DraftItineraryLoading) {
                      Center(child: CupertinoActivityIndicator());
                    }

                    if (state is DraftItineraryLoaded) {
                        var list = state.list;
                       return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20.0,),
                          Expanded(
                            child: ListView.builder(
                                itemCount: list.length,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index){
                                  return InkWell(
                                    onTap: (){
                                      //_navigationService.navigateTo(summaryRoutEdit);
                                    },
                                    child: Padding(padding: const EdgeInsets.only(right: 30.0, left: 30, top: 10),
                                      child: Container(
                                          height: 86.0,
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
                                                height: 72.0,
                                                width: 72.0,
                                                decoration: BoxDecoration(
                                                    color: AppColor.aquaCasper2,
                                                    borderRadius: BorderRadius.circular(10.0)
                                                ),

                                              ),
                                              const SizedBox(width: 10,),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                   Text("${list[index]['title']??''}", style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500 ,color: AppColor.headingColor),),
                                                  const SizedBox(height: 10.0,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: const [
                                                      Icon(Icons.question_mark, size: 10.0,),
                                                      Text(" United Arab Emirate", style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w500 ,color: AppColor.subtitleColor),),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10.0,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(height: 1,width: 35 , color: AppColor.colorBlue,),
                                                      const SizedBox(width: 5.0,),
                                                      Container(height: 1,width: 35 , color: AppColor.colorBlue,),
                                                      const SizedBox(width: 5.0,),
                                                      Container(height: 1,width: 35 , color: AppColor.colorGrey,),
                                                      const SizedBox(width: 5.0,),
                                                      Container(height: 1,width: 35 , color: AppColor.colorGrey,),
                                                      const SizedBox(width: 5.0,),
                                                    ],
                                                  ),
                                                ],),
                                              const Spacer(),
                                              const Icon(Icons.navigate_next_sharp, size: 30.0, color: AppColor.lightIndigo,)

                                            ],)

                                      ),),
                                  );
                                }),
                          ),
                        ],

                      );
                    }

                    return Center(child: Text("data not found"),);
              }

            )),
          ));
  }
}
