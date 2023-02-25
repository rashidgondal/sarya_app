import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/custom_text_field.dart';
import '../../customWidgets/text_decorated_icon.dart';

class FoodAndShoppingInformation extends StatefulWidget {
  final Map map;
  const FoodAndShoppingInformation({Key? key, required this.map})
      : super(key: key);

  @override
  State<FoodAndShoppingInformation> createState() =>
      _FoodAndShoppingInformationState();
}

class _FoodAndShoppingInformationState
    extends State<FoodAndShoppingInformation> {
  late NavigationService _navigationService;
  final ImagePicker _picker = ImagePicker();
  TextEditingController taxController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();
  }

  List<XFile>? selectedImages = [];
  void selectImages() async {
    List<XFile>? Images = await _picker.pickMultiImage();
    if (Images.isNotEmpty) {
      selectedImages!.addAll(Images);
    }
    print("Image List Length:" + selectedImages!.length.toString());
    setState(() {});
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
            automaticallyImplyLeading: false,
            backgroundColor: AppColor.aquaCasper2,
            title: Text(
              widget.map['title'],
              style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
            ),
            centerTitle: true,
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
                    // _navigationService.navigateTo(draftIntineraryRoute);
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
            color: AppColor.whiteColor,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        _navigationService.navigateTo(searchPlacesRoute);
                      },
                      child: TextDecoratedContainer(
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColor.lightIndigo,
                            size: 20,
                          ),
                          titleWidget: Text(
                            'Search Location',
                            style: TextStyle(
                                fontSize: 15.0, color: AppColor.headingColor2),
                          ),
                          iconImage: Row(
                            children: [
                              SvgPicture.asset(
                                'flag-2'.svg,
                                height: 15,
                                width: 20,
                              )
                            ],
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        selectImages();
                      },
                      child: TextDecoratedContainer(
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColor.lightIndigo,
                            size: 20,
                          ),
                          titleWidget: Text(
                            'Upload Images',
                            style: TextStyle(
                                fontSize: 15.0, color: AppColor.headingColor2),
                          ),
                          iconImage: Row(
                            children: [
                              SvgPicture.asset(
                                'camera'.svg,
                                height: 15,
                                width: 20,
                              )
                            ],
                          ))),
                  Row(
                    children: [
                      Text(
                        'Select images for itinerary summary (maximum 3)',
                        style: TextStyle(
                            fontSize: 12.0, color: AppColor.headingColor2),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 270,
                    child: GridView.builder(
                        shrinkWrap: false,
                        itemCount: 6,
                        padding: const EdgeInsets.only(top: 20),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1.0,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20),
                        itemBuilder: (context, index) {
                          int legnth = selectedImages!.length;
                          if (index + 1 <= legnth) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                height: 100.0,
                                width: 100.0,
                                child: Image.file(
                                    File(selectedImages![index].path),
                                    fit: BoxFit.fill),
                                decoration: BoxDecoration(
                                    color: AppColor.aquaCasper2,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            );
                          }
                          return Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                color: AppColor.aquaCasper2,
                                borderRadius: BorderRadius.circular(8)),
                          );
                        }),
                  ),
                  CustomTextField(
                      hintText: 'promo',
                      size: size,
                      maxLine: 1,
                      textInputType: TextInputType.text,
                      textEditingController: taxController,
                      icon: Row(
                        children: [SvgPicture.asset("add_promo_icoonn".svg)],
                      )),
                  Row(
                    children: [
                      Text(
                        'How would you rate it?',
                        style: TextStyle(
                            fontSize: 14.0, color: AppColor.headingColor2),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  TextDecoratedContainer(
                      titleWidget: Row(
                        children: [
                          SizedBox(
                            width: 35,
                          ),
                          RatingBar.builder(
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: AppColor.aquaCasper,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                      iconImage: Row(
                        children: [
                          SvgPicture.asset(
                            'star_icon'.svg,
                            height: 15,
                            width: 20,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 2,
                  ),
                  CustomTextField(
                      hintText: 'Add your comment here',
                      size: size,
                      maxLine: 2,
                      textInputType: TextInputType.text,
                      textEditingController: commentController,
                      icon: Row(
                        children: [SvgPicture.asset("add_comment_icon".svg)],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
