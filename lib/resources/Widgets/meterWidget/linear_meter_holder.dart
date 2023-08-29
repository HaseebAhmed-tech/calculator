import 'package:flutter/material.dart';

import 'meters/linear_meter.dart';

// ignore: must_be_immutable
class LinearMeterHolder extends StatelessWidget {
  final List<Color> rangeColors = [
    Color(0xFF800000),
    Color(0xFFFF0000),
    Color(0xFFFFA000),
    Color(0xFF00a000),
    Color(0xFFFF8000),
    Color(0xFFFF0000),
    Color(0xFF800000),
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

  LinearMeterHolder(
      {Key? key, required this.ranges,
      this.bgColor = const Color(0xFFffffff),
      this.transparentGap = 0.1,
      this.ultraCritical = 0.1,
      required this.label,
      required this.value,
      required this.unit,
      this.labelFontSize = 10,
      this.unitFontSize = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      color: bgColor,
      child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
              painter: LinearMeter(ranges, rangeColors, label, value, unit,
                  labelFontSize, unitFontSize))),
    );
  }
}
