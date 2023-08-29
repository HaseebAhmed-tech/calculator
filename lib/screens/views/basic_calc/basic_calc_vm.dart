import 'package:calculator/screens/views/basic_calc/income/income_vu.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BasicCalcViewModel extends BaseViewModel {
  double amount = 5643.50;
  List<Widget> widgets = [
    const IncomeView(),
    const Placeholder(),
    const Placeholder()
  ];
  Widget showWidget = const IncomeView();
  onTabChange(int i) {
    showWidget = widgets[i];
    notifyListeners();
    debugPrint('$i');
  }
}
