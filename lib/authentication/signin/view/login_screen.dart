import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sarya/authentication/signin/signin_view_model/signin_cubits.dart';
import 'package:sarya/authentication/signin/signin_view_model/signin_states.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/helper/shared_prefs.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../../customWidgets/data_loading.dart';
import '../../../locator.dart';
import '../../../navigation/navigation_service.dart';
import '../../../shop/shop_view_model/public_cubits.dart';
import '../../signup/signup_view_model/country_cubits.dart';
import '../models/signin_request_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late NavigationService _navigationService;

  @override
  void initState() {
    super.initState();
    context.read<CountryCubits>().getCountries();
    context.read<PublicItineraryCubits>().getPublicItinerary();
    _navigationService = locator<NavigationService>();
  }

  bool showPassword = true;
@override
  void dispose() {
    userNameController.dispose();
    passController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: BlocBuilder<SignInCubits, SignInStates>(
          builder: (context, state) {
            bool loading = false;

            if (state is SignInInitial) {
              loading = false;
            }

            if (state is SignInLoading) {
              loading = true;
            }

            if (state is SignInLoaded) {
              loading = false;
            }

            return DataLoading(
              isLoading: loading,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                              height: size.height / 2.5,
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 150.0,
                                      width: 150.0,
                                      child: SvgPicture.asset('logo'.svg),
                                    )
                                  ],
                                ),
                              )),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            controller: userNameController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Please enter username.";
                              } else {
                                return null;
                              }
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
                                hintText: "Email or phone",
                                fillColor: AppColor.colorGrey,
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(
                                    fontSize: 13.0,
                                    color: AppColor.colorGrey,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(height: 50.0),
                          TextFormField(
                            controller: passController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Please enter password.";
                              } else {
                                return null;
                              }
                            },
                            maxLines: 1,
                            obscureText: showPassword,
                            style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColor.lightIndigo,
                                fontWeight: FontWeight.w500),

                            decoration:  InputDecoration(
                                isDense: true,
                                suffixIconConstraints:const BoxConstraints(
                                  minWidth: 20,
                                  minHeight: 30,
                                ),

                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColor.lightIndigo),
                                ),
                                suffixIcon: showPassword?
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      showPassword = false;
                                    });
                                  },
                                    child: const Icon(Icons.remove_red_eye_outlined,color: AppColor.colorGrey,)):
                                InkWell(
                                    onTap: (){
                                      setState(() {
                                        showPassword = true;
                                      });
                                    },
                                    child: const Icon(Icons.remove_red_eye_outlined,color: AppColor.lightIndigo,)),
                                focusedBorder:const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.lightIndigo),
                                ),
                                contentPadding: EdgeInsets.zero,
                                hintText: "Password",
                                fillColor: AppColor.aquaCasper,
                                hintStyle:const TextStyle(
                                    fontSize: 14.0,
                                    color: AppColor.colorGrey,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    _navigationService.navigateTo(forgetRout,arguments: {"isFromLogin": true});
                                  },
                                  child: const SizedBox(
                                      height: 40.0,
                                      child: Center(
                                        child: Text(
                                          "Forget password?",
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: AppColor.lightIndigo,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ))),
                              InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      //  _navigationService.navigatePushReplace(dashboardRout);
                                      SignInRequest request = SignInRequest(
                                          userName: userNameController.text,
                                          password: passController.text);
                                      context.read<SignInCubits>().doSignIn(
                                          signInRequest: request,
                                          navigationService:
                                              _navigationService);
                                    }
                                  },
                                  child: const SizedBox(
                                      height: 40.0,
                                      child: Center(
                                        child: Text(
                                          "Let's Go!",
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: AppColor.aquaCasper,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )))
                            ],
                          ),
                          SizedBox(
                            height: size.width / 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don’t have an account? ",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    color: AppColor.aquaCasper,
                                    fontWeight: FontWeight.w400),
                              ),
                              InkWell(
                                  onTap: () async {
                                    SharedPrefs pref = SharedPrefs();
                                    List listOfCountries =
                                        await pref.getCountries();
                                    _navigationService.navigateTo(signupRout,
                                        arguments: listOfCountries);
                                  },
                                  child: const Text(
                                    "Sign Up!",
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        color: AppColor.aquaCasper,
                                        fontWeight: FontWeight.w700),
                                  )),
                            ],
                          ),
                          const SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                  height: 40.0,
                                  child: Text(
                                    "I agree to the ",
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        color: AppColor.aquaCasper,
                                        fontWeight: FontWeight.w400),
                                  )),
                              InkWell(
                                  onTap: () {
                                    _navigationService.navigateTo(termRout);
                                  },
                                  child: const SizedBox(
                                      height: 40.0,
                                      child: Text(
                                        "term & conditions.",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 13.0,
                                            color: AppColor.aquaCasper,
                                            fontWeight: FontWeight.w400),
                                      ))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
