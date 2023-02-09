import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sarya/customWidgets/custom_text_field.dart';
import 'package:sarya/customWidgets/data_loading.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/settings/phone/view_model/phone_cubits.dart';
import 'package:sarya/settings/phone/view_model/phone_states.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../../authentication/signup/signup_widget/bottom_sheet_country_picker.dart';
import '../../../customWidgets/text_decorated_icon.dart';
import '../../../helper/helper_methods.dart';
import '../../../helper/shared_prefs.dart';
import '../../../locator.dart';
import '../../../navigation/navigation_service.dart';
import '../model/update_phone_request.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {

  TextEditingController telCodeTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();

  String telCode = '';
  late NavigationService _navigationService;
  var list = [];

  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();
    getUserInfo();
  }

  getUserInfo() async {
    print("..........");
    SharedPrefs pref = SharedPrefs();

    list = await pref.getCountries();
    Map map = await pref.getUser();
    telCode = map['telCode'] ?? '';
    phoneTextEditingController.text = map['phone'] ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(child:
          BlocBuilder<PhoneCubits, PhoneStates>(builder: (context, state) {
            bool loading = false;

            if (state is PhoneInitial) {
          loading = false;
        }

            if (state is PhoneLoading) {
          loading = true;
        }

            if (state is PhoneLoaded) {
          loading = false;
        }

              return DataLoading(
          isLoading: loading,
          child: Scaffold(
            backgroundColor: AppColor.whiteColor,
            appBar: AppBar(
              elevation: 0,
              title: const Text(
                "Mobile No",
                style:
                    TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
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
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Container(
                  height: 50,
                  width: size.width,
                  color: AppColor.colorLiteGrey,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 40.0,
                      ),
                      Text(
                        "Account",
                        style: TextStyle(
                            fontSize: 14, color: AppColor.headingColor2),
                      ),
                    ],
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
                      telCode.isEmpty || phoneTextEditingController.text.isEmpty
                          ? null
                          : () {
                              String phone = zeroLeadValue(
                                  value: phoneTextEditingController.text);
                              UpdatePhoneRequest updateNameRequest =
                                  UpdatePhoneRequest(
                                      telCode: telCode, phone: phone);

                              context.read<PhoneCubits>().updatePhone(
                                    updatePhoneRequest: updateNameRequest,
                                    navigationService: _navigationService,
                                  );
                            },
                  child: Container(
                    height: 46.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                        color: telCode.isEmpty ||
                                phoneTextEditingController.text.isEmpty
                            ? AppColor.colorLiteGrey
                            : AppColor.aquaGreen,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: telCode.isEmpty ||
                                    phoneTextEditingController.text.isEmpty
                                ? AppColor.headingColor2
                                : AppColor.whiteColor),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => Container(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height / 1.2,
                            width: MediaQuery.of(context).size.width,
                            child: BottomSheetCountryPicker(
                              countries: list,
                              countryName: (v) {},
                              countryTel: (v) {
                                telCode = v;
                              },
                              nationality: (v) {},
                            )),
                      ).then((value) {
                        setState(() {});
                      });
                    },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextDecoratedContainer(
                          titleWidget: Text(
                            telCode.isEmpty ? 'Country' : '$telCode',
                            style: TextStyle(
                                fontSize: 15.0, color: AppColor.headingColor2),
                          ),
                          iconImage: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'flag-2'.svg,
                                height: 16,
                                width: 16,
                              ),
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: CustomTextField(
                      maxLine: 1,
                      textEditingController: phoneTextEditingController,
                      size: size,
                      textInputType: TextInputType.phone,
                      hintText: '',
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'mobile'.svg,
                          ),
                        ],
                      ),
                    ),
                  ),

                  /*  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        const Text(
                          "Let friends find me by my mobile number",
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
