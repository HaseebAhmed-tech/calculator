import 'package:flutter/material.dart';

class CHIStyles {
  //PRIMARY COLORS
  static Color primaryLightColor = const Color.fromARGB(255, 68, 246, 255);
  static Color primaryColor = const Color(0xff19173D);
  static Color secondryColor = const Color(0xff7B78AA);

//GREY COLORS
  static Color cardBorderColor = const Color(0xfff2f4f7);
  static Color lightGreyColor = const Color(0xff98A2B3);
  static Color primaryTextColorLight = Colors.white;
  static Color secondryTextColorLight = const Color(0xff7B78AA);
// Color primaryTextColor = const Color(0xff1d2939);
  static Color primaryTextColor = Colors.white;
  static Color iconColor = Colors.white;

//ERROR COLORS

  static Color whiteColor = Colors.white;
  static Color appBgColor = const Color(0xfffcfcfd);
  static Color chatBubbleTextClr =
      const Color(0xff667085); // using for custom_Subscription_vu...
  static Color cardColor = const Color(0xffFFFFFF);
  static Color checkboxTextColor = Colors.black;
  static Color scaffoldLBackgroundColor = const Color(0xff19173D);
  static Color scaffoldDBackgroundColor = const Color(0xff121212);

  static Color darkSuccessColor = const Color(0xff05603A);
  static Color primarySuccessColor = const Color(0xff12B76A);
  static Color lightSuccessColor = const Color(0xffD1FADF);
  static Color darkErrorColor = const Color(0xff912018);
  static Color primaryErrorColor = const Color(0xfff04438);
  static Color lightErrorColor = const Color(0xfffee4e2);
  static Color primaryWraningColor = const Color(0xffF79009);
  static Color lightWraningColor = const Color(0xffFEF0C7);

//WARNING COLORS
  // static Color darkWarningColor = const Color(0xff05603A);
  static Color primaryWarningColor = const Color(0xfff79009);
  static Color lightWarningColor = const Color(0xffFEF0C7);

//TEXT STYLES

// BORDERS
  static OutlineInputBorder chiOutlineBorder =
      OutlineInputBorder(borderSide: BorderSide(color: primaryTextColorLight));
  static Border? cardBorder = Border.all(color: cardBorderColor, width: 1.0);
  static BorderRadius cardRadius = BorderRadius.circular(16);

// Shadow
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      offset: const Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
      color: const Color(0xff101828).withOpacity(0.05),
    ),
  ];
  static TextStyle displayXsBoldStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 24,
  );
  static TextStyle displayXxlBoldStyle = TextStyle(
      color: primaryTextColor, fontSize: 40, fontWeight: FontWeight.w600);
  static TextStyle displayXxlSemiBoldStyle = TextStyle(
      color: primaryTextColor, fontSize: 35, fontWeight: FontWeight.w400);
  static TextStyle displayXsBoldStyleWhite = const TextStyle(
    color: Colors.white,
    fontSize: 24,
  );
  static TextStyle displayXsSemiBoldStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 24,
  );
  static TextStyle displayXsMediumStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 24,
  );
  static TextStyle displayXsMediumStyleGrey = TextStyle(
    color: CHIStyles.lightGreyColor,
    fontSize: 24,
  );
  static TextStyle displayXsNormalStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 24,
  );
  static TextStyle xlBoldStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 20,
  );
  static TextStyle xlSemiBoldStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 20,
  );
  static TextStyle xlMediumStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 20,
  );
  static TextStyle xlNormalStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 20,
  );
  static TextStyle lgBoldStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 18,
  );
  static TextStyle lgBoldStyleGrey = const TextStyle(
    color: Color.fromARGB(255, 49, 49, 49),
    fontSize: 18,
  );
  static TextStyle lgSemiBoldStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 18,
  );
  static TextStyle lgMediumStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle lgNormalStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static TextStyle lgNormalStyleGrey = TextStyle(
    color: CHIStyles.lightGreyColor,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static TextStyle mdBoldStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static TextStyle mdSemiBoldStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle mdSemiBoldStyleSec = TextStyle(
    color: secondryTextColorLight,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle mdMediumStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle mdMediumStyleSec = TextStyle(
    color: secondryTextColorLight,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle mdNormalStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle mdNormalStyleGrey = TextStyle(
    color: Colors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle smBoldStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static TextStyle smSemiBoldStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle smSemiBoldStyleWhite = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static TextStyle smMediumStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle smNormalStyle = TextStyle(
    color: primaryTextColorLight,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle xsBoldStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
  static TextStyle xsSemiBoldStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
  static TextStyle xsMediumStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static TextStyle xsNormalStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  // light Theme
  static ThemeData lightThemeData() {
    return ThemeData(
      fontFamily: 'Inter',
      brightness: Brightness.light,
      primaryColor: CHIStyles.primaryColor,
      scaffoldBackgroundColor: CHIStyles.scaffoldLBackgroundColor,
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: CHIStyles.scaffoldLBackgroundColor),
    );
  }

// dark Theme
  static ThemeData darkThemeData() {
    return ThemeData(
      fontFamily: 'Inter',
      brightness: Brightness.dark,
      primaryColor: CHIStyles.primaryColor,
      scaffoldBackgroundColor: CHIStyles.scaffoldDBackgroundColor,
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: CHIStyles.scaffoldDBackgroundColor),
    );
  }
}
