import 'package:flutter/material.dart';

import '../../constants/chi_styles.dart';

class CHITabBar extends StatelessWidget {
  final int length;
  bool isScrollable;
  final List<String> tabs;
  final List<Widget> children;
  final EdgeInsets? padding;
  final bool indexed;
  final Function(int)? getIndex;
  final ScrollPhysics? physics;
  int mSelectedIndex = 0;
  CHITabBar(
      {Key? key,
      required this.length,
      this.isScrollable = false,
      required this.tabs,
      required this.children,
      this.indexed = true,
      this.getIndex,
      this.physics,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context, setState) => DefaultTabController(
              length: length,
              child: Column(
                children: [
                  Padding(
                    padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
                    child: TabBar(
                      isScrollable: isScrollable,
                      labelColor: CHIStyles.primaryColor,
                      indicatorColor: CHIStyles.primaryColor,
                      unselectedLabelStyle: CHIStyles.mdMediumStyle.copyWith(color: CHIStyles.lightGreyColor),
                      labelStyle: CHIStyles.mdMediumStyle.copyWith(color: CHIStyles.primaryColor),
                      unselectedLabelColor: CHIStyles.lightGreyColor,
                      tabs: tabs.map((tab) => Tab(text: tab)).toList(),
                      onTap: (index) {
                        setState(() {
                          mSelectedIndex = index;
                          getIndex == null ? (index) {} : getIndex!(index);
                        });
                      },
                    ),
                  ),
                  indexed
                      ? Expanded(
                          child: IndexedStack(
                            alignment: AlignmentDirectional.center,
                            index: mSelectedIndex,
                            children: children,
                          ),
                        )
                      : Expanded(
                          child: TabBarView(
                          physics: physics,
                          children: children,
                        )),
                ],
              ),
            ));
  }
}
