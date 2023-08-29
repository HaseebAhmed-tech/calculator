import 'package:flutter/material.dart';

import '../../constants/chi_styles.dart';
import '../card/chi_card.dart';

class CHICheckBox extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  const CHICheckBox({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      width: 16,
      child: _themeBox(value, onChanged),
    );
  }
}

Theme _themeBox(bool value, void Function(bool?)? onChanged) {
  return Theme(
    data: ThemeData(unselectedWidgetColor: CHIStyles.lightGreyColor),
    child: Checkbox(
      activeColor: CHIStyles.primaryColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xff98A2B3)),
        borderRadius: BorderRadius.circular(4),
      ),
      value: value,
      onChanged: onChanged,
    ),
  );
}

class CHICheckBoxTile extends StatelessWidget {
  final Widget child;
  final bool value;
  final void Function(bool? val)? onChanged;
  const CHICheckBoxTile(
      {super.key, required this.child, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CHICard(
      padding: const EdgeInsets.only(left: 12),
      child: CheckboxListTile(
        activeColor: CHIStyles.primaryColor,
        checkboxShape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xff98A2B3)),
          borderRadius: BorderRadius.circular(4),
        ),
        contentPadding: EdgeInsets.zero,
        visualDensity: const VisualDensity(horizontal: -1, vertical: -1),
        value: value,
        onChanged: onChanged,
        title: child,
      ),
      // CHICheckBox(value: value, onChanged: onChanged),
    );
  }
}
