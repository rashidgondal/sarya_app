import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarya/authentication/signup/model/signup_request.dart';
import 'package:sarya/authentication/signup/signup_view_model/country_cubits.dart';
import 'package:sarya/authentication/signup/signup_view_model/country_states.dart';
import 'package:sarya/authentication/signup/signup_view_model/signup_cubits.dart';
import 'package:sarya/authentication/signup/signup_view_model/signup_states.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../../customWidgets/custom_country_picker.dart';
import '../../../navigation/navigation_service.dart';
import '../model/country_response.dart';

class SignupScreen extends StatefulWidget {
 final List countries;
  const SignupScreen({Key? key, required this.countries}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final PageController _pageController      = PageController(
    initialPage: 0,
    keepPage: true,
  );
  final PageController _pageControllerImage = PageController(
    initialPage: 0,
    keepPage: true,
  );

  TextEditingController userNameController  = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController   = TextEditingController();

  TextEditingController nationalityController  = TextEditingController();
  TextEditingController cOFController          = TextEditingController();

  TextEditingController emailNameController    = TextEditingController();
  TextEditingController passwordNameController = TextEditingController();
  TextEditingController phoneController        = TextEditingController();

  TextEditingController hobbyController        = TextEditingController();
  TextEditingController favCountryController   = TextEditingController();
  TextEditingController tellMoreController     = TextEditingController();

  late NavigationService _navigationService;
  List<Widget> list = [];
  List<Widget> listImage = [SvgPicture.asset('signup_logo'.svg),SvgPicture.asset('signup_logo_2'.svg),SvgPicture.asset('signup_logo_3'.svg),SvgPicture.asset('signup_completed'.svg),];

  final _formKey  = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  
  List listGender = ["Male", 'Female'];
  String? selectedGender;
  String dob='', telCode ='';

  ValueNotifier<String> dateValueNotifier =  ValueNotifier('');
  ValueNotifier<String> genderNotifier    =  ValueNotifier('');
  ValueNotifier<String> countriesNotifier =  ValueNotifier('');

  String? selectedCountry;


  @override
  void initState() {
    super.initState();

    _navigationService = locator<NavigationService>();

    setState(() {
      list = [
        Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Tell us a little bit about yourself",
                style: TextStyle(
                    fontSize: 14,
                    color: AppColor.colorBlue,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: userNameController,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Please enter username.";
                  } else {
                    return null;
                  }
                },
                style:const TextStyle(
                    fontSize: 14.0,
                    color: AppColor.aquaGreen,
                    fontWeight: FontWeight.w500),

                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    hintText: " *Username",
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
                controller: firstNameController,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Please enter first name.";
                  } else {
                    return null;
                  }
                },
                style:const TextStyle(
                    fontSize: 14.0,
                    color: AppColor.aquaGreen,
                    fontWeight: FontWeight.w500),

                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    hintText: " *First Name",
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
                controller: lastNameController,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Please enter last name.";
                  } else {
                    return null;
                  }
                },
                style:const TextStyle(
                    fontSize: 14.0,
                    color: AppColor.aquaGreen,
                    fontWeight: FontWeight.w500),

                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    hintText: " *Last Name",
                    fillColor: AppColor.aquaCasper,
                    contentPadding: EdgeInsets.zero,
                    hintStyle: TextStyle(
                        fontSize: 14.0,
                        color: AppColor.colorGrey,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ),
        Form(
          key: _formKey2,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "a few more things",
                style: TextStyle(
                    fontSize: 14,
                    color: AppColor.colorBlue,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 30,
              ),

              ValueListenableBuilder(
                  valueListenable: genderNotifier,
                  builder:
                      (BuildContext context, String value, Widget? child) {
                    if(value.isEmpty) {
                      return   Align(
                        alignment: Alignment.centerLeft,
                        child: DropdownButton<String>(
                          underline:const SizedBox(),
                          hint: const Text(
                            '*Gender',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColor.colorGrey),
                          ),
                          value: selectedGender,
                          onChanged: (String? newValue) {
                            genderNotifier.value = newValue??'';
                            selectedGender = newValue;

                          },

                          items: listGender.map((var value) {
                            return DropdownMenuItem<String>(
                              value: '$value',
                              child: Text(
                                '$value',
                                style: const TextStyle(
                                    color: AppColor.colorBlack),
                              ),
                            );
                          }).toList(),
                        ),
                      );

                    }

                    return  Align(
                      alignment: Alignment.centerLeft,
                      child: DropdownButton<String>(
                        underline:const SizedBox(),
                        value: selectedGender,
                        onChanged: (String? newValue) {
                          genderNotifier.value = newValue??'';
                          selectedGender = newValue;

                        },

                        items: listGender.map((var value) {
                          return DropdownMenuItem<String>(
                            value: '$value',
                            child: Text(
                              '$value',
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  color: AppColor.aquaGreen,
                                  fontWeight: FontWeight.w500),
                            ),
                          );
                        }).toList(),
                      ),
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
                  builder:
                      (BuildContext context, String value, Widget? child) {
                      if(value.isEmpty) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              _selectDate();
                            },
                            child: SizedBox(
                              height: 20,
                              child: Text(
                                " *Birthdate  $value", style: const TextStyle(
                                  fontSize: 14.0,
                                  color: AppColor.colorGrey,
                                  fontWeight: FontWeight.w500),),
                            ),
                          ),
                        );
                      }

                      return Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            _selectDate();
                          },
                          child: SizedBox(
                            height: 20,
                            child: Text(
                              " * $value", style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColor.lightIndigo,
                                fontWeight: FontWeight.w500),),
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
              TextFormField(
                controller: nationalityController,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Please enter Nationality.";
                  } else {
                    return null;
                  }
                },
                style:const TextStyle(
                    fontSize: 14.0,
                    color: AppColor.aquaGreen,
                    fontWeight: FontWeight.w500),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    hintText: " *Nationality",
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
                controller: cOFController,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Please enter Country of residence.";
                  } else {
                    return null;
                  }
                },
                style:const TextStyle(
                    fontSize: 14.0,
                    color: AppColor.aquaGreen,
                    fontWeight: FontWeight.w500),

                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    hintText: " *Country of Residence",
                    fillColor: AppColor.aquaCasper,
                    contentPadding: EdgeInsets.zero,
                    hintStyle: TextStyle(
                        fontSize: 14.0,
                        color: AppColor.colorGrey,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ),
        Form(
          key: _formKey3,
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

                validator: (v) {
                  if (v!.isEmpty) {
                    return "Please enter email.";
                  } else {
                    return null;
                  }
                },
                style:const TextStyle(
                    fontSize: 14.0,
                    color: AppColor.aquaGreen,
                    fontWeight: FontWeight.w500),

                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    hintText: " *Email",
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
                controller: passwordNameController,
                keyboardType: TextInputType.text,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Please enter password.";
                  } else {
                    return null;
                  }
                },
                style:const TextStyle(
                    fontSize: 14.0,
                    color: AppColor.aquaGreen,
                    fontWeight: FontWeight.w500),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    hintText: " *Password",
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
                height: 50.0,
                child:     ValueListenableBuilder(
                    valueListenable: countriesNotifier,
                    builder: (BuildContext context, String value, Widget? child) {

                      if(value.isEmpty) {
                        return CustomCountryPicker(
                          value: selectedCountry,
                          icon:const Icon(Icons.flag, color: AppColor.colorGrey,),
                          hint: 'Country',
                          items: widget.countries.map((value) =>
                              DropdownMenuItem(
                                value: value['name'],

                                child: SizedBox(
                                  width: MediaQuery.of(locator<NavigationService>().navigatorKey.currentContext!).size.width/1.2,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.flag,
                                        color: AppColor.colorGrey,
                                      ),
                                      const SizedBox(width: 20),
                                      Text(value['name'] ?? ''),
                                      Text(' (${value['tel']})' ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  telCode = value['tel'];
                                },
                              )).toList(),
                          onItemChanged: (v){

                            countriesNotifier.value = v;
                            selectedCountry = v;

                          },
                          errorText: '',

                        );

                      }

                      return CustomCountryPicker(
                        value: selectedCountry,
                        icon:const Icon(Icons.flag),
                        hint: 'Country',
                        items: widget.countries.map((value) =>
                            DropdownMenuItem(
                              value: value['name'],
                              child: SizedBox(
                                width: MediaQuery.of(locator<NavigationService>().navigatorKey.currentContext!).size.width/1.2,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.flag,
                                      color: AppColor.aquaGreen,
                                    ),
                                    const SizedBox(width: 20),
                                    Text(value['name'] ?? '',style: const TextStyle(
                                        fontSize: 14.0,
                                        color: AppColor.aquaGreen,
                                        fontWeight: FontWeight.w500),),
                                    Text(" (${value['tel']})"?? '',style: const TextStyle(
                                        fontSize: 14.0,
                                        color: AppColor.aquaGreen,
                                        fontWeight: FontWeight.w500),),
                                  ],
                                ),
                              ),
                              onTap: () {

                              },
                            )).toList(),
                        onItemChanged: (v){

                            countriesNotifier.value = v;
                            selectedCountry = v;

                        },
                        errorText: '',

                      );
                    }),

            /*    BlocBuilder<CountryCubits, CountryStates>(
                    builder: (context, state) {
                      if(state is CountryInitial){
                        return const SizedBox();
                      }

                      if(state is CountryLoading){
                        return const Center(child:  CupertinoActivityIndicator());

                      }

                      if(state is CountryLoaded){

                        return  CustomCountryPicker(
                          value: selectedCountry,
                          icon:const Icon(Icons.flag),
                          hint: 'Country',
                          items: state.countries.map((value) =>
                              DropdownMenuItem(
                                value: value['name'],
                                child: Container(
                                  width: MediaQuery.of(locator<NavigationService>().navigatorKey.currentContext!).size.width/1.2,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.flag,
                                        color: AppColor.colorGrey,
                                      ),
                                      const SizedBox(width: 20),
                                      Text(value['name'] ?? ''),
                                     const Spacer(),
                                      Text(value['tel'] ?? ''),
                                    ],
                                  ),
                                ),
                                onTap: () {

                                },
                              )).toList(),
                          onItemChanged: (v){
                            setState(() {
                              selectedCountry = v;
                            });
                          },
                          errorText: '',

                        );
                      }
                      else{
                        return const Center(child: Text("No Data found"),);
                      }

                    }),*/
              ),
              Container(
                height: 1,
                color: AppColor.lightIndigo,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: SizedBox(
                  height: 50.0,
                  width: MediaQuery.of(locator<NavigationService>().navigatorKey.currentContext!).size.width ,
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please enter phone number.";
                      } else {
                        return null;
                      }
                    },
                    style:const TextStyle(
                        fontSize: 14.0,
                        color: AppColor.aquaGreen,
                        fontWeight: FontWeight.w500),
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.lightIndigo),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.lightIndigo),
                        ),
                        hintText: " *Phone Number",
                        fillColor: AppColor.aquaCasper,
                        contentPadding: EdgeInsets.zero,
                        hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: AppColor.colorGrey,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),

            ],
          ),
        ),
        Form(
          key: _formKey4,
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
                style:const TextStyle(
                    fontSize: 14.0,
                    color: AppColor.aquaGreen,
                    fontWeight: FontWeight.w500),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
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
                style:const TextStyle(
                    fontSize: 14.0,
                    color: AppColor.aquaGreen,
                    fontWeight: FontWeight.w500),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
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
                style:const TextStyle(
                    fontSize: 14.0,
                    color: AppColor.aquaGreen,
                    fontWeight: FontWeight.w500),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.lightIndigo),
                    ),
                    hintText: " Want to tell us more?",
                    fillColor: AppColor.aquaCasper,
                    contentPadding: EdgeInsets.zero,
                    hintStyle: TextStyle(
                        fontSize: 14.0,
                        color: AppColor.colorGrey,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ),
      ];
    });
  }

  String date = "";
  DateTime selectedDate = DateTime.now();

  _selectDate() async {
    final DateTime? selected = await showDatePicker(
      context: locator<NavigationService>().navigatorKey.currentContext!,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null ) {

        String d = selected.toString();
        var splitDate = d.split(" ");
        dateValueNotifier.value = splitDate[0];
        dob = splitDate[0];

    }
  }

  ValueNotifier<int> valueNotifier = ValueNotifier(0);

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
            toolbarHeight: 50,
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
                child: PageView.builder(
                    itemCount: listImage.length,

                    reverse: false,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageControllerImage,
                    itemBuilder: (c, index) {
                      return    Container(
                        color: AppColor.whiteColor,
                        child: listImage[index],
                      );
                    }),
              )


            ),
          ),
          bottomNavigationBar: BlocBuilder<SignupCubits, SignupStates>(
            builder: (context, state) {

              return   SizedBox(
                height: 120,
                child: ValueListenableBuilder(
                    valueListenable: valueNotifier,
                    builder: (BuildContext context, int value, Widget? child) {
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
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              if (value == 0) {
                                if (_formKey.currentState!.validate()) {
                                } else {
                                  return;
                                }
                              }

                              if (value == 1) {
                                if (_formKey2.currentState!.validate()) {
                                } else {
                                  return;
                                }
                              }

                              if (value == 2) {
                                if (_formKey3.currentState!.validate()) {
                                } else {
                                  return;
                                }
                              }

                              if (value == 3) {
                                if (_formKey4.currentState!.validate()) {
                                } else {
                                  return;
                                }
                              }

                              int position = 1 + value;


                              _pageControllerImage.animateToPage(position,
                                  curve: Curves.decelerate,
                                  duration: const Duration(milliseconds: 300));

                              _pageController.animateToPage(position,
                                  curve: Curves.decelerate,
                                  duration: const Duration(milliseconds: 300));
                              // for animated jump. Requires a curve and a duration
                              if (position == 4) {
                                String phone = zeroLeadValue(value: phoneController.text);



                                context
                                    .read<SignupCubits>()
                                    .saveSignup(signupRequest:
                                      SignupRequest(
                                          firstName: firstNameController.text,
                                          lastName: firstNameController.text,
                                          userName: userNameController.text,
                                          gender: selectedGender,
                                          birthday: dob,
                                          nationality: nationalityController.text,
                                          country: cOFController.text,
                                          email: emailNameController.text,
                                          password: passwordNameController.text,
                                          telCode: telCode,
                                          phone: phone,
                                          hobbies: hobbyController.text,
                                          favCountry: favCountryController.text,
                                          extraInfo: tellMoreController.text

                                    ));

                                _navigationService.navigateTo(termRoutSecond);
                                return;
                              }
                            },
                            child: Container(
                              height: 46.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                  color: AppColor.colorGrey,
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: const Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      fontSize: 15.0, color: AppColor.whiteColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              );




            },
          ),
          body: list.isEmpty
              ? const SizedBox()
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: PageView.builder(
                      itemCount: list.length,
                      onPageChanged: (v) {
                        valueNotifier.value = v;
                      },
                      reverse: false,
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      itemBuilder: (c, index) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              list[index],
                              SizedBox(
                                height: index == 1 ? 20 : size.width / 5,
                              ),
                              Text(
                                index == 3
                                    ? 'Skip Now & Answer Later'
                                    : "Fields marked with (*) are mandatory.",
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColor.aquaGreen,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
        ),
      ),
    );
  }

  String zeroLeadValue({required String value}){
    if (value.startsWith('0') && value.length > 1) {
      return value.replaceAll( RegExp(r'^0+(?=.)'), '');
    } else {
      return value;
    }
  }

}
