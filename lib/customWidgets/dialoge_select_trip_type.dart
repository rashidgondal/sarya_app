import 'package:flutter/material.dart';
import 'package:sarya/customWidgets/custom_text_field.dart';
import 'package:sarya/theme/color_scheme.dart';

class SelectTripType extends StatefulWidget {
  final TextEditingController textEditingController;

  const SelectTripType({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  State<SelectTripType> createState() => _SelectTripTypeState();
}

class _SelectTripTypeState extends State<SelectTripType> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          Column(
            children: [
              const SizedBox(height: 10,),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 46.0,
                  width: size.width,
                  decoration: BoxDecoration(
                  border: Border.all(
                  color: AppColor.borderColor2, width: 1), borderRadius: BorderRadius.circular(8.0)),
                  child: const Center(
                    child: Text(
                      "Add another type",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: AppColor.colorBlack),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                padding:const  EdgeInsets.symmetric(horizontal: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();

                      },
                      child: Container(
                        height: 46.0,
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
                        height: 46.0,
                        width: 120.0,
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
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),

            ],
          )
        ],
        contentPadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        content: Container(
          width: size.width,
          height: size.height / 1.2,
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
                "Select Trip Type",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: AppColor.lightIndigo),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomTextField(
                  hintText: 'Search',
                  size: size,
                  maxLine: 1,
                  textInputType: TextInputType.text,
                  textEditingController: widget.textEditingController, icon:const  Icon(Icons.question_mark),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 44.0,
                        width: 130.0,
                        padding: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: AppColor.borderColor2, width: 1)),
                        child: Row(
                          children: [
                            const Text(
                              "Adventure",
                              style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.headingColor2),
                            ),
                            const Spacer(),
                            Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor:  AppColor.aquaCasper,),
                              child:Checkbox(
                                value: true,
                                onChanged: (bool? value) {},
                                focusColor:  AppColor.aquaCasper,
                                activeColor: AppColor.aquaCasper,

                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      mainAxisExtent: 50.0),
                ),
              ),
            ],
          ),
        ));
  }
}
