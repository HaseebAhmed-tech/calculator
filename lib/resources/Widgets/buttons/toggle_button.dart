import 'package:flutter/material.dart';

import '../../constants/chi_styles.dart';

Widget toogleButton(List<Widget> widgets, void Function(int) onPressed, List<bool> values) {
  return ToggleButtons(
    isSelected: values,
    onPressed: onPressed,
    borderRadius: const BorderRadius.all(Radius.circular(24)),
    selectedBorderColor: Colors.blue[700],
    selectedColor: CHIStyles.whiteColor,
    fillColor: CHIStyles.primaryColor,
    constraints: const BoxConstraints(
      minHeight: 45.0,
      minWidth: 120.0,
    ),
    children: widgets,
  );
}
