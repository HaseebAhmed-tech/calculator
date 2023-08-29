import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/chi_styles.dart';
import '../card/chi_card.dart';

class CHIDropDownBottomSheet extends StatelessWidget {
  final String title;
  final String? prefixIcon;
  final List<String> items;
  final Function onTap;
  final int? selectedIndex;
  final bool isHistorical;
  const CHIDropDownBottomSheet({
    super.key,
    required this.title,
    this.prefixIcon,
    required this.items,
    required this.onTap,
    this.selectedIndex,
    this.isHistorical = false,
  });

  @override
  Widget build(BuildContext context) {
    return !isHistorical
        ? CHICard(
            height: 56,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  if (prefixIcon != null) SvgPicture.asset(prefixIcon!, color: CHIStyles.lightGreyColor),
                  if (prefixIcon != null) const SizedBox(width: 16),
                  Text(
                    selectedIndex == null ? title : items[selectedIndex!],
                    style: selectedIndex == null
                        ? CHIStyles.mdNormalStyle.copyWith(color: CHIStyles.primaryTextColorLight)
                        : CHIStyles.mdNormalStyle,
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/icons/arrow_down.svg', fit: BoxFit.scaleDown)
                ],
              ),
            ),
            onTap: () => androidBottomSheetContent(context,
                title: title, items: items, onTap: onTap, selectedIndex: selectedIndex)
            // Platform.isAndroid
            // ? androidBottomSheetContent(context,
            //     title: title, items: items, onTap: onTap, selectedIndex: selectedIndex)
            // : iosBottomSheetContent(context, title: title, items: items, onTap: onTap)
            )
        : GestureDetector(
            onTap: () {
              androidBottomSheetContent(context,
                  title: title, items: items, onTap: onTap, selectedIndex: selectedIndex);
              // Platform.isAndroid
              //     ? androidBottomSheetContent(context,
              //         title: title, items: items, onTap: onTap, selectedIndex: selectedIndex)
              //     : iosBottomSheetContent(context, title: title, items: items, onTap: onTap);
            },
            child: Container(
              decoration: BoxDecoration(color: CHIStyles.primaryLightColor, borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  selectedIndex == null ? title : items[selectedIndex!],
                  style: CHIStyles.mdMediumStyle.copyWith(color: CHIStyles.primaryColor),
                ),
              ),
            ),
          );
  }
}

Future<dynamic> androidBottomSheetContent(context,
    {required String title, required List<String> items, required Function onTap, int? selectedIndex}) {
  return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            sheetHeader(title),
            Flexible(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CHICard(
                          height: 56,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(items[index], style: CHIStyles.mdNormalStyle),
                              selectedIndex == index
                                  ? const Icon(Icons.done, color: Color.fromRGBO(0x4d, 0x4d, 0x4d, 1.0), size: 20.0)
                                  : const SizedBox.shrink(),
                            ],
                          ),
                          onTap: () {
                            onTap(index);
                            // Navigator.pop(context);
                          },
                        ),
                        const SizedBox(height: 8),
                      ],
                    );
                  }),
            )
          ],
        );
      });
}

Future<dynamic> iosBottomSheetContent(BuildContext context,
    {required String title, required List<String> items, required Function onTap, int? selectedIndex}) {
  return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            for (int index = 0; index < items.length; index++) ...{
              CupertinoActionSheetAction(
                onPressed: () {
                  onTap(index);
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(items[index]),
                    selectedIndex == index
                        ? const Icon(Icons.done, color: Color.fromRGBO(0x4d, 0x4d, 0x4d, 1.0), size: 20.0)
                        : const SizedBox.shrink(),
                  ],
                ),
              )
            }
          ],
          cancelButton: const SizedBox(),
          title: Text(title),
        );
      });
}

Widget sheetHeader(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Center(child: Text(title, style: CHIStyles.mdNormalStyle)),
  );
}
