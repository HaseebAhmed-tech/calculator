import 'package:calculator/resources/constants/chi_styles.dart';
import 'package:calculator/screens/views/basic_calc/income/income_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class IncomeView extends StackedView<IncomeViewModel> {
  const IncomeView({super.key});

  @override
  @override
  Widget builder(
      BuildContext context, IncomeViewModel viewModel, Widget? child) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('7', style: CHIStyles.displayXxlSemiBoldStyle),
                    Text('8', style: CHIStyles.displayXxlSemiBoldStyle),
                    Text('9', style: CHIStyles.displayXxlSemiBoldStyle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('4', style: CHIStyles.displayXxlSemiBoldStyle),
                    Text('5', style: CHIStyles.displayXxlSemiBoldStyle),
                    Text('6', style: CHIStyles.displayXxlSemiBoldStyle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('1', style: CHIStyles.displayXxlSemiBoldStyle),
                    Text('2', style: CHIStyles.displayXxlSemiBoldStyle),
                    Text('3', style: CHIStyles.displayXxlSemiBoldStyle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('0', style: CHIStyles.displayXxlSemiBoldStyle),
                    Text('.', style: CHIStyles.displayXxlBoldStyle),
                    SvgPicture.asset('assets/icons/clear.svg'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset('assets/icons/tick.svg'),
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Color.fromARGB(32, 0, 0, 0),
            width: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset('assets/icons/calender-large.svg'),
                SvgPicture.asset('assets/icons/layout-grid.svg'),
                SvgPicture.asset('assets/icons/balance.svg'),
                SvgPicture.asset('assets/icons/file.svg'),
                symbolSvg(),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  IncomeViewModel viewModelBuilder(BuildContext context) {
    return IncomeViewModel();
  }

  SizedBox symbolSvg() {
    return SizedBox(
      height: 35,
      width: 34,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/divide.svg'),
              const SizedBox(
                width: 2,
              ),
              SvgPicture.asset('assets/icons/multiply.svg'),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              SvgPicture.asset('assets/icons/minus.svg'),
              const SizedBox(
                width: 2,
              ),
              SvgPicture.asset('assets/icons/plus.svg'),
            ],
          ),
        ],
      ),
    );
  }
}
