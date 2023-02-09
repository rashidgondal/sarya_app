import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sarya/authentication/forget_password/forget_password_viewmodel/reset_password_cubits.dart';
import 'package:sarya/authentication/forget_password/forget_password_viewmodel/reset_password_states.dart';
import 'package:sarya/authentication/signin/signin_view_model/signin_cubits.dart';
import 'package:sarya/authentication/signin/signin_view_model/signin_states.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../../customWidgets/data_loading.dart';
import '../../../locator.dart';
import '../../../navigation/navigation_service.dart';
import '../forget_password_viewmodel/forget_password_cubits.dart';

class ResetPasswordScreen extends StatefulWidget {

  final Map map;

  const ResetPasswordScreen({Key? key, required this.map}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String otp ='', password ='';
  late NavigationService _navigationService;
  bool showPassword = true;

  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          elevation: 0,
          title:  Text(
            widget.map['root'] ? "Forget Password": "Reset Password",
            style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
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
        ),

        body: BlocBuilder<ResetPasswordCubits, ResetPasswordStates>(
          builder: (context, state) {
            bool loading = false;

            if (state is ResetPasswordInitial) {
              loading = false;
            }

            if (state is ResetPasswordLoading) {
              loading = true;
            }

            if (state is ResetPasswordLoaded) {
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
                            controller: otpController,
                            onChanged: (v){

                              setState(() {
                                otp = v;

                              });
                            },
                            keyboardType: TextInputType.number,
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
                                hintText: "Enter code here",
                                fillColor: AppColor.aquaCasper,
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(
                                    fontSize: 13.0,
                                    color: AppColor.colorGrey,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            controller: passwordController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Please new password.";
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
                                hintText: "New Password",
                                fillColor: AppColor.aquaCasper,
                                hintStyle:const TextStyle(
                                    fontSize: 14.0,
                                    color: AppColor.colorGrey,
                                    fontWeight: FontWeight.w500)),
                          ),

                      /*    TextFormField(
                            controller: passwordController,
                            onChanged: (v){

                              setState(() {
                                password = v;

                              });
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
                                hintText: "New password ",
                                fillColor: AppColor.aquaCasper,
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(
                                    fontSize: 13.0,
                                    color: AppColor.colorGrey,
                                    fontWeight: FontWeight.w500)),
                          ),*/
                          const SizedBox(height: 30.0),
                          InkWell(
                            onTap: otp.isEmpty || password.isEmpty?null:() {

                                int code = int.parse(otpController.text);
                                context
                                    .read<ForgetPasswordCubits>()
                                    .doResetPassword(
                                        otp: code,
                                        password: passwordController.text,
                                        email: widget.map['email'],
                                        navigationService: _navigationService,
                                        rootValue: widget.map['root']
                                );

                            },
                            child: Container(
                              height: 46.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                  color: otp.isEmpty || password.isEmpty? AppColor.colorLiteGrey: AppColor.lightIndigo,
                                  borderRadius: BorderRadius.circular(8.0)),
                              child:  Center(
                                child: Text(
                                  "Reset Password",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: otp.isEmpty || password.isEmpty?AppColor.headingColor2 : AppColor.whiteColor),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          InkWell(
                            onTap: () {
                              if(widget.map['root'] == true) {
                                _navigationService.navigatePushReplace(loginRout);
                              }else{
                                _navigationService.navigatePushReplace(settingRoute);
                              }
                            },
                            child: Container(
                              height: 46.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                  color: AppColor.colorLiteGrey,
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: const Center(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: AppColor.headingColor2),
                                ),
                              ),
                            ),
                          ),
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
