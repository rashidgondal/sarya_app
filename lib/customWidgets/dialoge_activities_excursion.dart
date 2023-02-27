import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarya/customWidgets/custom_text_field.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/theme/color_scheme.dart';

class ActivitiesExcursion extends StatefulWidget {
  final List<String> listOfActivity;
  final List<bool> listOfBool;

  const ActivitiesExcursion({Key? key,
                required this.listOfActivity,
                required this.listOfBool})
      : super(key: key);

  @override
  State<ActivitiesExcursion> createState() => _ActivitiesExcursionState();
}

class _ActivitiesExcursionState extends State<ActivitiesExcursion> {

  List<String> list = [];
  List<bool> boolList = [];
  TextEditingController addMoreController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  String search = '';

  List<String> tempList = [];

  @override
  void initState() {
    list = widget.listOfActivity.toList();
    boolList = widget.listOfBool.toList();
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
                "Activities and Excursion",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: AppColor.lightIndigo),
              ),
              const SizedBox(
                height: 20,
              ),
               Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: CustomTextField(
                    hintText: 'Search',
                    size: size,
                    maxLine: 1,
                    onChange: (v){
                      search = v;
                      setState(() {
                      });
                    },textInputType: TextInputType.text,
                    textEditingController: searchController,
                    icon: Row(children: [SvgPicture.asset('search_icon'.svg)],),
                  ),
                ),),
              Padding(
                padding: const  EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: const[
                     Text(
                      "Types of Activity/Excursion",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: AppColor.headingColor2),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: widget.listOfActivity.length,
                  itemBuilder: (context, index) {
                    if(search.isNotEmpty && !list[index].toString().toLowerCase().contains(search.toLowerCase())){
                      return SizedBox();
                    }
                    return Row(
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
                              "${widget.listOfActivity[index]}",
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
                                value: widget.listOfBool[index],
                                onChanged: (bool? value) {
                                  if(value == null){
                                    return;
                                  }
                                  if(value == true){
                                    widget.listOfBool[index] = true;
                                    setState(() {

                                    });
                                  }else{
                                    widget.listOfBool[index] = false;
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
                  );
                    },
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
