import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/customWidgets/data_loading.dart';
import 'package:sarya/settings/name/view_model/name_cubits.dart';
import 'package:sarya/settings/name/view_model/name_states.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../../helper/shared_prefs.dart';
import '../../../locator.dart';
import '../../../navigation/navigation_service.dart';
import '../model/update_name_request.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {

  TextEditingController firstTextEditingController = TextEditingController();
  TextEditingController lastTextEditingController = TextEditingController();

  String firstName ='', lastName='';
  late NavigationService _navigationService;

  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();
    getUserInfo();
  }

  getUserInfo() async {
    print("..........");
    SharedPrefs pref = SharedPrefs();

   Map map = await pref.getUser();
    firstTextEditingController.text = map['firstName'];
    lastTextEditingController.text = map['lastName'];

    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColor.whiteColor,
      child:  GestureDetector(
        onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
            child: BlocBuilder<NameCubits, NameStates>(builder: (context, state) {
          bool loading = false;

          if (state is NameInitial) {
            loading = false;
          }

          if (state is NameLoading) {
            loading = true;
          }

          if (state is NameLoaded) {
            loading = false;
          }

          return DataLoading(
            isLoading: loading,
            child: Scaffold(
              backgroundColor: AppColor.whiteColor,
              appBar: AppBar(
                elevation: 0,
                title: const Text(
                  "Name",
                  style:
                      TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
                ),
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColor.lightIndigo,
                  ),
                  onPressed: () {
                    _navigationService.goBack();
                  },
                ),
                backgroundColor: AppColor.aquaCasper2,
                toolbarHeight: 55.0,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: Container(
                    height: 50,
                    width: size.width,
                    color: AppColor.colorLiteGrey,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 40.0,
                        ),
                        Text(
                          "This is how you appear to your friends",
                          style: TextStyle(
                              fontSize: 14, color: AppColor.headingColor2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomSheet: Container(
                height: 100,
                color: AppColor.whiteColor,
                width: size.width,
                child: Center(
                  child: InkWell(
                    onTap:firstTextEditingController.text.isEmpty|| lastTextEditingController.text.isEmpty? null : (){
                      UpdateNameRequest updateNameRequest = UpdateNameRequest(
                        firstName: firstTextEditingController.text,
                        lastName: lastTextEditingController.text
                      );

                      context.read<NameCubits>().updateName(
                          updateNameRequest:updateNameRequest, navigationService: _navigationService,

                         );
                    },
                    child: Container(
                      height: 46.0,
                      width: 200.0,
                      decoration:  BoxDecoration(
                          color: firstTextEditingController.text.isEmpty|| lastTextEditingController.text.isEmpty? AppColor.colorLiteGrey:AppColor.aquaGreen,
                          borderRadius: BorderRadius.circular(8.0)),
                      child:  Center(
                        child: Text(
                          "Save",
                          style:
                              TextStyle(fontSize: 15.0, color: firstTextEditingController.text.isEmpty|| firstTextEditingController.text.isEmpty? AppColor.headingColor2 : AppColor.whiteColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          height: 50.0,
                          width: size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: AppColor.borderColor2, width: 1)),
                          child: TextFormField(
                            controller: firstTextEditingController,
                            onChanged: (v){
                              setState(() {
                                firstName = v;
                              });
                            },
                            style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColor.lightIndigo,
                                fontWeight: FontWeight.w500),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "First Name",
                                fillColor: AppColor.colorGrey,
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(
                                    fontSize: 13.0,
                                    color: AppColor.colorGrey,
                                    fontWeight: FontWeight.w500)),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          height: 50.0,
                          width: size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: AppColor.borderColor2, width: 1)),
                          child: TextFormField(
                            controller: lastTextEditingController,

                            onChanged: (v){
                              setState(() {
                                lastName = v;
                              });
                            },
                            style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColor.lightIndigo,
                                fontWeight: FontWeight.w500),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Last Name",
                                fillColor: AppColor.colorGrey,
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(
                                    fontSize: 13.0,
                                    color: AppColor.colorGrey,
                                    fontWeight: FontWeight.w500)),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );
        })),
      ),
    );
  }
}
