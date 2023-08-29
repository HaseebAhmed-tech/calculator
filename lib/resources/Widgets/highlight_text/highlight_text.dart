import 'package:calculator/resources/constants/chi_styles.dart';
import 'package:flutter/material.dart';

class CHIHighlightText extends StatelessWidget {
  const CHIHighlightText(
      {super.key,
      required this.title,
      this.color,
      this.textColor,
      required this.condition});
  final String title;
  final Color? color;
  final Color? textColor;
  final String condition;

  @override
  Widget build(BuildContext context) {
    if (condition == 'approved') {
      return Container(
        // width: 80,
        height: 23,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: ShapeDecoration(
          color: Colors.green.shade50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
    } else if (condition == 'Processing') {
      return Container(
        // width: 80,
        height: 23,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: ShapeDecoration(
          color: CHIStyles.secondryTextColorLight,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CHIStyles.primaryColor,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      // width: 80,
      height: 23,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: ShapeDecoration(
        color: color ?? Colors.red.shade50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor ?? Colors.red,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
