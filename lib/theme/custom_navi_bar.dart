import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sarya/theme/color_scheme.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

 const CustomNavBar(
      {Key? key,
        required this.selectedIndex,
        required this.items,
        required this.onItemSelected,});

  Widget _buildItem(
      PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      height: 100.0,
      decoration: const BoxDecoration(
          color: AppColor.aquaCasper2,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14), )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 26.0,
                  color: isSelected ? (item.activeColorPrimary ?? item.activeColorSecondary) :
                  item.inactiveColorPrimary ?? item.activeColorPrimary),
              child: item.icon,
            ),
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.aquaCasper2,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14), )
      ),
      child: SizedBox(
        width: double.infinity,
        height: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            var index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  onItemSelected(index);
                },
                child: _buildItem(
                    item, selectedIndex == index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
