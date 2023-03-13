import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minio/minio.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:places_api/places_api.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/search_places/SearchPlacesMap.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/custom_text_field.dart';
import '../../customWidgets/text_decorated_icon.dart';
import '../model/day_design_intinerary_request.dart' as create_intenerary;

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
  TextEditingController promoController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  double ratingData = 0.0;
  String nameOfPlace = '';
  create_intenerary.Location location = create_intenerary.Location();

  List<ListOfFilesModel>? selected_public_Images = [];
  List<ListOfFilesModel>? selectedImages = [];

  List<String> public_Image_Path = [];
  List<String> selected_Image_Path = [];

  List<String> public_Image_Names = [];
  List<String> selected_Image_Names = [];

  @override
  void initState() {
    promoController.text =   widget.map['promo'];
    commentController.text =   widget.map['comment'];
    ratingData =   widget.map['rate'] +0.0;
    nameOfPlace = widget.map['name'];
    location.coordinates = widget.map['coordinate'];
    public_Image_Path = widget.map['public_image_path'];
    selected_Image_Path = widget.map['selected_image_path'];


    public_Image_Names = widget.map['selected_image_names'];
    selected_Image_Names = widget.map['selected_image_names'];

    public_Image_Path.forEach((element) {
      int index = public_Image_Path.indexOf(element);
      selected_public_Images!.add(ListOfFilesModel(name_of_file:public_Image_Names[index], percentage: 1.0, file: File(element)));
    });

    selected_Image_Path.forEach((element) {
      int index = selected_Image_Path.indexOf(element);
      selectedImages!.add(ListOfFilesModel(name_of_file:selected_Image_Names[index], percentage: 1.0, file: File(element)));

    });


    super.initState();
    _navigationService = locator<NavigationService>();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: AppColor.colorBlack,
      child: SafeArea(
        child:  GestureDetector(
          onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
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
                  _buildDone()                ],
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
                        onTap: () async{

                          await showCupertinoModalBottomSheet(
                          expand: true,
                          useRootNavigator: true,
                          context: context,
                          builder: (modalContext) =>
                              PlacesSearchModal(
                                passedContext: context,
                                modalContext: modalContext,
                                title: widget.map['title'],
                                signleSearch: true,
                                onPlaceSelected: (List<Place>? places) {
                                  if (places != null) {

                                    location.coordinates = [places[0].geometry.location.lng,places![0].geometry.location.lat];
                                    nameOfPlace = places![0].name;
                                    setState(() {

                                    });

                                  }
                                },
                              ),
                          ).then((value) {

                          });

                        },
                        child: TextDecoratedContainer(
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: AppColor.lightIndigo,
                              size: 20,
                            ),
                            titleWidget: Text(
                              nameOfPlace.isEmpty
                                  ? 'Search Location'
                                  : nameOfPlace,
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
                    AnimatedContainer(
                      duration: Duration(microseconds: 500),
                      height:selectedImages == null || selectedImages!.isEmpty? 10:270,
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
                              return InkWell(
                                onTap: () {
                                  print('Click');
                                  if (selected_public_Images!
                                      .contains(selectedImages![index])) {
                                    selected_public_Images!
                                        .remove(selectedImages![index]);
                                  } else {
                                    selected_public_Images!
                                        .add(selectedImages![index]);
                                  }
                                  setState(() {});
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    height: 100.0,
                                    width: 100.0,
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 120.0,
                                          width: 120.0,
                                          child: Image.file(
                                              File(selectedImages![index]
                                                  .file!
                                                  .path),
                                              fit: BoxFit.fill),
                                        ),
                                        Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Transform.translate(
                                              offset: Offset(12, -12),
                                              child: IconButton(
                                                  onPressed: () {
                                                    DeleteFile(
                                                        selectedImages![index]);
                                                    selectedImages!
                                                        .removeAt(index);
                                                    setState(() {});
                                                  },
                                                  icon: Icon(Icons.cancel)),
                                            )),
                                        Visibility(
                                          visible: (selectedImages![index]
                                                          .percentage! *
                                                      100)
                                                  .toInt() !=
                                              100,
                                          child: Center(
                                            child: CircularPercentIndicator(
                                              radius: 25.0,
                                              lineWidth: 4.0,
                                              percent: selectedImages![index]
                                                  .percentage!,
                                              center: Text(
                                                  (selectedImages![index]
                                                                  .percentage! *
                                                              100)
                                                          .toInt()
                                                          .toString() +
                                                      '%',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.green)),
                                              progressColor: Color(0xFF5e59ed),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        border: selected_public_Images!
                                                .contains(selectedImages![index])
                                            ? Border.all(
                                                width: 4,
                                                color: Color(0xFF00d18c))
                                            : Border.all(
                                                width: 0,
                                                color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                ),
                              );
                            }
                            return Container(
                              height: 100.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                            );
                          }),
                    ),
                    CustomTextField(
                        hintText: 'promo',
                        size: size,
                        maxLine: 1,
                        textInputType: TextInputType.text,
                        textEditingController: promoController,
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
                              initialRating: ratingData,
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
                                ratingData = rating;
                                setState(() {});
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
                        maxLine: 5,
                        textInputAction: TextInputAction.newline,
                        textInputType: TextInputType.multiline,
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
      ),
    );
  }


  _buildDone(){
    if(
        selected_public_Images == null ||
        selectedImages == null ||
        promoController.text.isEmpty ||
        commentController.text.isEmpty ||
        ratingData == 0.0 ||
            nameOfPlace == ''


    ) {
      return Container(
        height: 46.0,
        width: 150.0,
        decoration: BoxDecoration(
            color: AppColor.colorLiteBlack4,
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
      );
    }

    return InkWell(
      onTap: () {
        List<String> publicImageName = [];
        List<String> imageName = [];
        List<String> publicImagePath = [];
        List<String> selectedImagePath = [];

        selected_public_Images!.forEach((element) {
          publicImageName.add(element.name_of_file!);
          publicImagePath.add(element.file!.path);
        });

        selectedImages!.forEach((element) {
          imageName.add(element.name_of_file!);
          selectedImagePath.add(element.file!.path);

        });

        int rate = ratingData.toInt();
        create_intenerary.Breakfast? breakfast =
        create_intenerary.Breakfast(
            location: location,
            name: nameOfPlace,
            comments: commentController.text,
            coupon: promoController.text,
            images: imageName,
            imagesPublic: publicImageName,
            rating: rate,
            imagesPublicPath: publicImagePath,
            imagesSelectPath: selectedImagePath
        );

        _navigationService.goBack(value: breakfast);
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
    );

  }


  void selectImages() async {
    List<XFile>? Images = await _picker.pickMultiImage();
    Images.forEach((element) {
      ListOfFilesModel model = ListOfFilesModel(
          file: File(element.path),
          percentage: 0.0,
          name_of_file:
          '${DateTime.now().toUtc().millisecondsSinceEpoch}${element.name}');
      selectedImages!.add(model);
      UploadFile(model);
    });
    print("Image List Length:" + selectedImages!.length.toString());
    setState(() {});
  }

  UploadFile(ListOfFilesModel file_model) async {
    int index = selectedImages!.indexOf(file_model);
    final minio = Minio(
        endPoint: 's3.me-south-1.amazonaws.com',
        accessKey: 'AKIAUNGGSVHDAGLUFYNY',
        secretKey: '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',
        region: 'me-south-1');
    // String result =
    //     await minio.fPutObject('testingsarya', '${file.name}', '${file.path}');
    Uint8List bytes = File(file_model.file!.path).readAsBytesSync();
    print(bytes.length);
    String result = await minio.putObject(
      'sarya-assets',
      'itinerary/${file_model.name_of_file}',
      Stream<Uint8List>.value(bytes),
      onProgress: (result) {
        selectedImages![index].percentage = result / bytes.length;
        setState(() {});
      },
    );
    print('result......$result');
  }

  DeleteFile(ListOfFilesModel model) async {
    final minio = Minio(
        endPoint: 's3.me-south-1.amazonaws.com',
        accessKey: 'AKIAUNGGSVHDAGLUFYNY',
        secretKey: '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',
        region: 'me-south-1');
    await minio.removeObject('sarya-assets', 'itinerary/${model.name_of_file}');
    print('Delete file');
  }

}

class ListOfFilesModel {
  File? file;
  double? percentage;
  String? name_of_file;
  ListOfFilesModel({this.file, this.percentage = 0.0, this.name_of_file});
}
