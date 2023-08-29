import 'package:calculator/resources/constants/chi_styles.dart';
import 'package:flutter/material.dart';

class Utils {
  static showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  static showErrorSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(msg), backgroundColor: CHIStyles.primaryErrorColor),
    );
  }

  static showSuccessSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(msg),
          backgroundColor: const Color.fromARGB(255, 26, 88, 28)),
    );
  }
}
