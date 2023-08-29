import 'package:flutter/material.dart';

import '../../constants/chi_styles.dart';
import '../card/chi_card.dart';

class CHIRadioButton extends StatelessWidget {
  final Widget child;
  final Object value;
  final Object? groupValue;
  final double? height;
  final void Function(Object?)? onChanged;
  const CHIRadioButton(
      {super.key,
      required this.child,
      required this.value,
      this.groupValue,
      this.onChanged,
      this.height});

  @override
  Widget build(BuildContext context) {
    return CHICard(
        height: height,
        onTap: () => onChanged!(value),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            child,
            Radio(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              fillColor: MaterialStateProperty.all(CHIStyles.primaryColor),
              focusColor: CHIStyles.primaryTextColorLight,
            ),
          ],
        ));
  }
}

Widget chiRadioTile({
  required Widget child,
  required bool value,
  required Object? groupValue,
  required void Function(Object?)? onChanged,
}) {
  return CHICard(
    child: RadioListTile(
        value: value, groupValue: groupValue, onChanged: onChanged),
  );
}
