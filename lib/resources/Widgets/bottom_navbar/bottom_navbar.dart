import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/chi_styles.dart';

class CHIBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  // final List<Widget> widgets;
  final List<String> icons;
  final List<String> labels;
  final void Function(int)? itemChanged;
  const CHIBottomNavigationBar(
      {super.key,
      required this.currentIndex,
      this.itemChanged,
      // required this.widgets,
      required this.icons,
      required this.labels});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: PlatformNavBar(
        material: (context, platform) {
          return MaterialNavBarData(
              selectedItemColor: CHIStyles.primaryColor,
              unselectedItemColor: CHIStyles.primaryTextColor,
              type: BottomNavigationBarType.fixed);
        },
        cupertino: (context, platform) {
          return CupertinoTabBarData();
        },
        currentIndex: currentIndex,
        itemChanged: itemChanged,
        backgroundColor: CHIStyles.whiteColor,
        // items: items.map((item) => BottomNavigationBarItem(icon: SvgPicture.asset(item.icon),label: item.label)).toList(),
        items: [
          for (int item = 0; item < icons.length; item++) ...{
            BottomNavigationBarItem(
              icon: SvgPicture.asset(icons[item],
                  color: CHIStyles.primaryTextColor),
              label: labels[item],
              activeIcon:
                  SvgPicture.asset(icons[item], color: CHIStyles.primaryColor),
            )
          }
        ],
      ),
    );
  }
}
