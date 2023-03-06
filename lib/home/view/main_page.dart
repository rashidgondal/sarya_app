import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/home/view/itinerary_home_screen.dart';
import 'package:sarya/theme/color_scheme.dart';
import 'package:sarya/theme/custom_navi_bar.dart';

import '../../shop/view/shop_home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PersistentTabController controller = PersistentTabController(initialIndex: 1);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView.custom(
      context,
      controller: controller,
      screens: [
        Container(),
        const ItineraryScreen(),
        const ShopScreen(),
        Container(),
        Container(),
      ],
      confineInSafeArea: true,
      backgroundColor: AppColor.whiteColor,
      onWillPop: (v) async {
        return true;
      },
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 500),
      ),
      customWidget: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
        child: CustomNavBar(
          items: _navBarsItems(),
          onItemSelected: (index) {
            setState(() {
              controller.index = index;
            });
          },
          selectedIndex: controller.index,
        ),
      ),
      itemCount: 5,
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('home_plus_icon'.svg),
        title: "",
        textStyle: const TextStyle(fontSize: 12),
        activeColorPrimary: AppColor.whiteColor,
        inactiveColorPrimary: AppColor.colorGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('home_icon_1'.svg),
        title: "",
        textStyle: const TextStyle(fontSize: 12),
        activeColorPrimary: AppColor.whiteColor,
        inactiveColorPrimary: AppColor.colorGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('home_icon_2'.svg),
        title: "",
        textStyle: const TextStyle(fontSize: 12),
        activeColorPrimary: AppColor.whiteColor,
        inactiveColorPrimary: AppColor.colorGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('home_icon_3'.svg),
        title: "",
        textStyle: const TextStyle(fontSize: 12),
        activeColorPrimary: AppColor.whiteColor,
        inactiveColorPrimary: AppColor.colorGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('home_icon_4'.svg),
        title: "",
        textStyle: const TextStyle(fontSize: 12),
        activeColorPrimary: AppColor.whiteColor,
        inactiveColorPrimary: AppColor.colorGrey,
      ),
    ];
  }
}
