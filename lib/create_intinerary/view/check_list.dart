import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/custom_text_field.dart';
import '../intinerary_view_model/CheckList_states.dart';
import '../intinerary_view_model/checklist_cubits.dart';

class CheckListScreen extends StatefulWidget {
  final Map map;
  CheckListScreen({Key? key, required this.map}) : super(key: key);

  @override
  State<CheckListScreen> createState() => _CheckListScreenState();
}

class _CheckListScreenState extends State<CheckListScreen> {
  late NavigationService _navigationService;
  List<String> listOfCheckList = [];
  List<bool> listOfBool = [];
  TextEditingController addMoreController = TextEditingController();
  List<String> selectedCheckList = [];
  List<String> preSelectedCheckList = [];
  List<String> tempCheckList = [];

  @override
  void initState() {
    listOfBool = widget.map['listOfBool'];
    listOfCheckList = widget.map['checklist'];

      preSelectedCheckList = widget.map['selectedCheckList'];
      Future.delayed(Duration(microseconds: 500), () {
        listOfCheckList.forEach((element) {
          if (preSelectedCheckList.contains(element)) {
            int index = listOfCheckList.indexOf(element);
            listOfBool[index] = true;
            selectedCheckList.add(element);
            setState(() {

            });
          }
        });
      });

    super.initState();
    _navigationService = locator<NavigationService>();
  }

  @override
  void dispose() {
    listOfBool.clear();
    listOfCheckList.clear();
    super.dispose();
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
            title:  Text(
              "${widget.map['title']}",
              style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
            ),
            centerTitle: true,
          ),
          bottomNavigationBar:widget.map['bool']?null :Container(
            height: 90,
            color: AppColor.whiteColor,
            child: Column(
              children: [

                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        SharedPrefs pref = SharedPrefs();
                        pref.saveTempCheckList(tempCheckList);
                        _navigationService.goBack(value: selectedCheckList);
                      },
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
                  ],
                ),
                SizedBox(height: 10,)
              ],
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: listOfCheckList.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                          height: 44.0,
                          width: 160.0,
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColor.borderColor2, width: 1)),
                          child: Row(
                            children: [
                              Text(
                                "${listOfCheckList[index]}",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.headingColor),
                              ),
                              const Spacer(),
                              Theme(
                                data: Theme.of(context).copyWith(
                                    unselectedWidgetColor:
                                    AppColor.aquaCasper),
                                child: IgnorePointer(
                                  ignoring: widget.map['bool'],
                                  child: Checkbox(
                                    value: listOfBool[index],
                                    onChanged: (bool? value) {
                                      if(value == null){
                                        return;
                                      }
                                      if(value == true){
                                        selectedCheckList.add(listOfCheckList[index]);
                                        listOfBool[index] = true;
                                        setState(() {

                                        });
                                      }else{
                                        selectedCheckList.remove(listOfCheckList[index]);

                                        listOfBool[index] = false;
                                        setState(() {

                                        });
                                      }

                                    },
                                    focusColor: AppColor.aquaCasper,
                                    activeColor: AppColor.aquaCasper,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 20.0,
                        mainAxisExtent: 50.0),
                  ),
                ),
                widget.map['bool']?SizedBox.shrink(): Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomTextField(
                    hintText: 'Add more',
                    size: size,
                    maxLine: 1,
                    textInputType: TextInputType.text,
                    textEditingController: addMoreController,
                    suffixIcon: IconButton(onPressed: (){
                      listOfCheckList.add(addMoreController.text);
                      listOfBool.add(true);
                      selectedCheckList.add(addMoreController.text);
                      tempCheckList.add(addMoreController.text);
                      addMoreController.clear();
                      setState(() {

                      });
                    },
                      icon: Icon(
                        Icons.send_outlined,
                      ),
                    ),
                  ),

                ),
              ],
            ),
          )


        ),
      ),
    );
  }
}
