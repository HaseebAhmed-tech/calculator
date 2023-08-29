import 'package:flutter/material.dart';

import '../../constants/chi_styles.dart';

class LoadingButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isLoading;
  final String btnLabel;
  final bool expanded;
  final BoxShape shape;
  const LoadingButton({
    Key? key,
    this.onTap,
    required this.btnLabel,
    this.isLoading = false,
    this.expanded = false,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: shape == BoxShape.circle
            ? 75
            : !expanded
                ? MediaQuery.of(context).size.width * 0.5
                : null,
        height: shape == BoxShape.circle ? 75 : 48,
        decoration: BoxDecoration(
          color: CHIStyles.primaryColor,
          shape: shape,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(color: CHIStyles.whiteColor)
              : Text(
                  btnLabel,
                  style: CHIStyles.mdMediumStyle.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
