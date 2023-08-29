import 'package:flutter/material.dart';

import 'meters/dial_meter.dart';

// ignore: must_be_immutable
class DialMeterHolder extends StatelessWidget {
  final List<Color> rangeColors = [
    const Color(0xFF800000),
    const Color(0xFFFF0000),
    const Color(0xFFFFA000),
    const Color(0xFF00a000),
    const Color(0xFFFF8000),
    const Color(0xFFFF0000),
    const Color(0xFF800000),
  ];
  final List<double> ranges;
  final Color bgColor;
  final double transparentGap;
  final double ultraCritical;
  final String label;
  num value;
  final String unit;
  final double labelFontSize;
  final double unitFontSize;

  DialMeterHolder(
      {Key? key, required this.ranges,
      this.bgColor = const Color(0xFFffffff),
      this.transparentGap = 0.1,
      this.ultraCritical = 0.1,
      required this.label,
      required this.value,
      required this.unit,
      this.labelFontSize = 10,
      this.unitFontSize = 15}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      color: bgColor,
      child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
              painter: DialMeter(ranges, rangeColors, label, value, unit,
                  labelFontSize, unitFontSize))),
    );
  }
}
