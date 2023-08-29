import 'package:calculator/screens/views/basic_calc/basic_calc_vu.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MainScreenViewModel extends BaseViewModel {
  String todayDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  double amount = 5643.50;
  List<Widget> widgets = [
    const BasicClacView(),
    const Placeholder(),
    const Placeholder()
  ];
  Widget showWidget = const BasicClacView();

  void onMoreTap() {
    debugPrint('On More Tapped');
  }

  void onTapBank() {
    showWidget = widgets[0];
    notifyListeners();
  }

  void onTapShopping() {
    showWidget = widgets[1];
    notifyListeners();
  }

  void onTapDate() {
    showWidget = widgets[2];
    notifyListeners();
  }

  onTabChange(int i) {
    showWidget = widgets[i];
    notifyListeners();
  }
}
