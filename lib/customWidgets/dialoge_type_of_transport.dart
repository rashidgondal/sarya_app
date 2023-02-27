import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarya/customWidgets/custom_text_field.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/theme/color_scheme.dart';

class TypeOfTransport extends StatefulWidget {
  final TextEditingController textEditingController;
  final List<String> tripList;
  final List<bool> boolList;

  const TypeOfTransport({Key? key, required this.textEditingController, required this.tripList, required this.boolList})
      : super(key: key);

  @override
  State<TypeOfTransport> createState() => _TypeOfTransportState();
}

class _TypeOfTransportState extends State<TypeOfTransport> {

  List<String> list = [];
  List<bool> boolList = [];
  TextEditingController addMoreController = TextEditingController();
  List<String> tempList = [];


  @override
  void initState() {
    list = widget.tripList.toList();
    boolList = widget.boolList.toList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          Column(
            children: [
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomTextField(
                  hintText: 'Add more',
                  size: size,
                  maxLine: 1,
                  textInputType: TextInputType.text,
                  textEditingController: addMoreController,
                  suffixIcon: IconButton(onPressed: (){
                    list.add(addMoreController.text);
                    boolList.add(true);
                    addMoreController.clear();
                    setState(() {

                    });
                  },
                    icon: Icon(
                      Icons.send_outlined,
                    ),
                  ),
                  icon:Row(children: [SvgPicture.asset("search_icon".svg)]),
                ),

              ),
              const SizedBox(height: 30,),
              Container(
                padding:const  EdgeInsets.symmetric(horizontal: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      onTap: () {
                        Navigator.of(context).pop(tempList);
                      },
                      child: Container(
                        height: 46.0,
                        width: 120.0,
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
          height: size.height / 3.0,
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
                "Type of transport",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: AppColor.lightIndigo),
              ),
              const SizedBox(
                height: 20,
              ),

              Expanded(
                child: GridView.builder(
                  itemCount: list.length,
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
                             Text(
                              "${list[index]}",
                              style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.headingColor),
                            ),
                            const Spacer(),
                            Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor:  AppColor.aquaCasper,),
                              child:Checkbox(
                                value: boolList[index],
                                onChanged: (bool? value) {
                                  if(value == null){
                                    return;
                                  }
                                  if(value == true)
                                  {
                                    tempList.add(list[index]);
                                    boolList[index] = true;
                                    setState(() {
                                    });
                                  }
                                  else{
                                    tempList.remove(list[index]);

                                    boolList[index] = false;
                                    setState(() {
                                    });
                                  }
                                },
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
