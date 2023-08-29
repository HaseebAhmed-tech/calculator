import 'package:flutter/material.dart';
import 'meter_calculation.dart';

abstract class Meter extends CustomPainter {
  final List<Color> rangeColors;
  late List<double> limits;
  late List<List<double>> ranges;
  final String label;
  num value;
  final String unit;
  late MeterCalculation mCalc;
  final double labelFontSize;
  final double unitFontSize;
  late int _index;

  Meter(this.limits, this.rangeColors, this.label, this.value, this.unit,
      this.labelFontSize, this.unitFontSize) {
    mCalc = MeterCalculation(limits: limits);
    ranges = mCalc.outputRanges;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // debugPrint("draw called"); [30, 33, 40, 55, 70, 120];

    for (int i = 0; i < ranges.length; i++) {
      List<double> range = ranges[i];
      double x0 = range[0];
      double x1 = range[1];
      draw(canvas, size, x0, x1, rangeColors[i], 5.0, StrokeCap.round);
      // debugPrint("draw called");
    }
    drawMarker(canvas, size);

    textPainter(canvas, size);
  }

  void textPainter(Canvas canvas, Size size);

  double computeMarkerPosition() {
    // debugPrint("current value = $value");

    // int index = -99;
    _index = -99;

    for (int i = 0; i < limits.length - 1; i++) {
      double v1 = limits[i];
      double v2 = limits[i + 1];
      // debugPrint('$v1 ---*---  $v2');
      if ((value >= v1) && (value <= v2)) {
        _index = i;
      }
    }
    if (_index == -99) {
      if (value < limits[0]) {
        _index = -1;
        return 0.125;
      }
      if (value > limits[limits.length - 1]) {
        _index = -2;
        return 1-0.125;
      }
    }

    // debugPrint('INdex : ${index}');

    double v = mCalc.tranformX2Y(value.toDouble(), _index + 1);
    return v;
  }

  double drawMarker(Canvas canvas, Size size);

  void draw(Canvas canvas, Size size, double x0, double x1, Color color,
      double strokeWidth, StrokeCap strokeCap);

  void textPaint(Canvas canvas, Size size, double fontSize, String str,
      double placementX, double placementy, bool isLabel) {
    final textStyle = TextStyle(
      color: isLabel ? Colors.black : (_index == -1 || _index == -2) ? rangeColors[0]: rangeColors[_index+1],
      fontSize: fontSize,
    );
    final textSpan = TextSpan(
      text: str,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset = Offset(placementX, placementy);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
