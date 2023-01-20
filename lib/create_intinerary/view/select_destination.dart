import 'package:flutter/material.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../locator.dart';
import '../../navigation/navigation_service.dart';
import '../../navigation/router_path.dart';

class SelectDestination extends StatefulWidget {
  const SelectDestination({Key? key}) : super(key: key);

  @override
  State<SelectDestination> createState() => _SelectDestinationState();
}

class _SelectDestinationState extends State<SelectDestination> {

  late NavigationService _navigationService;
  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();

  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
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
          onPressed: () {},
        ),
        backgroundColor: AppColor.aquaCasper2,
        title: const Text(
          "Select Destination",
          style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
        ),
        centerTitle: true,
      ),
          bottomNavigationBar: Container(
        height: 100.0,
        color: AppColor.whiteColor,
        child: Center(
          child: InkWell(
            onTap: () {
              _navigationService.navigateTo(designIntineraryRoute);
            },
            child: Container(
              height: 46.0,
              width: 200.0,
              decoration: BoxDecoration(
                  color: AppColor.buttonColor,
                  borderRadius: BorderRadius.circular(8.0)),
              child: const Center(
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
                ),
              ),
            ),
          ),
        ),
      ),
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColor.colorGrey,
            padding: const EdgeInsets.only(top: 1),
            child: Container(
              height: size.height * 0.250,
              color: AppColor.aquaCasper2,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Container(
                  height: 50.0,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: AppColor.bgColor,
                      border:
                          Border.all(color: AppColor.borderColor2, width: 1),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search Destination",
                        hintStyle: TextStyle(
                            fontSize: 15.0, color: AppColor.headingColor2)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 11,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Container(
                            height: 55.0,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.borderColor2, width: 1),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: CheckboxListTile(
                              contentPadding: EdgeInsets.zero,
                              value: true,
                              onChanged: (bool? value) {},
                              secondary: Container(
                                height: 24.0,
                                width: 24.0,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.colorGrey),
                              ),
                              title: const Text(
                                "Dubai",
                                style: TextStyle(
                                    fontSize: 17.0,
                                    color: AppColor.colorLiteBlack5),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          )),
        ],
      ),
    ));
  }
}
