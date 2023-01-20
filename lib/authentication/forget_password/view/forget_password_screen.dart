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
import '../forget_password_viewmodel/forget_password_states.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

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
      body:  BlocBuilder<ForgetPasswordCubits, ForgetPasswordStates>(
        builder: (context, state) {

          bool loading = false;

         if(state is ForgetPasswordInitial){
           loading = false;
          }

          if(state is ForgetPasswordLoading){
            loading = true;

          }

          if(state is ForgetPasswordLoaded){
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
                          controller: emailController,
                          validator: (v){

                            if(v!.isEmpty){
                              return "Please enter email.";
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
                              hintText: "Enter email ",
                              fillColor: AppColor.aquaCasper,
                              contentPadding: EdgeInsets.zero,
                              hintStyle: TextStyle(
                                  fontSize: 13.0,
                                  color: AppColor.colorGrey,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(height:30.0),
                        InkWell(
                          onTap: () {

                            context.read<ForgetPasswordCubits>().doForgetPassword(email: emailController.text, navigationService: _navigationService);

                            },
                          child: Container(
                            height: 46.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                                color: AppColor.lightIndigo,
                                borderRadius: BorderRadius.circular(8.0)),
                            child: const Center(
                              child: Text(
                                "Send Code",
                                style: TextStyle(
                                    fontSize: 15.0, color: AppColor.whiteColor),
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
