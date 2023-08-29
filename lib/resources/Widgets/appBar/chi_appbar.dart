import 'package:flutter/material.dart';
import '../../constants/chi_styles.dart';
import '../../themes/app_theme/chi_theme.dart';
import '../buttons/action_button.dart';
import 'package:provider/provider.dart';

//ignore: must_be_immutable
class CHIAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool addBackButton;
  final Widget? leading;
  final List<Widget>? actions;
  final VoidCallback? onBackPress;
  final bool search;
  final Color? color;
  final Widget? searchWidget;
  final bool showWelcome;
  const CHIAppBar({
    super.key,
    required this.title,
    this.actions,
    this.onBackPress,
    this.showWelcome = false,
    this.leading,
    this.addBackButton = true,
    this.search = false,
    this.searchWidget,
    this.color,
  });

  @override
  State<CHIAppBar> createState() => _CHIAppBarState();

  @override
  Size get preferredSize => const Size(64, 64);
}

class _CHIAppBarState extends State<CHIAppBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ThemeProvider value, child) => SafeArea(
        child: widget.search
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: widget.searchWidget ?? const SizedBox(),
              )
            : Container(
                color: widget.color,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    widget.addBackButton
                        ? Positioned(
                            top: 10,
                            left: 0,
                            child: ActionButton(
                              color: CHIStyles.primaryColor,
                              icon: 'assets/icons/back.svg',
                              iconColor: CHIStyles.iconColor,
                              onTap: widget.onBackPress ??
                                  () => Navigator.pop(context),
                            ),
                          )
                        : const SizedBox(),
                    widget.showWelcome
                        ? Positioned(
                            top: 0,
                            left: 0,
                            child: Expanded(
                              child: RichText(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      text: 'Welcome ',
                                      style: CHIStyles.smNormalStyle,
                                      children: [
                                        TextSpan(
                                          text: widget.title,
                                          style: CHIStyles.xlMediumStyle,
                                        )
                                      ])),
                            ),
                          )
                        : Center(
                            child: Text(widget.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: CHIStyles.xlMediumStyle),
                          ),
                    Positioned(
                        right: 0,
                        top: 10,
                        child:
                            Row(children: widget.actions ?? [const SizedBox()]))
                  ],
                ),
              ),
      ),
    );
  }
}
