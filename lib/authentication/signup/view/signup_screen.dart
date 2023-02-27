import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sarya/authentication/signup/model/signup_request.dart';
import 'package:sarya/authentication/signup/signup_view_model/signup_cubits.dart';
import 'package:sarya/authentication/signup/signup_view_model/signup_states.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../../customWidgets/custom_country_picker.dart';
import '../../../helper/helper_methods.dart';
import '../../../navigation/navigation_service.dart';
import '../signup_widget/bottom_sheet_country_picker.dart';

class SignupScreen extends StatefulWidget {
  final List countries;
  const SignupScreen({Key? key, required this.countries}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  DateTime dateIos = DateTime(2016, 10, 26);

  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailNameController = TextEditingController();
  TextEditingController passwordNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController hobbyController = TextEditingController();
  TextEditingController favCountryController = TextEditingController();
  TextEditingController tellMoreController = TextEditingController();

  TextEditingController bankNameController = TextEditingController();
  TextEditingController beneficiaryController = TextEditingController();
  TextEditingController accountNoController = TextEditingController();
  TextEditingController ibanNoController = TextEditingController();
  TextEditingController swiftCodeNoController = TextEditingController();

  late NavigationService _navigationService;
  List<Widget> list = [];
  List<Widget> listImage = [
    SvgPicture.asset('signup_logo'.svg),
    SvgPicture.asset('signup_logo_2'.svg),
    SvgPicture.asset('signup_logo_3'.svg),
    SvgPicture.asset('signup_completed'.svg),
  ];

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();

  List listGender = ["Male", 'Female'];
  String? selectedGender;
  String dob = '', telCode = '', nationality = '', _cor = '', bankCountry = '';

  ValueNotifier<String> dateValueNotifier = ValueNotifier('');
  ValueNotifier<String> genderNotifier = ValueNotifier('');
  ValueNotifier<String> countriesNotifier = ValueNotifier('');
  ValueNotifier<String> nationalityNotifier = ValueNotifier('');
  ValueNotifier<String> bankCountryNotifier = ValueNotifier('');
  ValueNotifier<String> telCodeNotifier = ValueNotifier('');
  ValueNotifier<bool> showPasswordNotifier = ValueNotifier(true);

  ValueNotifier<String> corNotifier = ValueNotifier('');

  String? selectedCountry;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      total_width = total_width + 80;
      setState(() {});
    });
    _navigationService = locator<NavigationService>();
  }

  DateTime selectedDate = DateTime.now();

  ValueNotifier<int> valueNotifier = ValueNotifier(0);
  double total_width = -150.0;
  int? current_position;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 50,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColor.lightIndigo,
              ),
              onPressed: () {
                if (current_position != 0) {
                  total_width = total_width - 40;
                  setState(() {});
                  _pageController.animateToPage(current_position! - 1,
                      curve: Curves.decelerate,
                      duration: const Duration(milliseconds: 300));
                  setState(() {});
                } else {
                  _navigationService.goBack();
                }
              },
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: const Text(
              "Sign Up",
              style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
            ),
            centerTitle: true,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(170),
                child: SizedBox(
                  height: 170.0,
                  width: size.width,
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    height: 170.0,
                    width: size.width,
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 500),
                          child: Container(
                            width: size.width,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: SvgPicture.asset('Signup_Stars'.svg),
                          ),
                          top: 0,
                          right: 20,
                        ),
                        Positioned(
                          child: Container(
                            height: 5,
                            width: size.width,
                            color: Color(0xff5E59ED),
                          ),
                          bottom: 10,
                        ),
                        if (total_width >= 90.0)
                          Positioned(
                            child: FadeInUp(
                              child: Container(
                                height: 70,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: SvgPicture.asset('last_star'.svg),
                              ),
                            ),
                            right: 5,
                            bottom: 70,
                          ),
                        if (total_width >= 90.0)
                          Positioned(
                            child: FadeInUp(
                              child: Container(
                                height: 70,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: SvgPicture.asset('slash'.svg),
                              ),
                            ),
                            left: 25,
                            bottom: 40,
                          ),
                        if (total_width >= 90.0)
                          Positioned(
                            child: FadeInUp(
                              child: Container(
                                height: 70,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: SvgPicture.asset('flag'.svg),
                              ),
                            ),
                            right: 5,
                            bottom: 20,
                          ),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          left: total_width,
                          bottom: 20,
                          child: Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: SvgPicture.asset('turtle'.svg),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
          bottomNavigationBar: BlocBuilder<SignupCubits, SignupStates>(
            builder: (context, state) {
              return SizedBox(
                height: 120,
                child: ValueListenableBuilder(
                    valueListenable: valueNotifier,
                    builder: (BuildContext context, int value, Widget? child) {
                      print("value.................$value");
                      current_position = value;
                      if (value == 3) {}
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 9.0,
                                width: 9.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: value == 0
                                        ? AppColor.lightIndigo
                                        : AppColor.fogColor),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 9.0,
                                width: 9.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: value == 1
                                        ? AppColor.lightIndigo
                                        : AppColor.fogColor),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 9.0,
                                width: 9.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: value == 2
                                        ? AppColor.lightIndigo
                                        : AppColor.fogColor),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 9.0,
                                width: 9.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: value == 3
                                        ? AppColor.lightIndigo
                                        : AppColor.fogColor),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 9.0,
                                width: 9.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: value == 4
                                        ? AppColor.lightIndigo
                                        : AppColor.fogColor),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          _buildButton(index: value),
                        ],
                      );
                    }),
              );
            },
          ),
          body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: PageView(
                controller: _pageController,
                onPageChanged: (v) {
                  print("v..................$v");
                  valueNotifier.value = v;
                  if (valueNotifier.value == 3) {
                    setState(() {});
                  }
                },
                children: [
                  Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Tell us a little bit about yourself",
                            style: TextStyle(
                                fontSize: 15,
                                color: AppColor.colorBlue,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: userNameController,
                            onChanged: (v) {
                              valueNotifier.value = 0;

                              setState(() {});
                            },
                            style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColor.lightIndigo,
                                fontWeight: FontWeight.w500),
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.lightIndigo),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.lightIndigo),
                                ),
                                hintText: "Username",
                                fillColor: AppColor.aquaCasper,
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    color: AppColor.colorGrey,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            child: TextFormField(
                              controller: firstNameController,
                              onChanged: (v) {
                                valueNotifier.value = 0;
                                setState(() {});
                              },
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  color: AppColor.lightIndigo,
                                  fontWeight: FontWeight.w500),
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColor.lightIndigo),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColor.lightIndigo),
                                  ),
                                  hintText: "First Name",
                                  fillColor: AppColor.aquaCasper,
                                  contentPadding: EdgeInsets.zero,
                                  hintStyle: TextStyle(
                                      fontSize: 14.0,
                                      color: AppColor.colorGrey,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: lastNameController,
                            onChanged: (v) {
                              valueNotifier.value = 0;
                              setState(() {});
                            },
                            style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColor.lightIndigo,
                                fontWeight: FontWeight.w500),
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.lightIndigo),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.lightIndigo),
                                ),
                                hintText: "Last Name",
                                fillColor: AppColor.aquaCasper,
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    color: AppColor.colorGrey,
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: size.width / 5,
                          ),
                          const Text(
                            "Fields marked with (*) are mandatory.",
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColor.aquaGreen,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey2,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "a few more things",
                            style: TextStyle(
                                fontSize: 15,
                                color: AppColor.colorBlue,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ValueListenableBuilder(
                              valueListenable: genderNotifier,
                              builder: (BuildContext context, String value,
                                  Widget? child) {
                                if (value.isEmpty) {
                                  return CustomCountryPicker(
                                    value: selectedGender,
                                    hint: 'Gender',
                                    items: listGender
                                        .map((value) => DropdownMenuItem(
                                              value: value,
                                              child: SizedBox(
                                                width: MediaQuery.of(locator<
                                                                NavigationService>()
                                                            .navigatorKey
                                                            .currentContext!)
                                                        .size
                                                        .width /
                                                    1.2,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      value,
                                                      style: const TextStyle(
                                                          fontSize: 14.0,
                                                          color: AppColor
                                                              .lightIndigo,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    onItemChanged: (v) {
                                      genderNotifier.value = v;
                                      selectedGender = v;
                                    },
                                    errorText: '',
                                  );
                                }

                                return CustomCountryPicker(
                                  value: selectedGender,
                                  hint: 'Gender',
                                  items: listGender
                                      .map((value) => DropdownMenuItem(
                                            value: value,
                                            child: SizedBox(
                                              width: MediaQuery.of(locator<
                                                              NavigationService>()
                                                          .navigatorKey
                                                          .currentContext!)
                                                      .size
                                                      .width /
                                                  1.2,
                                              child: Row(
                                                children: [
                                                  const SizedBox(width: 20),
                                                  Text(
                                                    value,
                                                    style: const TextStyle(
                                                        fontSize: 14.0,
                                                        color: AppColor
                                                            .lightIndigo,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            onTap: () {},
                                          ))
                                      .toList(),
                                  onItemChanged: (v) {
                                    genderNotifier.value = v;
                                    selectedGender = v;
                                  },
                                  errorText: '',
                                );
                              }),
                          Container(
                            height: 1,
                            color: AppColor.lightIndigo,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ValueListenableBuilder(
                              valueListenable: dateValueNotifier,
                              builder: (BuildContext context, String value,
                                  Widget? child) {
                                if (value.isEmpty) {
                                  return Align(
                                    alignment: Alignment.centerLeft,
                                    child: InkWell(
                                      onTap: () => _showDialog(
                                        CupertinoDatePicker(
                                          initialDateTime: dateIos,
                                          mode: CupertinoDatePickerMode.date,
                                          use24hFormat: true,
                                          // This is called when the user changes the date.
                                          onDateTimeChanged:
                                              (DateTime newDate) {
                                            String d = newDate.toString();
                                            var splitDate = d.split(" ");
                                            dateValueNotifier.value =
                                                splitDate[0];
                                            dob = splitDate[0];
                                          },
                                        ),
                                      ),
                                      child: SizedBox(
                                        height: 20,
                                        child: Text(
                                          "Birthdate  $value",
                                          style: const TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.colorGrey,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: InkWell(
                                    onTap: () => _showDialog(
                                      CupertinoDatePicker(
                                        initialDateTime: dateIos,
                                        mode: CupertinoDatePickerMode.date,
                                        use24hFormat: true,
                                        // This is called when the user changes the date.
                                        onDateTimeChanged: (DateTime newDate) {
                                          String d = newDate.toString();
                                          var splitDate = d.split(" ");
                                          dateValueNotifier.value =
                                              splitDate[0];
                                          dob = splitDate[0];
                                        },
                                      ),
                                    ),
                                    child: SizedBox(
                                      height: 20,
                                      child: Text(
                                        "$value",
                                        style: const TextStyle(
                                            fontSize: 15.0,
                                            color: AppColor.lightIndigo,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 1,
                            color: AppColor.lightIndigo,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                              height: 50.0,
                              child: ValueListenableBuilder(
                                  valueListenable: nationalityNotifier,
                                  builder: (BuildContext context, String value,
                                      Widget? child) {
                                    if (value.isEmpty) {
                                      return InkWell(
                                        onTap: () {
                                          showMaterialModalBottomSheet(
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) => Container(
                                                color: Colors.white,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: BottomSheetCountryPicker(
                                                  countries: widget.countries,
                                                  countryName: (v) {},
                                                  countryTel: (v) {},
                                                  nationality: (v) {
                                                    nationalityNotifier.value =
                                                        v;
                                                    nationality = v;
                                                  },
                                                )),
                                          ).then((value) {
                                            setState(() {});
                                          });
                                        },
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 16.0),
                                            child: Row(
                                              children: const [
                                                Text(
                                                  "Nationality",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: AppColor.colorGrey,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Spacer(),
                                                Icon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                  color: AppColor.headingColor2,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    return InkWell(
                                      onTap: () {
                                        showMaterialModalBottomSheet(
                                          context: context,
                                          backgroundColor: Colors.transparent,
                                          builder: (context) => Container(
                                              color: Colors.white,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.2,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: BottomSheetCountryPicker(
                                                countries: widget.countries,
                                                countryName: (v) {},
                                                countryTel: (v) {},
                                                nationality: (v) {
                                                  nationalityNotifier.value = v;
                                                  nationality = v;
                                                },
                                              )),
                                        ).then((value) {
                                          setState(() {});
                                        });
                                      },
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 16.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                nationality,
                                                style: const TextStyle(
                                                    fontSize: 14.0,
                                                    color: AppColor.lightIndigo,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const Spacer(),
                                              const Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                                color: AppColor.lightIndigo,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                          Container(
                            height: 1,
                            color: AppColor.lightIndigo,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                              height: 50.0,
                              child: ValueListenableBuilder(
                                  valueListenable: corNotifier,
                                  builder: (BuildContext context, String value,
                                      Widget? child) {
                                    if (value.isEmpty) {
                                      return InkWell(
                                        onTap: () {
                                          showMaterialModalBottomSheet(
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) => Container(
                                                color: Colors.white,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: BottomSheetCountryPicker(
                                                  countries: widget.countries,
                                                  countryName: (v) {
                                                    corNotifier.value = v;
                                                    _cor = v;
                                                  },
                                                  countryTel: (v) {},
                                                  nationality: (v) {},
                                                )),
                                          ).then((value) {
                                            setState(() {});
                                          });
                                        },
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 16.0),
                                            child: Row(
                                              children: const [
                                                Text(
                                                  "Country of Residence",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: AppColor.colorGrey,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Spacer(),
                                                Icon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                  color: AppColor.headingColor2,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    return InkWell(
                                      onTap: () {
                                        showMaterialModalBottomSheet(
                                          context: context,
                                          backgroundColor: Colors.transparent,
                                          builder: (context) => Container(
                                              color: Colors.white,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.2,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: BottomSheetCountryPicker(
                                                countries: widget.countries,
                                                countryName: (v) {
                                                  corNotifier.value = v;
                                                  _cor = v;
                                                },
                                                countryTel: (v) {},
                                                nationality: (v) {},
                                              )),
                                        ).then((value) {
                                          setState(() {});
                                        });
                                      },
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                _cor,
                                                style: const TextStyle(
                                                    fontSize: 14.0,
                                                    color: AppColor.lightIndigo,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const Spacer(),
                                              const Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                                color: AppColor.lightIndigo,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                          Container(
                            height: 1,
                            color: AppColor.lightIndigo,
                          ),
                          SizedBox(
                            height: size.width / 7,
                          ),
                          Text(
                            "Fields marked with (*) are mandatory.",
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColor.aquaGreen,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey3,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            "almost there!",
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColor.colorBlue,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: emailNameController,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (v) {
                              valueNotifier.value = valueNotifier.value;
                              setState(() {});
                            },
                            style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColor.lightIndigo,
                                fontWeight: FontWeight.w500),
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.lightIndigo),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.lightIndigo),
                                ),
                                hintText: "Email",
                                fillColor: AppColor.aquaCasper,
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    color: AppColor.colorGrey,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          ValueListenableBuilder(
                              valueListenable: showPasswordNotifier,
                              builder: (BuildContext context, bool value,
                                  Widget? child) {
                                return TextFormField(
                                  controller: passwordNameController,
                                  onChanged: (v) {
                                    valueNotifier.value = valueNotifier.value;
                                    setState(() {});
                                  },
                                  maxLines: 1,
                                  obscureText: showPasswordNotifier.value,
                                  style: const TextStyle(
                                      fontSize: 14.0,
                                      color: AppColor.lightIndigo,
                                      fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                      isDense: true,
                                      suffixIconConstraints:
                                          const BoxConstraints(
                                        minWidth: 20,
                                        minHeight: 30,
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColor.lightIndigo),
                                      ),
                                      suffixIcon: showPasswordNotifier.value
                                          ? InkWell(
                                              onTap: () {
                                                showPasswordNotifier.value =
                                                    false;
                                              },
                                              child: const Icon(
                                                Icons.remove_red_eye_outlined,
                                                color: AppColor.colorGrey,
                                              ))
                                          : InkWell(
                                              onTap: () {
                                                showPasswordNotifier.value =
                                                    true;
                                              },
                                              child: const Icon(
                                                Icons.remove_red_eye_outlined,
                                                color: AppColor.lightIndigo,
                                              )),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColor.lightIndigo),
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      hintText: "Password",
                                      fillColor: AppColor.aquaCasper,
                                      hintStyle: const TextStyle(
                                          fontSize: 14.0,
                                          color: AppColor.colorGrey,
                                          fontWeight: FontWeight.w500)),
                                );
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 49.0,
                                    width: 90,
                                    child: ValueListenableBuilder(
                                        valueListenable: telCodeNotifier,
                                        builder: (BuildContext context,
                                            String value, Widget? child) {
                                          print("value............$value");

                                          if (value.isEmpty) {
                                            return InkWell(
                                              onTap: () {
                                                showMaterialModalBottomSheet(
                                                  context: context,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  builder: (context) =>
                                                      Container(
                                                          color: Colors.white,
                                                          height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .height,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child:
                                                              BottomSheetCountryPicker(
                                                            countries: widget
                                                                .countries,
                                                            countryName: (v) {},
                                                            countryTel: (v) {
                                                              print(
                                                                  "countryTel...1.........$telCode");
                                                              telCodeNotifier
                                                                  .value = v;
                                                              telCode = v;
                                                            },
                                                            nationality: (v) {},
                                                          )),
                                                ).then((value) {
                                                  setState(() {});
                                                });
                                              },
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 12.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Text(
                                                        "Country",
                                                        style: TextStyle(
                                                            fontSize: 14.0,
                                                            color: AppColor
                                                                .colorGrey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .keyboard_arrow_down_outlined,
                                                        color: AppColor
                                                            .headingColor2,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }

                                          return InkWell(
                                            onTap: () {
                                              showMaterialModalBottomSheet(
                                                context: context,
                                                backgroundColor:
                                                    Colors.transparent,
                                                builder: (context) => Container(
                                                    color: Colors.white,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            1.2,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child:
                                                        BottomSheetCountryPicker(
                                                      countries:
                                                          widget.countries,
                                                      countryName: (v) {},
                                                      countryTel: (v) {
                                                        print(
                                                            "countryTel...1.........$telCode");

                                                        telCodeNotifier.value =
                                                            v;
                                                        telCode = v;
                                                      },
                                                      nationality: (v) {},
                                                    )),
                                              ).then((value) {
                                                setState(() {});
                                              });
                                            },
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 12.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      telCode,
                                                      style: const TextStyle(
                                                          fontSize: 14.0,
                                                          color: AppColor
                                                              .lightIndigo,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                      color:
                                                          AppColor.lightIndigo,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                  Container(
                                    height: 1,
                                    width: 90,
                                    color: AppColor.lightIndigo,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ValueListenableBuilder(
                                  valueListenable: telCodeNotifier,
                                  builder: (BuildContext context, String value,
                                      Widget? child) {
                                    return Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 2.0),
                                        child: SizedBox(
                                          height: 50.0,
                                          width: MediaQuery.of(
                                                  locator<NavigationService>()
                                                      .navigatorKey
                                                      .currentContext!)
                                              .size
                                              .width,
                                          child: TextFormField(
                                            controller: phoneController,
                                            keyboardType: TextInputType.phone,
                                            onChanged: (v) {
                                              valueNotifier.value =
                                                  valueNotifier.value;
                                              setState(() {});
                                            },
                                            style: const TextStyle(
                                                fontSize: 14.0,
                                                color: AppColor.lightIndigo,
                                                fontWeight: FontWeight.w500),
                                            decoration: const InputDecoration(
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          AppColor.lightIndigo),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          AppColor.lightIndigo),
                                                ),
                                                hintText: "Phone Number",
                                                fillColor: AppColor.aquaCasper,
                                                contentPadding: EdgeInsets.zero,
                                                hintStyle: TextStyle(
                                                    fontSize: 14.0,
                                                    color: AppColor.colorGrey,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                          SizedBox(
                            height: size.width / 5,
                          ),
                          const Text(
                            "Fields marked with (*) are mandatory.",
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColor.aquaGreen,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey4,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            "Just want to know a bit more about you",
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColor.colorBlue,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: hobbyController,
                            style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColor.lightIndigo,
                                fontWeight: FontWeight.w500),
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.lightIndigo),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.lightIndigo),
                                ),
                                hintText: " Your Hobbies",
                                fillColor: AppColor.aquaCasper,
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    color: AppColor.colorGrey,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: favCountryController,
                            style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColor.lightIndigo,
                                fontWeight: FontWeight.w500),
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.lightIndigo),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.lightIndigo),
                                ),
                                hintText: " Favourite Country",
                                fillColor: AppColor.aquaCasper,
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    color: AppColor.colorGrey,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: tellMoreController,
                            style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColor.lightIndigo,
                                fontWeight: FontWeight.w500),
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.lightIndigo),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.lightIndigo),
                                ),
                                hintText: " Want to tell us more?",
                                fillColor: AppColor.aquaCasper,
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    color: AppColor.colorGrey,
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: size.width / 5,
                          ),
                          valueNotifier.value == 3
                              ? InkWell(
                                  onTap: () {
                                    int position = 1 + valueNotifier.value;
                                    total_width = total_width + 50;
                                    setState(() {});
                                    _pageController.animateToPage(position,
                                        curve: Curves.decelerate,
                                        duration:
                                            const Duration(milliseconds: 300));
                                    // for animated jump. Requires a curve and a duration
                                    if (position == 4) {
                                      String phone = zeroLeadValue(
                                          value: phoneController.text);

                                      context.read<SignupCubits>().saveSignup(
                                          signupRequest: SignupRequest(
                                              firstName:
                                                  firstNameController.text,
                                              lastName: lastNameController.text,
                                              userName: userNameController.text,
                                              gender: selectedGender,
                                              birthday: dob,
                                              nationality: nationality,
                                              country: _cor,
                                              email: emailNameController.text,
                                              password:
                                                  passwordNameController.text,
                                              telCode: telCode,
                                              phone: phone,
                                              hobbies: hobbyController.text,
                                              favCountry:
                                                  favCountryController.text,
                                              extraInfo:
                                                  tellMoreController.text));

                                      _navigationService
                                          .navigateTo(termRoutSecond);
                                      return;
                                    }
                                  },
                                  child: const Text(
                                    'Skip Now & Answer Later',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.aquaGreen,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              : const Text(
                                  "Fields marked with (*) are mandatory.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColor.aquaGreen,
                                      fontWeight: FontWeight.w400),
                                ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Add bank detail",
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColor.colorBlue,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 50.0,
                            child: ValueListenableBuilder(
                                valueListenable: bankCountryNotifier,
                                builder: (BuildContext context, String value,
                                    Widget? child) {
                                  if (value.isEmpty) {
                                    return InkWell(
                                      onTap: () {
                                        showMaterialModalBottomSheet(
                                          context: context,
                                          backgroundColor: Colors.transparent,
                                          builder: (context) => Container(
                                              color: Colors.white,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: BottomSheetCountryPicker(
                                                countries: widget.countries,
                                                countryName: (v) {
                                                  bankCountryNotifier.value = v;
                                                  bankCountry = v;
                                                },
                                                countryTel: (v) {},
                                                nationality: (v) {},
                                              )),
                                        ).then((value) {
                                          setState(() {});
                                        });
                                      },
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 16.0),
                                          child: Row(
                                            children: const [
                                              Text(
                                                "Search Country",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: AppColor.colorGrey,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Spacer(),
                                              Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                                color: AppColor.headingColor2,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  return InkWell(
                                    onTap: () {
                                      showMaterialModalBottomSheet(
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) => Container(
                                            color: Colors.white,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                1.2,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: BottomSheetCountryPicker(
                                              countries: widget.countries,
                                              countryName: (v) {},
                                              countryTel: (v) {},
                                              nationality: (v) {
                                                bankCountryNotifier.value = v;
                                                bankCountry = v;
                                              },
                                            )),
                                      ).then((value) {
                                        setState(() {});
                                      });
                                    },
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 16.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              bankCountry,
                                              style: const TextStyle(
                                                  fontSize: 14.0,
                                                  color: AppColor.lightIndigo,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const Spacer(),
                                            const Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                              color: AppColor.lightIndigo,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                        Container(
                          height: 1,
                          color: AppColor.lightIndigo,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: bankNameController,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: AppColor.lightIndigo,
                              fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor.lightIndigo),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor.lightIndigo),
                              ),
                              hintText: "Bank Name",
                              fillColor: AppColor.aquaCasper,
                              contentPadding: EdgeInsets.zero,
                              hintStyle: TextStyle(
                                  fontSize: 14.0,
                                  color: AppColor.colorGrey,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: beneficiaryController,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: AppColor.lightIndigo,
                              fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor.lightIndigo),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor.lightIndigo),
                              ),
                              hintText: "Beneficiary Name",
                              fillColor: AppColor.aquaCasper,
                              contentPadding: EdgeInsets.zero,
                              hintStyle: TextStyle(
                                  fontSize: 14.0,
                                  color: AppColor.colorGrey,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: accountNoController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: AppColor.lightIndigo,
                              fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor.lightIndigo),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor.lightIndigo),
                              ),
                              hintText: "Account No.",
                              fillColor: AppColor.aquaCasper,
                              contentPadding: EdgeInsets.zero,
                              hintStyle: TextStyle(
                                  fontSize: 14.0,
                                  color: AppColor.colorGrey,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: ibanNoController,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: AppColor.lightIndigo,
                              fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor.lightIndigo),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor.lightIndigo),
                              ),
                              hintText: "IBAN No.",
                              fillColor: AppColor.aquaCasper,
                              contentPadding: EdgeInsets.zero,
                              hintStyle: TextStyle(
                                  fontSize: 14.0,
                                  color: AppColor.colorGrey,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: swiftCodeNoController,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: AppColor.lightIndigo,
                              fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor.lightIndigo),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor.lightIndigo),
                              ),
                              hintText: "Swift Code.",
                              fillColor: AppColor.aquaCasper,
                              contentPadding: EdgeInsets.zero,
                              hintStyle: TextStyle(
                                  fontSize: 14.0,
                                  color: AppColor.colorGrey,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget _buildButton({required int index}) {
    if (index == 0) {
      if (userNameController.text.isEmpty) {
        return Container(
          height: 46.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: AppColor.colorGrey,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Center(
            child: Text(
              "Next",
              style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
            ),
          ),
        );
      }
      if (firstNameController.text.isEmpty) {
        return Container(
          height: 46.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: AppColor.colorGrey,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Center(
            child: Text(
              "Next",
              style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
            ),
          ),
        );
      }
      if (lastNameController.text.isEmpty) {
        return Container(
          height: 46.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: AppColor.colorGrey,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Center(
            child: Text(
              "Next",
              style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
            ),
          ),
        );
      }
      return InkWell(
        onTap: () {
          int position = 1 + index;
          total_width = total_width + 40;
          print('total_width = ${total_width}');
          setState(() {});
          _pageController.animateToPage(position,
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 300));
          // for animated jump. Requires a curve and a duration
        },
        child: Container(
          height: 46.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: AppColor.lightIndigo,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Center(
            child: Text(
              "Next",
              style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
            ),
          ),
        ),
      );
    } else if (index == 1) {
      if (selectedGender != null) {
        if (selectedGender!.isEmpty) {
          return Container(
            height: 46.0,
            width: 200.0,
            decoration: BoxDecoration(
                color: AppColor.colorGrey,
                borderRadius: BorderRadius.circular(8.0)),
            child: const Center(
              child: Text(
                "Next",
                style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
              ),
            ),
          );
        }
      }
      if (dob.isEmpty) {
        return Container(
          height: 46.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: AppColor.colorGrey,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Center(
            child: Text(
              "Next",
              style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
            ),
          ),
        );
      }
      if (nationality.isEmpty) {
        return Container(
          height: 46.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: AppColor.colorGrey,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Center(
            child: Text(
              "Next",
              style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
            ),
          ),
        );
      }

      print("_cor.............$_cor");
      if (_cor.isEmpty) {
        return Container(
          height: 46.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: AppColor.colorGrey,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Center(
            child: Text(
              "Next",
              style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
            ),
          ),
        );
      }

      return InkWell(
        onTap: () {
          int position = 1 + index;
          total_width = total_width + 40;
          print('total_width = ${total_width}');
          setState(() {});
          _pageController.animateToPage(position,
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 300));
          // for animated jump. Requires a curve and a duration
        },
        child: Container(
          height: 46.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: AppColor.lightIndigo,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Center(
            child: Text(
              "Next",
              style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
            ),
          ),
        ),
      );
    } else if (index == 2) {
      if (emailNameController.text.isEmpty) {
        return Container(
          height: 46.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: AppColor.colorGrey,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Center(
            child: Text(
              "Next",
              style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
            ),
          ),
        );
      }
      if (passwordNameController.text.isEmpty) {
        return Container(
          height: 46.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: AppColor.colorGrey,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Center(
            child: Text(
              "Next",
              style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
            ),
          ),
        );
      }
      if (telCode.isEmpty) {
        return Container(
          height: 46.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: AppColor.colorGrey,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Center(
            child: Text(
              "Next",
              style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
            ),
          ),
        );
      }
      if (phoneController.text.isEmpty) {
        return Container(
          height: 46.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: AppColor.colorGrey,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Center(
            child: Text(
              "Next",
              style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
            ),
          ),
        );
      }

      return InkWell(
        onTap: () {
          int position = 1 + index;
          total_width = total_width + 40;
          print('total_width = ${total_width}');
          setState(() {});
          _pageController.animateToPage(position,
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 300));
          // for animated jump. Requires a curve and a duration
        },
        child: Container(
          height: 46.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: AppColor.lightIndigo,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Center(
            child: Text(
              "Next",
              style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
            ),
          ),
        ),
      );
    } else if (index == 3) {
      return InkWell(
        onTap: () {
          int position = 1 + index;
          total_width = total_width + 40;
          print('total_width = ${total_width}');
          setState(() {});
          _pageController.animateToPage(position,
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 300));
        },
        child: Container(
          height: 46.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: AppColor.lightIndigo,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Center(
            child: Text(
              "Next",
              style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          int position = 1 + index;
          total_width = total_width + 40;
          print('total_width = ${total_width}');
          setState(() {});
          _pageController.animateToPage(position,
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 300));
          // for animated jump. Requires a curve and a duration
          if (position == 5) {
            String phone = zeroLeadValue(value: phoneController.text);

            BankDetails bankDetails = BankDetails(
                country: bankCountry,
                name: bankNameController.text,
                beneficiary: beneficiaryController.text,
                accountNo: accountNoController.text,
                iban: ibanNoController.text,
                swiftCode: swiftCodeNoController.text);

            context.read<SignupCubits>().saveSignup(
                signupRequest: SignupRequest(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    userName: userNameController.text,
                    gender: selectedGender,
                    birthday: dob,
                    nationality: nationality,
                    country: _cor,
                    email: emailNameController.text,
                    password: passwordNameController.text,
                    telCode: telCode,
                    phone: phone,
                    hobbies: hobbyController.text,
                    favCountry: favCountryController.text,
                    extraInfo: tellMoreController.text,
                    bankDetails: bankDetails));

            _navigationService.navigateTo(termRoutSecond);
            return;
          }
        },
        child: Container(
          height: 46.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: AppColor.lightIndigo,
              borderRadius: BorderRadius.circular(8.0)),
          child: const Center(
            child: Text(
              "Next",
              style: TextStyle(fontSize: 15.0, color: AppColor.whiteColor),
            ),
          ),
        ),
      );
    }
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 316,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system
              // navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }
}
