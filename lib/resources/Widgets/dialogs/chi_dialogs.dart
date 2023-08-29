import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/chi_styles.dart';
import '../buttons/chi_button.dart';
import '../card/chi_card.dart';
import '../selection_buttons/chi_check_box.dart';

// import '../../app/screens/command_center/observations/model/escalation_model.dart';

class CHIDialogs {
  static final CHIDialogs _instance = CHIDialogs();

  static showSuccessAlert(BuildContext context,
      {required String title,
      required String message,
      VoidCallback? onCancel,
      bool enableCancelButton = false,
      String? okButtonLabel,
      VoidCallback? onConfirm}) {
    return _instance._showCustomAlert(
      context,
      title: title,
      message: message,
      icon: 'assets/icons/success_icon.svg',
      okButtonLabel: okButtonLabel ?? 'Ok',
      onCancel: onCancel,
      enableCancelButton: enableCancelButton,
      onConfirm: onConfirm,
    );
  }

  static showWarningAlert(BuildContext context,
      {required String title,
      required String message,
      String? okButtonLabel,
      VoidCallback? onCancel,
      bool enableCancelButton = false,
      VoidCallback? onConfirm}) {
    return _instance._showCustomAlert(
      context,
      title: title,
      message: message,
      okButtonLabel: okButtonLabel ?? 'Yes',
      onCancel: onCancel,
      enableCancelButton: enableCancelButton,
      onConfirm: onConfirm,
    );
  }

  static showErrorAlert(
    BuildContext context, {
    required String title,
    required String message,
    String? okButtonLabel,
    VoidCallback? onCancel,
    bool enableCancelButton = false,
    VoidCallback? onConfirm,
  }) {
    return _instance._showCustomAlert(
      context,
      title: title,
      message: message,
      icon: 'assets/icons/error_icon.svg',
      okButtonLabel: okButtonLabel ?? 'Ok',
      okButtonColor: const Color(0xffF04438),
      onCancel: onCancel,
      enableCancelButton: enableCancelButton,
      onConfirm: onConfirm,
    );
  }

  static showFilterDialog(
    context, {
    String? title,
    required List<Filter> filterList,
    required Function(List<String>?) onApply,
    required VoidCallback onCancel,
  }) async {
    List<String> filters = [];
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          insetPadding: const EdgeInsets.all(12),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          actionsPadding: const EdgeInsets.all(8),
          titlePadding: const EdgeInsets.all(16),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title ?? 'Filter',
              textAlign: TextAlign.center,
              style: CHIStyles.lgMediumStyle,
            ).tr(),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.shortestSide,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: filterList
                    .map((data) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: CHICheckBoxTile(
                            value: data.isSelected,
                            child: Text(
                                data.label! == 'Un Remark'
                                    ? 'Normal'
                                    : data.label!,
                                style: CHIStyles.mdNormalStyle),
                            onChanged: (val) {
                              setState(() => data.isSelected = val!);
                            },
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: CHIButton(
                          btnLabel: 'CANCEL',
                          expanded: true,
                          color: const Color(0xffF04438),
                          onTap: onCancel)),
                  const SizedBox(width: 16),
                  Expanded(
                      child: CHIButton(
                          btnLabel: 'APPLY',
                          expanded: true,
                          onTap: () {
                            filters.clear();
                            for (var f in filterList) {
                              if (f.isSelected) {
                                filters.add(f.label!);
                              }
                            }
                            onApply(filters);
                          })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showCustomAlert(
    context, {
    required String title,
    required String message,
    String? icon,
    bool enableCancelButton = false,
    Color? okButtonColor,
    String okButtonLabel = 'Ok',
    String cancelButtonLabel = 'Cancel',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        insetPadding: const EdgeInsets.all(16),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            icon != null
                ? SvgPicture.asset(icon, fit: BoxFit.scaleDown)
                : const SizedBox(),
            const SizedBox(height: 16),
            Text(title,
                    textAlign: TextAlign.center, style: CHIStyles.lgMediumStyle)
                .tr(),
          ],
        ),
        content: Builder(builder: (context) {
          return SizedBox(
            width: MediaQuery.of(context).size.shortestSide,
            child: Text(message,
                    textAlign: TextAlign.center,
                    style: CHIStyles.smNormalStyle
                        .copyWith(color: const Color(0xff667085)))
                .tr(),
          );
        }),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CHIButton(
              btnLabel: okButtonLabel,
              expanded: true,
              color: okButtonColor,
              onTap: onConfirm ?? () => Navigator.pop(context),
            ),
          ),
          SizedBox(height: enableCancelButton ? 12 : 16),
          Visibility(
            visible: enableCancelButton,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: CHICard(
                  height: 48,
                  onTap: onCancel ?? () => Navigator.pop(context),
                  child: Text(
                    cancelButtonLabel,
                    style: CHIStyles.mdMediumStyle,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  static showProgress(BuildContext context,
      {String title = 'Loading please wait'}) {
    showPlatformDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: PlatformAlertDialog(
          material: (_, __) => MaterialAlertDialogData(
            insetPadding: const EdgeInsets.all(10),
          ),
          content: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: Row(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(width: 20),
                Text(
                  title,
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 13, overflow: TextOverflow.ellipsis),
                ).tr(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static createSelectAlert(
    context, {
    required String title,
    Color? btnColor,
    Color? labelColor,
    required String firstButtonLabel,
    required String secondButtonLabel,
    VoidCallback? onFirstButtonPressed,
    VoidCallback? onSecondButtonPressed,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        insetPadding: const EdgeInsets.all(16),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 5),
              Text(title,
                      textAlign: TextAlign.center,
                      style: CHIStyles.lgMediumStyle)
                  .tr(),
              const SizedBox(
                height: 20,
              ),
              CHIButton(
                btnLabel: firstButtonLabel,
                expanded: true,

                onTap: onFirstButtonPressed ?? () => Navigator.pop(context),
                // labelColor: labelColor,
              ),
              const SizedBox(
                height: 15,
              ),
              CHIButton(
                btnLabel: secondButtonLabel,
                expanded: true,
                onTap: onSecondButtonPressed ?? () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

hideProgress(context) {
  Navigator.pop(context);
}

class Filter {
  String? label;
  bool isSelected;
  Filter({this.label, this.isSelected = false});
}
