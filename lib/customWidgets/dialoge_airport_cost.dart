import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/Airport_states.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../create_intinerary/intinerary_view_model/airport_cubits.dart';
import 'custom_text_field.dart';

class AirportSelection extends StatefulWidget {
  const AirportSelection({Key? key})
      : super(key: key);

  @override
  State<AirportSelection> createState() => _AirportSelectionState();
}

class _AirportSelectionState extends State<AirportSelection> {

  final TextEditingController textEditingController = TextEditingController();

  String selectedAirport = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          const SizedBox(height: 10,),
          Container(
            padding:const  EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 40.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        color: AppColor.colorLiteBlack4,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: AppColor.colorBlack),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,)
        ],
        contentPadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        content: Container(
          width: size.width,
          height: size.height / 3.5,
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Airport code",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: AppColor.lightIndigo),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: CustomTextField(
                  hintText: 'Search',
                  size: size,
                  maxLine: 1,
                  onChange: (v){
                    if(v.isEmpty){
                      return;
                    }
                    context.read<AirportCubits>().getAirport(searchKey: v);
                    setState(() {

                    });
                  },
                  textInputType: TextInputType.text,
                  textEditingController: textEditingController,
                  icon: Row(children: [SvgPicture.asset('search_icon'.svg)],),
                ),
              ),
              Expanded(
                child: BlocBuilder<AirportCubits, AirportStates>(
                    builder: (context, state) {

                      if (state is AirportInitial) {
                        return SizedBox();
                      }

                      if (state is AirportLoading) {
                        Center(child: CupertinoActivityIndicator());
                      }

                      if (state is AirportLoaded) {
                        var list = state.airportResponse;
                        List<bool> listOfBool = state.listOfBool;
                        return   ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) =>  Container(
                            height: 44.0,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: const BoxDecoration(
                              color: AppColor.whiteColor,
                            ),
                            child: InkWell(
                              onTap: (){
                                selectedAirport = list[index]["name"];
                                Navigator.of(context).pop(selectedAirport);
                              },
                              child: Text(
                                "${list[index]["name"]}",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.headingColor),
                              ),
                            )

                          ),

                        );
                      }

                      return Center(child: Text("data not found"),);
                    }

                )),




            ],
          ),
        ));
  }
}