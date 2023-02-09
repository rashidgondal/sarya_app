import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sarya/customWidgets/dialoge_bank_help.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../authentication/signup/signup_widget/bottom_sheet_country_picker.dart';
import '../../customWidgets/custom_text_field.dart';
import '../../customWidgets/text_decorated_icon.dart';
import '../../helper/shared_prefs.dart';
import '../../locator.dart';
import '../../navigation/navigation_service.dart';
import '../../navigation/router_path.dart';
import 'bank_update.dart';

class BankDetail extends StatefulWidget {
  const BankDetail({Key? key}) : super(key: key);

  @override
  State<BankDetail> createState() => _BankDetailState();
}

class _BankDetailState extends State<BankDetail> {


  String countryName = '', bankName ='', beneName ='', accountNo ='', iban ='', swiftCode='';
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

    list = await pref.getCountries();
    Map map = await pref.getUser();
    countryName =   map['bankDetails']['country'] ?? '';
    bankName    =   map['bankDetails']['name'] ?? '';
    beneName    =   map['bankDetails']['beneficiary'] ?? '';
    accountNo   =   map['bankDetails']['accountNo'] ?? '';
    iban        =   map['bankDetails']['iban'] ?? '';
    swiftCode   =   map['bankDetails']['swiftCode'] ?? '';

    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.whiteColor,
          bottomNavigationBar: Container(
            height: 100,
            color: AppColor.whiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    _navigationService.navigateTo(bankUpdateRoute)!.then((value) {
                      getUserInfo();
                    });
                  },
                  child: Container(
                    height: 46.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text(
                        "Update",
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
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 60,
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
              "Bank Detail",
              style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
            ),
            centerTitle: true,

          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                 /* InkWell(
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
                              countryName: (v) {
                                countryName = v;

                              },
                              countryTel: (v) {
                              },
                              nationality: (v) {},
                            )),
                      ).then((value) {
                        setState(() {});
                      });
                    },
                    child: TextDecoratedContainer(
                      titleWidget: Text(
                        countryName.isEmpty ? 'Country' : '$countryName',
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
                    ),
                  ),*/
                  TextDecoratedContainer(
                    titleWidget: Text(
                     '$countryName',
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
                  ),
                  TextDecoratedContainer(
                    titleWidget: Text(
                      bankName,
                      style: TextStyle(
                          fontSize: 15.0, color: AppColor.headingColor2),
                    ),
                    iconImage: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("bank_name".svg, height: 16,width: 16,)
                      ],
                    ),
                  ),
                  TextDecoratedContainer(
                    titleWidget: Text(
                      beneName,
                      style: TextStyle(
                          fontSize: 15.0, color: AppColor.headingColor2),
                    ),
                    iconImage: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("benificiary_name".svg, height: 16,width: 16,)
                      ],
                    ),
                  ),
                  TextDecoratedContainer(
                    titleWidget: Text(
                      accountNo,
                      style: TextStyle(
                          fontSize: 15.0, color: AppColor.headingColor2),
                    ),
                    iconImage: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("accont_name".svg, height: 16,width: 106,)
                      ],
                    ),
                  ),
                   TextDecoratedContainer(
                    titleWidget: Text(
                      iban,
                      style: TextStyle(
                          fontSize: 15.0, color: AppColor.headingColor2),
                    ),
                    iconImage: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("iban_no".svg, height: 16,width: 16,)
                      ],
                    ),
                  ),
                   TextDecoratedContainer(
                    titleWidget: Text(
                      swiftCode,
                      style: TextStyle(
                          fontSize: 15.0, color: AppColor.headingColor2),
                    ),
                    iconImage: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("swift_code".svg, height: 16,width: 16,)
                      ],
                    ),
                  ),
             ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Stack customWidgetDropDown({required title, required Size size, }) {
    return Stack(
      children: [
        SizedBox(
          height: 80.0,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    height: 54.0,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border:
                        Border.all(color: AppColor.borderColor2, width: 1)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColor.lightIndigo,
                          size: 20,
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 60,
          left: 20,
          child: Container(
            color: AppColor.whiteColor,
            height: 20,
            width: 30,
            child: const Icon(
              Icons.question_mark,
              size: 15,
              color: AppColor.headingColor2,
            ),
          ),
        ),
      ],
    );
  }


}
