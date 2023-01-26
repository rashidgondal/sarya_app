import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarya/customWidgets/dialoge_share_user_name.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/text_decorated_icon.dart';
import '../../locator.dart';
import '../../navigation/navigation_service.dart';
import '../../navigation/router_path.dart';

class SettingsHome extends StatefulWidget {
  const SettingsHome({Key? key}) : super(key: key);

  @override
  State<SettingsHome> createState() => _SettingsHomeState();
}

class _SettingsHomeState extends State<SettingsHome> {



  late NavigationService _navigationService;

  @override
  void initState() {
    super.initState();

    _navigationService = locator<NavigationService>();
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
            title: const Text(
              "Settings",
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
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: () {
                        _navigationService.navigateTo(nameSettingRoute);
                      },
                      child: TextDecoratedContainer(
                        titleWidget: const Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'user'.svg,
                              height: 16.0,
                              width: 16.0,
                            ),
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: () {
                        _navigationService.navigateTo(avatarSettingRoute);

                      },
                      child: TextDecoratedContainer(
                        titleWidget: const Text(
                          'Avatar',
                          style: TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'user'.svg,
                              height: 16.0,
                              width: 16.0,
                            ),
                          ],
                        ),
                      )),
                ),
             /*   InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            const ShareUsername());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: InkWell(
                        onTap: () {},
                        child: TextDecoratedContainer(
                          titleWidget: const Text(
                            'Share Username',
                            style: TextStyle(
                                fontSize: 15.0, color: AppColor.headingColor2),
                          ),
                          iconImage: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'username'.svg,
                              ),
                            ],
                          ),
                        )),
                  ),
                ),*/
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: () {
                        _navigationService.navigateTo(mobileSettingRoute);

                      },
                      child: TextDecoratedContainer(
                        titleWidget: const Text(
                          'Mobile Number',
                          style: TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'mobile'.svg,
                            ),
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: () {
                        _navigationService.navigateTo(emailSettingRoute);

                      },
                      child: TextDecoratedContainer(
                        titleWidget: const Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'email'.svg,
                              height: 16.0,
                              width: 16.0,
                            ),
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: () {
                        _navigationService.navigateTo(passwordSettingRoute);

                      },
                      child: TextDecoratedContainer(
                        titleWidget: const Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'lock'.svg,
                            ),
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: () {
                        _navigationService.navigateTo(birthdaySettingRoute);

                      },
                      child: TextDecoratedContainer(
                        titleWidget: const Text(
                          'Birthday',
                          style: TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'birthday'.svg,
                            ),
                          ],
                        ),
                      )),
                ),
/*
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: () {},
                      child: TextDecoratedContainer(
                          titleWidget: const Text(
                            'Notifications',
                            style: TextStyle(
                                fontSize: 15.0, color: AppColor.headingColor2),
                          ),
                          iconImage: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'notification'.svg,
                              ),
                            ],
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: () {},
                      child: TextDecoratedContainer(
                        titleWidget: const Text(
                          'Help',
                          style: TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'help'.svg,
                            ),
                          ],
                        ),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
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
                        "Who can",
                        style: TextStyle(
                            fontSize: 14, color: AppColor.headingColor2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: () {},
                      child: TextDecoratedContainer(
                        titleWidget: const Text(
                          'Contact me',
                          style: TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'contacts'.svg,
                            ),
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: () {},
                      child: TextDecoratedContainer(
                        titleWidget: const Text(
                          'Send me notifications',
                          style: TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'notification'.svg,
                            ),
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                      onTap: () {},
                      child: TextDecoratedContainer(
                        titleWidget: const Text(
                          'See my location',
                          style: TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        iconImage: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'flag'.svg,
                              height: 16,
                              width: 16,
                            ),
                          ],
                        ),
                      )),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
