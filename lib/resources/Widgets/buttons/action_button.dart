import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../constants/chi_styles.dart';
import '../../themes/app_theme/chi_theme.dart';

class ActionButton extends StatelessWidget {
  final Color? color;
  final Color? iconColor;
  final String icon;
  final VoidCallback? onTap;
  const ActionButton(
      {super.key, this.color, required this.icon, this.iconColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ThemeProvider value, child) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: color ?? CHIStyles.primaryLightColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(icon,
              color: iconColor ?? CHIStyles.iconColor, fit: BoxFit.scaleDown),
        ),
      ),
    );
  }
}
