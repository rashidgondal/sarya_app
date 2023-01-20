import 'package:flutter/material.dart';
import 'package:sarya/customWidgets/custom_text_field.dart';
import 'package:sarya/customWidgets/dial_trip_estimation_cost.dart';
import 'package:sarya/customWidgets/dialoge_activities_excursion.dart';
import 'package:sarya/customWidgets/dialoge_select_trip_type.dart';
import 'package:sarya/customWidgets/text_decorated_icon.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/dialoge_airport_cost.dart';
import '../../customWidgets/dialoge_type_of_transport.dart';
import '../../locator.dart';

class DayDesignIntineraryScreen extends StatefulWidget {
  const DayDesignIntineraryScreen({Key? key}) : super(key: key);

  @override
  State<DayDesignIntineraryScreen> createState() =>
      _DayDesignIntineraryScreenState();
}

class _DayDesignIntineraryScreenState extends State<DayDesignIntineraryScreen> {
  TextEditingController textEditingController = TextEditingController();

  late NavigationService _navigationService;
  @override
  void initState() {
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
          /*   leading: IconButton(
             icon: const Icon(
               Icons.arrow_back_ios,
               color: AppColor.subtitleColor,
             ),
             onPressed: () {},
           ),*/
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.aquaCasper2,
          title: const Text(
            "Design your Intinerary",
            style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(140), child: Container(
            color: AppColor.whiteColor,
            height: 140,
            width: size.width,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 5.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 30.0,
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColor.lightIndigo,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Center(child: Text("Day 1",style: TextStyle(color: AppColor.whiteColor, fontSize: 14, fontWeight: FontWeight.w500),)),
                    ),
                    const SizedBox(width: 5,),
                    Container(height: 2,width: 20,
                    decoration:  BoxDecoration(
                      color: AppColor.colorGrey,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    ),
                    const SizedBox(width: 2,),
                    Container(height: 2,width: 2,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.colorGrey,
                    ),
                    ),
                    const SizedBox(width: 2,),
                    Container(height: 2,width: 2,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.colorGrey,
                    ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                      height: 30.0,
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColor.aquaCasper2,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Center(child: Text("Day 2",style: TextStyle(color: AppColor.colorGrey, fontSize: 14, fontWeight: FontWeight.w500),)),
                    ),
                    const SizedBox(width: 5,),
                    Container(height: 2,width: 20,
                      decoration:  BoxDecoration(
                          color: AppColor.colorGrey,
                          borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                    const SizedBox(width: 2,),
                    Container(height: 2,width: 2,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.colorGrey,
                      ),
                    ),
                    const SizedBox(width: 2,),
                    Container(height: 2,width: 2,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.colorGrey,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                      height: 30.0,
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColor.aquaCasper2,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Center(child: Text("Day 3",style: TextStyle(color: AppColor.colorGrey, fontSize: 14, fontWeight: FontWeight.w500),)),
                    ),

                  ],
                ),
                const SizedBox(height: 5.0,),
                SizedBox(
                  height: 91.0,
                  child: Row(

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
                  ),
                )

              ],),
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
                  _navigationService.navigateTo(summaryRoutSold);

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
                  const SizedBox(
                    height: 1.0,
                  ),
                   InkWell(
                       onTap: (){
                         showDialog(
                             context: context,
                             builder: (BuildContext context) =>  AirportSelection(textEditingController: textEditingController,));


                       },
                       child:const TextDecoratedContainer(
                         icon: Icon(
                         Icons.arrow_forward_ios_outlined,
                         color: AppColor.lightIndigo,
                         size: 20,
                       ),
                         titleWidget: Text(
                         'Airport Code',
                         style:  TextStyle(
                             fontSize: 15.0, color: AppColor.headingColor2),
                       ),
                         iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),)),
                   InkWell(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>  TypeOfTransport(textEditingController: textEditingController,));


                      },child:const TextDecoratedContainer(icon: Icon(
                     Icons.arrow_forward_ios_outlined,
                     color: AppColor.lightIndigo,
                     size: 20,
                   ), titleWidget:Text(
                     'Type of transport',
                     style:  TextStyle(
                         fontSize: 15.0, color: AppColor.headingColor2),
                   ), iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),)),
                  InkWell(
                      onTap: (){


                      },
                       child: const TextDecoratedContainer(icon: Icon(
                         Icons.arrow_forward_ios_outlined,
                         color: AppColor.lightIndigo,
                         size: 20,
                       ),
                         titleWidget:Text(
                           'Accommodation',
                           style:  TextStyle(
                               fontSize: 15.0, color: AppColor.headingColor2),
                         ), iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),)),
                  InkWell(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>  ActivitiesExcursion(textEditingController: textEditingController,));


                      },child:
                  const TextDecoratedContainer( icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColor.lightIndigo,
                    size: 20,
                  ), titleWidget: Text(
                    'Activities and Excursion',
                    style:  TextStyle(
                        fontSize: 15.0, color: AppColor.headingColor2),
                  ),  iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),)),

                  const  TextDecoratedContainer(icon: Icon(
                     Icons.arrow_forward_ios_outlined,
                     color: AppColor.lightIndigo,
                     size: 20,
                   ), titleWidget :Text(
                    'Breakfast',
                    style:  TextStyle(
                        fontSize: 15.0, color: AppColor.headingColor2),
                  ), iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),),
                  const TextDecoratedContainer(icon: Icon(
                     Icons.arrow_forward_ios_outlined,
                     color: AppColor.lightIndigo,
                     size: 20,
                   ), titleWidget: Text(
                    'Lunch',
                    style:  TextStyle(
                        fontSize: 15.0, color: AppColor.headingColor2),
                  ),  iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),),
            const  TextDecoratedContainer(icon: Icon(
                     Icons.arrow_forward_ios_outlined,
                     color: AppColor.lightIndigo,
                     size: 20,
                   ), titleWidget: Text(
                       'Dinner',
                     style:  TextStyle(
                         fontSize: 15.0, color: AppColor.headingColor2),
                   ), iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),),

                  const TextDecoratedContainer(icon: Icon(
                     Icons.arrow_forward_ios_outlined,
                     color: AppColor.lightIndigo,
                     size: 20,
                   ), titleWidget:Text(
                    'Coffee Shops Clubs & Lounges',
                    style:  TextStyle(
                        fontSize: 15.0, color: AppColor.headingColor2),
                  ) , iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),),
                  const TextDecoratedContainer(icon: Icon(
                     Icons.arrow_forward_ios_outlined,
                     color: AppColor.lightIndigo,
                     size: 20,
                   ), titleWidget:Text(
                      'Market, Malls & Store',
                    style:  TextStyle(
                        fontSize: 15.0, color: AppColor.headingColor2),
                  ) , iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),),

                ],
              )),
        ),
      )),
    );
  }



/*  TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                    label:const Icon(Icons.question_mark),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColor.borderColor2, ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColor.aquaGreen, ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintText: "Summary"
                ),
              ),*/

}
