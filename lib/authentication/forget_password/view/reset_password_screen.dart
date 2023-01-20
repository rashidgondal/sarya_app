import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late NavigationService _navigationService;


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
      body:  BlocBuilder<SignInCubits, SignInStates>(
        builder: (context, state) {

          bool loading = false;

         if(state is SignInInitial){
           loading = false;
          }

          if(state is SignInLoading){
            loading = true;

          }

          if(state is SignInLoaded){
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
                                ],),

                            )),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: otpController,
                          validator: (v){

                            if(v!.isEmpty){
                              return "Please enter code.";
                            }else{
                              return null;
                            }



                          },
                          style:const TextStyle(
                              fontSize: 13.0,
                              color: AppColor.aquaGreen,
                              fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColor.lightIndigo),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColor.lightIndigo),
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
                          validator: (v){

                            if(v!.isEmpty){
                              return "Please enter password.";
                            }else{
                              return null;
                            }



                          },
                            style:const TextStyle(
                                fontSize: 13.0,
                                color: AppColor.aquaGreen,
                                fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColor.lightIndigo),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColor.lightIndigo),
                              ),
                              hintText: "New password ",
                              fillColor: AppColor.aquaCasper,
                              contentPadding: EdgeInsets.zero,
                              hintStyle: TextStyle(
                                  fontSize: 13.0,
                                  color: AppColor.colorGrey,
                                  fontWeight: FontWeight.w500)
                          ),
                        ),
                        const SizedBox(height:30.0),
                        InkWell(
                          onTap: () {
                            int code = int.parse(otpController.text);
                            context.read<ForgetPasswordCubits>().doResetPassword(otp: code, password: passwordController.text, navigationService: _navigationService);

                          },
                          child: Container(
                            height: 46.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                                color: AppColor.lightIndigo,
                                borderRadius: BorderRadius.circular(8.0)),
                            child: const Center(
                              child: Text(
                                "Reset Password",
                                style: TextStyle(
                                    fontSize: 15.0, color: AppColor.whiteColor),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height:20.0),
                        InkWell(
                          onTap: () {

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
                                    fontSize: 15.0, color: AppColor.headingColor2),
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
      )

    );
  }
}
