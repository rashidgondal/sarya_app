import 'dart:io';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
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
import '../model/day_design_intinerary_request.dart'as create_intenerary;

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
  double ratingData =0.0;
  String nameOfPlace ='';
  create_intenerary.Location location = create_intenerary.Location();

  @override
  void initState() {

    _configureAmplify();
    super.initState();
    _navigationService = locator<NavigationService>();
  }

  List<XFile>? selectedImages = [];
  void selectImages() async {
    List<XFile>? Images = await _picker.pickMultiImage();
    if (Images.isNotEmpty) {
      selectedImages!.addAll(Images);
    }
    createAndUploadFile(selectedImages![0]);
    print("Image List Length:" + selectedImages!.length.toString());
    setState(() {});
  }

  Future<void> _configureAmplify() async {
    var amplifyConfig = '''{"foo": "bar"}''';
    try {
      final auth = AmplifyAuthCognito();
      final storage = AmplifyStorageS3();
      await Amplify.addPlugins([auth, storage]);

      // call Amplify.configure to use the initialized categories in your app
      await Amplify.configure(amplifyConfig);
      safePrint('Amplify connig now');
    } on Exception catch (e) {
      safePrint('An error occurred configuring Amplify: $e');
    }
  }

  Future<void> createAndUploadFile(XFile file) async {
    // Create a dummy file
    const exampleString = 'sarya-assets/itinerary';
    final exampleFile = File(file.path)
      ..createSync()
      ..writeAsStringSync(exampleString);
    // Upload the file to S3
    try {
      final UploadFileResult result = await Amplify.Storage.uploadFile(
          local: exampleFile,
          key: 'AKIAUNGGSVHDAGLUFYNY',
          onProgress: (progress) {
            safePrint('Fraction completed: ${progress.getFractionCompleted()}');
          });
      safePrint('Successfully uploaded file: ${result.key}');
    } on StorageException catch (e) {
      safePrint('Error uploading file: $e');
    }
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

                    int rate = ratingData.toInt();
                    create_intenerary.Breakfast? breakfast = create_intenerary.Breakfast(
                        location: location,
                        name: nameOfPlace,
                        comments: commentController.text,
                        coupon:taxController.text,
                        images: [],
                        imagesPublic:[],
                        rating: rate

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
                        _navigationService.navigateTo(searchPlacesRoute, arguments: {"type":"", "from":"food"})!.then((value){
                          if(value != null){
                            Map map = value;
                            print("name.......${map['name']}");
                            print("locat.......${map['coordinate']}");
                            location.coordinates = map['coordinate'];
                            nameOfPlace = map['name'];
                            setState(() {

                            });
                          }
                        });
                      },
                      child: TextDecoratedContainer(
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColor.lightIndigo,
                            size: 20,
                          ),
                          titleWidget: Text(
                            nameOfPlace.isEmpty?'Search Location':nameOfPlace,
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
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 120.0,
                                      width: 120.0,
                                      child: Image.file(
                                          File(selectedImages![index].path),
                                          fit: BoxFit.fill),
                                    ),
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Transform.translate(
                                          offset: Offset(12, -12),
                                          child: IconButton(
                                              onPressed: () {
                                                selectedImages!.removeAt(index);
                                                setState(() {});
                                              },
                                              icon: Icon(Icons.cancel)),
                                        ))
                                  ],
                                ),
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
                              ratingData = rating;
                              setState(() {

                              });
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