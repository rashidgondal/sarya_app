import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarya/customWidgets/custom_text_field.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/settings/email/view_model/email_cubits.dart';
import 'package:sarya/settings/email/view_model/email_states.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../../customWidgets/data_loading.dart';
import '../../../helper/shared_prefs.dart';
import '../../../locator.dart';
import '../../../navigation/navigation_service.dart';
import '../model/update_email_request.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {

  TextEditingController emailTextEditingController = TextEditingController();
  late NavigationService _navigationService;
  var list = [];

  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();
    getUserInfo();
  }

  getUserInfo() async {
    SharedPrefs pref = SharedPrefs();
    Map map = await pref.getUser();

    emailTextEditingController.text = map['email'] ?? '';


    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(
        child:
        BlocBuilder<EmailCubits, EmailStates>(builder: (context, state) {
          bool loading = false;

          if (state is EmailInitial) {
            loading = false;
          }

          if (state is EmailLoading) {
            loading = true;
          }

          if (state is EmailLoaded) {
            loading = false;
          }

          return DataLoading(
            isLoading: loading,
            child: Scaffold(
              backgroundColor: AppColor.whiteColor,
              appBar: AppBar(
                elevation: 0,
                title: const Text("Email", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
                leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: AppColor.lightIndigo,),
                  onPressed: () {
                    _navigationService.goBack();
                  },),
                backgroundColor: AppColor.aquaCasper2,
                toolbarHeight: 55.0,
                bottom: PreferredSize(
                  preferredSize:const  Size.fromHeight(60),
                  child: Container(
                    height: 50,
                    width: size.width,
                    color: AppColor.colorLiteGrey,
                    child:   Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: size.width/1.2,
                              child:const Text("You can use this email address to log in, or for password recovery.", style: TextStyle(fontSize: 14, color: AppColor.headingColor2),)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              bottomSheet: Container(
                height: 100,
                color: AppColor.whiteColor,
                width: size.width,
                child: Center(
                  child: InkWell(
                    onTap:
                    emailTextEditingController.text.isEmpty
                        ? null
                        : () {

                      UpdateEmailRequest updateEmailRequest =
                      UpdateEmailRequest(email:   emailTextEditingController.text);

                      context.read<EmailCubits>().updateEmail(
                        navigationService: _navigationService, UpdateEmailRequest: updateEmailRequest,
                      );
                    },
                    child: Container(
                      height: 46.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          color: emailTextEditingController.text.isEmpty
                              ? AppColor.colorLiteGrey
                              : AppColor.aquaGreen,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: emailTextEditingController.text.isEmpty
                                  ? AppColor.headingColor2
                                  : AppColor.whiteColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                physics:const BouncingScrollPhysics(),
                child: Column(
                  children:  [
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomTextField(
                        maxLine: 1,
                        textEditingController: emailTextEditingController,
                        size: size,
                        textInputType: TextInputType.emailAddress,
                        hintText: '',
                        icon: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'email'.svg,
                            ),
                          ],
                        ),
                      ),
                    ),


                    /*     Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      const Text(
                        "Your email is verified",
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColor.headingColor2),
                      ),
                      const SizedBox(width: 10,),
                      Theme(

                        data: Theme.of(context).copyWith(
                            unselectedWidgetColor:  AppColor.aquaCasper),
                        child:Checkbox(
                          value: true,
                          onChanged: (bool? value) {},
                          focusColor:  AppColor.aquaCasper,
                          activeColor: AppColor.aquaCasper,

                        ),
                      )
                    ],
                  ),
                ),*/

                  ],
                ),
              ),
            ),

          );
        })),

    );
  }
}
