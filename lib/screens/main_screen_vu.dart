import 'package:calculator/resources/Widgets/appBar/chi_appbar.dart';
import 'package:calculator/resources/Widgets/buttons/action_button.dart';
import 'package:calculator/resources/Widgets/scaffold/chi_scaffold.dart';
import 'package:calculator/resources/constants/chi_styles.dart';
import 'package:calculator/screens/main_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MainScreenView extends StackedView<MainScreenViewModel> {
  const MainScreenView({super.key});

  @override
  Widget builder(
      BuildContext context, MainScreenViewModel viewModel, Widget? child) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: CHIScaffold(
        appBar: CHIAppBar(
          title: 'Add',
          actions: [
            moreVertical(viewModel.onMoreTap),
          ],
        ),
        body: Stack(
          children: [
            backgroundShape(context, 250, 250,
                MediaQuery.of(context).size.height * 0.4, -50, null, null),
            backgroundShape(context, 250, 250, null, null, -25, 10),
            Column(
              children: [
                DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: TabBar(
                    labelStyle: CHIStyles.mdMediumStyleSec,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: CHIStyles.primaryLightColor,
                    dividerColor: Colors.transparent,
                    onTap: (int i) => viewModel.onTabChange(i),
                    tabs: <Widget>[
                      const Tab(
                        text: 'Bank',
                      ),
                      const Tab(
                        text: 'Shopping',
                      ),
                      Tab(
                        text: viewModel.todayDate,
                      ),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     GestureDetector(
                //         onTap: viewModel.onTapBank,
                //         child: Text("Bank", style: CHIStyles.mdMediumStyleSec)),
                //     GestureDetector(
                //         onTap: viewModel.onTapShopping,
                //         child: Text("Shopping",
                //             style: CHIStyles.mdMediumStyleSec)),
                //     GestureDetector(
                //         onTap: viewModel.onTapDate,
                //         child: Text("21/08/2023",
                //             style: CHIStyles.mdMediumStyleSec))
                //   ],
                // ),
                viewModel.showWidget
              ],
            ),
          ],
        ),
      ),
    );
  }

  Positioned backgroundShape(BuildContext context, double width, double height,
      double? top, double? left, double? right, double? bottom) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: width,
        height: height,
        decoration: const ShapeDecoration(
          color: Colors.transparent,
          shape: OvalBorder(),
          shadows: [
            BoxShadow(
              color: Color.fromARGB(147, 95, 170, 231),
              // ,
              blurRadius: 100,
              offset: Offset(0, 8),
              spreadRadius: 0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  MainScreenViewModel viewModelBuilder(BuildContext context) {
    return MainScreenViewModel();
  }
}

ActionButton moreVertical(
  void Function()? onTap,
) {
  return ActionButton(
      icon: 'assets/icons/more_vertical.svg',
      color: CHIStyles.primaryColor,
      iconColor: CHIStyles.primaryTextColor,
      onTap: onTap);
}
