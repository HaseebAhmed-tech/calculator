import 'package:calculator/resources/constants/chi_styles.dart';
import 'package:calculator/screens/views/basic_calc/basic_calc_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BasicClacView extends StackedView<BasicCalcViewModel> {
  const BasicClacView({super.key});

  @override
  Widget builder(
      BuildContext context, BasicCalcViewModel viewModel, Widget? child) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          showAmount(context, viewModel),
          const SizedBox(
            height: 90,
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(22, 255, 255, 255),
              child: Column(
                children: [
                  internalTabBar(viewModel),
                  viewModel.showWidget,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container showAmount(BuildContext context, BasicCalcViewModel viewModel) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: CHIStyles.secondryColor))),
      child: Text(
        '\$ ${viewModel.amount}',
        style: CHIStyles.displayXxlBoldStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  TabBar internalTabBar(BasicCalcViewModel viewModel) {
    return TabBar(
      labelStyle: CHIStyles.mdMediumStyleSec,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: CHIStyles.primaryLightColor,
      dividerColor: Colors.transparent,
      onTap: (int i) => viewModel.onTabChange(i),
      tabs: const <Widget>[
        Tab(
          text: 'Income',
        ),
        Tab(
          text: 'Expense',
        ),
        Tab(
          text: 'Transfer',
        ),
      ],
    );
  }

  @override
  BasicCalcViewModel viewModelBuilder(BuildContext context) {
    return BasicCalcViewModel();
  }
}
