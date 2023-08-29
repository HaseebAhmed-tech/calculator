import 'package:flutter/material.dart';

import '../../constants/chi_styles.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isDark => themeMode == ThemeMode.dark;
  changeAppTheme(String theme) {
    if (theme == 'dark') {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    _updateColorScheme();
    notifyListeners();
  }

  _updateColorScheme() {
    if (themeMode == ThemeMode.dark) {
      _updateDarkColors();
      _updateTextColors(Colors.white);
    } else {
      _updateLightColors();
      _updateTextColors(CHIStyles.primaryTextColor);
    }
  }

  _updateDarkColors() {
    CHIStyles.cardBorder = null;
    CHIStyles.cardColor = const Color(0xff202020);
    CHIStyles.primaryTextColor = const Color(0xffFFFFFF);
    CHIStyles.primaryLightColor = const Color(0xff0B4A6F);
    CHIStyles.iconColor = const Color(0xffE0F2FE);
    CHIStyles.primaryErrorColor = const Color(0xffFEE4E2);
    CHIStyles.lightErrorColor = const Color(0xff7A271A);
    CHIStyles.primarySuccessColor = const Color(0xffD1FADF);
    CHIStyles.lightSuccessColor = const Color(0xff054F31);
  }

  _updateLightColors() {
    CHIStyles.cardBorder =
        Border.all(color: CHIStyles.cardBorderColor, width: 1.0);
    CHIStyles.cardColor = Colors.white;
    CHIStyles.primaryTextColor = const Color(0xff101828);
    CHIStyles.primaryLightColor = const Color(0xffE0F2FE);
    CHIStyles.iconColor = const Color(0xff0BA5EC);
    CHIStyles.primaryErrorColor = const Color(0xfff04438);
    CHIStyles.lightErrorColor = const Color(0xfffee4e2);
    CHIStyles.primarySuccessColor = const Color(0xff12B76A);
    CHIStyles.lightSuccessColor = const Color(0xffD1FADF);
  }

  _updateTextColors(Color color) {
    CHIStyles.displayXsBoldStyle =
        CHIStyles.displayXsBoldStyle.copyWith(color: color);
    CHIStyles.displayXsSemiBoldStyle =
        CHIStyles.displayXsSemiBoldStyle.copyWith(color: color);
    CHIStyles.displayXsMediumStyle =
        CHIStyles.displayXsMediumStyle.copyWith(color: color);
    CHIStyles.displayXsNormalStyle =
        CHIStyles.displayXsNormalStyle.copyWith(color: color);
    CHIStyles.xlBoldStyle = CHIStyles.xlBoldStyle.copyWith(color: color);
    CHIStyles.xlSemiBoldStyle =
        CHIStyles.xlSemiBoldStyle.copyWith(color: color);
    CHIStyles.xlMediumStyle = CHIStyles.xlMediumStyle.copyWith(color: color);
    CHIStyles.xlNormalStyle = CHIStyles.xlNormalStyle.copyWith(color: color);
    CHIStyles.lgBoldStyle = CHIStyles.lgBoldStyle.copyWith(color: color);
    CHIStyles.lgSemiBoldStyle =
        CHIStyles.lgSemiBoldStyle.copyWith(color: color);
    CHIStyles.lgMediumStyle = CHIStyles.lgMediumStyle.copyWith(color: color);
    CHIStyles.lgNormalStyle = CHIStyles.lgNormalStyle.copyWith(color: color);
    CHIStyles.mdBoldStyle = CHIStyles.mdBoldStyle.copyWith(color: color);
    CHIStyles.mdSemiBoldStyle =
        CHIStyles.mdSemiBoldStyle.copyWith(color: color);
    CHIStyles.mdMediumStyle = CHIStyles.mdMediumStyle.copyWith(color: color);
    CHIStyles.mdNormalStyle = CHIStyles.mdNormalStyle.copyWith(color: color);
    CHIStyles.smBoldStyle = CHIStyles.smBoldStyle.copyWith(color: color);
    CHIStyles.smSemiBoldStyle =
        CHIStyles.smSemiBoldStyle.copyWith(color: color);
    CHIStyles.smMediumStyle = CHIStyles.smMediumStyle.copyWith(color: color);
    CHIStyles.smNormalStyle = CHIStyles.smNormalStyle.copyWith(color: color);
    CHIStyles.xsBoldStyle = CHIStyles.xsBoldStyle.copyWith(color: color);
    CHIStyles.xsSemiBoldStyle =
        CHIStyles.xsSemiBoldStyle.copyWith(color: color);
    CHIStyles.xsMediumStyle = CHIStyles.xsMediumStyle.copyWith(color: color);
    CHIStyles.xsNormalStyle = CHIStyles.xsNormalStyle.copyWith(color: color);
  }
}
