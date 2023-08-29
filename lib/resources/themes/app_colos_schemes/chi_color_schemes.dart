import 'package:flutter/material.dart';

import '../../constants/chi_styles.dart';

class ColorSchemeProvider extends ChangeNotifier {
  Color clr = Colors.black;

  Color purple() {
    CHIStyles.primaryColor = Colors.purple[600]!;
    CHIStyles.primaryLightColor = Colors.purple[200]!;
    clr = CHIStyles.primaryColor;
    debugPrint('$CHIStyles.primaryColor');
    notifyListeners();
    return clr;
  }

  green() {
    CHIStyles.primaryColor = Colors.green[600]!;
    CHIStyles.primaryLightColor = Colors.green[200]!;
    clr = CHIStyles.primaryColor;
    notifyListeners();
  }

  orange() {
    CHIStyles.primaryColor = Colors.orange[600]!;
    CHIStyles.primaryLightColor = Colors.orange[200]!;
    clr = CHIStyles.primaryColor;
    notifyListeners();
  }

  teal() {
    CHIStyles.primaryColor = Colors.orange[600]!;
    CHIStyles.primaryLightColor = Colors.orange[200]!;
    clr = CHIStyles.primaryColor;
    notifyListeners();
  }
}

enum Scheme { purple, teal, orange }
