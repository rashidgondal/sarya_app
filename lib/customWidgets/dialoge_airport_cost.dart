import 'package:flutter/material.dart';
import 'package:sarya/theme/color_scheme.dart';

import 'custom_text_field.dart';

class AirportSelection extends StatefulWidget {
  final TextEditingController textEditingController;

  const AirportSelection({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  State<AirportSelection> createState() => _AirportSelectionState();
}

class _AirportSelectionState extends State<AirportSelection> {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text(
                        "OK",
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
          const SizedBox(height: 10,)

        ],
        contentPadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        content: Container(
          width: size.width,
          height: size.height / 4.5,
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
                  textInputType: TextInputType.text,
                  textEditingController: widget.textEditingController, icon:const  Icon(Icons.question_mark),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 2,

                  itemBuilder: (context, index) =>  Container(
                    height: 44.0,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: AppColor.whiteColor,
                    ),
                    child: Row(
                      children: [
                       const Icon(Icons.airplanemode_active_outlined, color: AppColor.colorBlue,),
                        const SizedBox(width: 10,),
                        const Text(
                          "Dubai Internation airport",
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: AppColor.headingColor),
                        ),
                        const Spacer(),
                        Checkbox(
                          value: true,

                          onChanged: (bool? value) {},
                        )
                      ],
                    ),
                  ),

                ),
              ),
            ],
          ),
        ));
  }
}