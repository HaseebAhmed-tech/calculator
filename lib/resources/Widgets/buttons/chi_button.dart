import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/chi_styles.dart';

class CHIButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool disabled;
  final String btnLabel;
  final bool expanded;
  final Color? color;
  final Color? labelColor;
  const CHIButton(
      {Key? key,
      this.onTap,
      required this.btnLabel,
      this.color,
      this.disabled = false,
      this.expanded = false,
      this.labelColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Container(
        width: !expanded ? MediaQuery.of(context).size.width * 0.5 : null,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        height: 48,
        decoration: BoxDecoration(
          color: color ??
              (disabled
                  ? CHIStyles.primaryTextColorLight
                  : CHIStyles.primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          btnLabel,
          style: CHIStyles.smMediumStyle
              .copyWith(color: labelColor ?? Colors.white),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}

class OutlineButton extends StatelessWidget {
  final VoidCallback? onConfirmClick;
  double? btnWidth;
  final String confirmTitle;
  Color? color = const Color.fromRGBO(0x38, 0x7b, 0x96, 1.0);
  OutlineButton(
      {required this.confirmTitle,
      this.onConfirmClick,
      this.btnWidth = 10,
      this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              shape: const StadiumBorder(),
              side:
                  BorderSide(width: 1, color: color ?? CHIStyles.primaryColor)),
          onPressed: onConfirmClick,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: btnWidth!),
            child: Text(
              confirmTitle,
              style: TextStyle(
                  color: const Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
                  fontSize: Platform.isAndroid ? 14 : 30,
                  fontWeight: FontWeight.w600),
            ).tr(),
          ),
        ),
      ],
    );
  }
}

class ProgressElevatedButton extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final Color? progressColor;
  final bool isBusy;
  final VoidCallback onPressed;
  final double? labelSize;
  final double? containerWidth;

  const ProgressElevatedButton({
    Key? key,
    required this.label,
    required this.isBusy,
    required this.onPressed,
    this.containerWidth,
    this.labelColor,
    this.progressColor = Colors.white,
    this.labelSize = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth ?? double.infinity,
      height: 52.0,
      margin: const EdgeInsets.only(top: 2.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: CHIStyles.primaryColor),
          onPressed: isBusy ? null : onPressed,
          child: isBusy
              ? CircularProgressIndicator(
                  color: progressColor,
                )
              : Text(
                  label,
                  style: TextStyle(
                      color: labelColor ?? CHIStyles.whiteColor,
                      fontSize: labelSize),
                )),
    );
  }
}
