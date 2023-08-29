import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'meter.dart';
import 'dart:math';

class DialMeter extends Meter {
  static const FRAC2RAD = 2.0 * math.pi;
  final double labelPlacement = 0.20;
  final double valuePlacement = 0.40;

  var count = 0;

  DialMeter(List<double> limits, List<Color> rangeColors, String label,
      num value, String unit, double labelFontSize, double unitFontSize)
      : super(limits, rangeColors, label, value, unit, labelFontSize, unitFontSize);

  @override
  void draw(Canvas canvas, Size size, double start, double end, Color color,
      double strokeWidth, StrokeCap strokeCap) {

    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    drawArcCore(canvas, size, paint, start, end, strokeWidth);
    // debugPrint("print called = ========================================");
  }

  void drawArcCore(Canvas canvas, Size size, Paint paint, double start,
      double end, double strokeWidth) {
    double x = size.width / 2.0;
    double y = size.height / 2.0;

    // double s1 = (size.width / 2.0 - 0 * strokeWidth / 2);
    // double s2 = (size.height / 2.0 - 0 * strokeWidth / 2);
    // double s = min(s1, s2);
    double s = min(x, y);

    Rect rect = Rect.fromLTRB(x - s, y - s, x + s, y + s);
    double startAngle = start * FRAC2RAD + math.pi / 2;
    double arcLength = (end - start) * FRAC2RAD;

    canvas.drawArc(rect, startAngle, arcLength, false, paint);
  }

  @override
  double drawMarker(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    double v = computeMarkerPosition();
    drawArcCore(canvas, size, paint, v, v + .005, 20);

    // Offset p1 = Offset(v * size.width, size.height * barPlacement);
    // Offset p2 = Offset((v + .01) * size.width, size.height * barPlacement);
    // canvas.drawLine(p1, p2, paint);
    return 1.0;
  }

  @override
  void textPainter(Canvas canvas, Size size) {
    textPaint(canvas, size, labelFontSize, label, size.width/2.0 - 10, size.height * labelPlacement, true);
    String vu = value == 0 ? '--' : ('$value $unit');
    textPaint(canvas, size, unitFontSize, vu, size.width/2.0 - 15, size.height * valuePlacement, false);
  }
}
