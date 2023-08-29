import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/chi_styles.dart';
import '../card/chi_card.dart';

class CHIDateRangePicker extends StatelessWidget {
  CHIDateRangePicker(
      {super.key,
      required this.title,
      required this.onGetRanges,
      required this.format,
      this.icon});
  List<String>? ranges;
  String title;
  String format;
  String? icon;
  Function(List<int?>) onGetRanges;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return CHICard(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                ranges == null
                    ? 'Select Date Range'
                    : '${ranges![0]}  -  ${ranges![1]}',
                style: CHIStyles.mdNormalStyle.copyWith(
                    color: ranges == null
                        ? CHIStyles.primaryTextColorLight
                        : CHIStyles.primaryTextColor)),
            SvgPicture.asset(icon ?? 'assets/icons/calender.svg',
                fit: BoxFit.scaleDown),
          ],
        ),
        onTap: () async {
          final values = await showCalendarDatePicker2Dialog(
            context: context,
            config: onConfig(),
            dialogSize: Size(MediaQuery.of(context).size.width / 0.8,
                MediaQuery.of(context).size.height / 2.8),
            borderRadius: BorderRadius.circular(8),
          );
          if (values != null) {
            List<int> rangesInTimestamp = [];
            ranges = onSelectRanges(values, format);
            rangesInTimestamp.add(values[0]!.millisecondsSinceEpoch);
            rangesInTimestamp.add(values[1]!.millisecondsSinceEpoch);
            onGetRanges(rangesInTimestamp);
            setState(
              () {},
            );
          }
        },
      );
    });
  }

  List<String> onSelectRanges(values, String format) {
    String startDate = DateFormat(format).format(values[0]);
    String endDate = DateFormat(format).format(values[1]);
    return [startDate, endDate];
  }
}

CalendarDatePicker2WithActionButtonsConfig onConfig() {
  final config = CalendarDatePicker2WithActionButtonsConfig(
      weekdayLabels: ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'],
      lastDate: DateTime.now(),
      cancelButtonTextStyle: TextStyle(color: CHIStyles.primaryColor),
      okButtonTextStyle: TextStyle(color: CHIStyles.primaryColor),
      dayTextStyle: const TextStyle(fontWeight: FontWeight.w500),
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: CHIStyles.primaryColor,
      firstDayOfWeek: 1,
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ));
  return config;
}
