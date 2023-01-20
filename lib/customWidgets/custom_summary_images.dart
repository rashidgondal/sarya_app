import 'package:flutter/material.dart';
import 'package:sarya/customWidgets/custom_text_field.dart';
import 'package:sarya/customWidgets/text_decorated_icon.dart';
import 'package:sarya/theme/color_scheme.dart';

class CustomSummaryImages extends StatefulWidget {
  final String title;
  const CustomSummaryImages({Key? key, required this.title}) : super(key: key);

  @override
  State<CustomSummaryImages> createState() => _CustomSummaryImagesState();
}

class _CustomSummaryImagesState extends State<CustomSummaryImages> {

  TextEditingController textEditingController = TextEditingController();

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
            title:  Text(
              widget.title,
              style: const TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
            ),
            centerTitle: true,
          ),
          bottomSheet: Container(
            height: 100,
            color: AppColor.whiteColor,
            child: Center(
              child:  InkWell(
                onTap: () {},
                child: Container(
                  height: 46.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      color: AppColor.buttonColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Center(
                    child: Text(
                      "Done",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: AppColor.whiteColor),
                    ),
                  ),
                ),
              ),

            ),

          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              physics:const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  const TextDecoratedContainer(icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColor.lightIndigo,
                    size: 20,
                  ), titleWidget: Text(
                    'Search Location',
                    style:  TextStyle(
                        fontSize: 15.0, color: AppColor.headingColor2),
                  ) , iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),),
                  Container(
                    height: 24.0,
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
                              color: AppColor.headingColor2),
                        ),
                        const Spacer(),
                        Checkbox(
                          value: true,

                          onChanged: (bool? value) {},
                        )
                      ],
                    ),
                  ),
                  const TextDecoratedContainer(
                  titleWidget:  Text(
                    'Upload Images',
                    style:  TextStyle(
                        fontSize: 15.0, color: AppColor.headingColor2),
                  ) , iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child:  Text(
                      "Select images for itinerary summary (maximum 3)",
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                          color: AppColor.headingColor2),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                     height: 220,
                     child: GridView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      physics:const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 98.0,
                            width: 98.0,
                            padding: const EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                                color: AppColor.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColor.borderColor2, width: 1)),

                          ),
                        ],
                      ),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 1.0,
                          crossAxisSpacing: 1.0,
                        ),
                  ),
                   ),
                  const SizedBox(height: 10,),
                  const TextDecoratedContainer(titleWidget:Text(
                    'ed7G7-30%',
                    style:  TextStyle(
                        fontSize: 15.0, color: AppColor.headingColor2),
                  ), iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),),
                  const SizedBox(height: 2,),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child:  Text(
                      'How would you rate it?',
                      style:  TextStyle(
                          fontSize: 15.0, color: AppColor.headingColor2),
                    ),
                  ) ,
                  const TextDecoratedContainer(titleWidget: Text(
                    'ed7G7-30%',
                    style:  TextStyle(
                        fontSize: 15.0, color: AppColor.headingColor2),
                  ) , iconImage: Icon(Icons.question_mark ,color: AppColor.colorBlack,size: 15.0,),),
                  const SizedBox(height: 10,),
                  CustomTextField(maxLine: 3, textEditingController: textEditingController, size: size, textInputType: TextInputType.text, hintText: 'Add your comment here.', icon:const Icon(Icons.question_mark),)
                  ,const SizedBox(height: 120,),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
