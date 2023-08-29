import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/chi_styles.dart';

class CHITextField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final bool autoFocus;
  final bool mandatory;
  final bool enabled;
  final List<TextInputFormatter>? inputFormat;
  final String hintText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLine;
  final FocusNode? focusNode;
  final Function(String?)? onSaved;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool enableInteractiveSelection;
  final bool obscureText;
  final Widget? suffixIcon;
  final Color? cursorColor;
  final bool enableHeading;
  final String heading;
  final bool enableSuggestions;
  final bool autocorrect;
  final EdgeInsets scrollPadding;
  final AutovalidateMode? autovalidateMode;
  final void Function(String?)? onChanged;
  const CHITextField({
    Key? key,
    this.controller,
    this.enabled = true,
    required this.hintText,
    this.prefixIcon,
    this.inputFormat,
    this.autoFocus = false,
    this.mandatory = false,
    this.keyboardType,
    this.maxLength,
    this.maxLine = 1,
    this.focusNode,
    this.enableInteractiveSelection = true,
    this.onSaved,
    this.onEditingComplete,
    this.textInputAction,
    this.validator,
    this.initialValue,
    this.suffixIcon,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.enableHeading = false,
    this.heading = 'Heading',
    this.obscureText = false,
    this.cursorColor,
    this.scrollPadding = const EdgeInsets.all(20),
    this.onChanged,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: enableHeading,
          child: Text.rich(TextSpan(
              text: heading,
              style: CHIStyles.smMediumStyle,
              children: <InlineSpan>[
                if (mandatory)
                  TextSpan(
                      text: '*',
                      style: TextStyle(color: CHIStyles.darkErrorColor))
              ])),
        ),
        SizedBox(height: enableHeading ? 6 : 0),
        SingleChildScrollView(
          child: IntrinsicHeight(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12),
                  height: maxLine == 1 ? 56 : double.infinity,
                  decoration: BoxDecoration(
                    color: CHIStyles.cardColor,
                    border: CHIStyles.cardBorder,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: CHIStyles.cardShadow,
                  ),
                ),
                TextFormField(
                  autovalidateMode: autovalidateMode,
                  enabled: enabled,
                  autofocus: autoFocus,
                  focusNode: focusNode,
                  onSaved: onSaved,
                  obscureText: obscureText,
                  validator: validator,
                  scrollPadding: scrollPadding,
                  initialValue: initialValue,
                  textInputAction: textInputAction,
                  onChanged: onChanged,
                  cursorColor: cursorColor,
                  onEditingComplete: onEditingComplete,
                  controller: controller,
                  maxLength: maxLength,
                  maxLines: maxLine,
                  enableSuggestions: enableSuggestions,
                  autocorrect: autocorrect,
                  enableInteractiveSelection: enableInteractiveSelection,
                  inputFormatters: inputFormat,
                  style: CHIStyles.mdNormalStyle,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    prefixIcon: prefixIcon,
                    border: InputBorder.none,

                    suffixIconColor: CHIStyles.primaryColor,
                    // focusedBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(
                    //         color: CHIStyles.primaryColor, width: 2)),
                    errorStyle: TextStyle(color: CHIStyles.primaryErrorColor),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: MediaQuery.of(context).size.height * 0.024),
                    hintText: hintText,
                    suffixIcon: suffixIcon,
                    hintStyle: CHIStyles.mdNormalStyle
                        .copyWith(color: CHIStyles.lightGreyColor),
                    counterText: '',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
