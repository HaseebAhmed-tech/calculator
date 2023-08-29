import 'package:flutter/material.dart';
import 'meter.dart';

class LinearMeter extends Meter {
  final double barPlacement = 0.75;
  final double labelPlacement = 0.10;
  final double valuePlacement = 0.35;

  LinearMeter(List<double> limits, List<Color> rangeColors, String label,
      num value, String unit, double labelFontSize, double unitFontSize)
      : super(limits, rangeColors, label, value, unit, labelFontSize, unitFontSize);

  @override
  void draw(Canvas canvas, Size size, double x0, double x1, Color color,
      double strokeWidth, StrokeCap strokeCap) {
    // textPaintLabel(canvas, size);
    // textPaintValueAndUnit(canvas, size);

    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    // ..strokeCap = strokeCap;

    Offset p1 = Offset(x0 * size.width, size.height * barPlacement);
    Offset p2 = Offset(x1 * size.width, size.height * barPlacement);
    canvas.drawLine(p1, p2, paint);
  }

  @override
  double drawMarker(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    double v = computeMarkerPosition();
    Offset p1 = Offset(v * size.width, size.height * barPlacement);
    Offset p2 = Offset((v + .01) * size.width, size.height * barPlacement);
    canvas.drawLine(p1, p2, paint);
    return 1.0;
  }

  @override
  void textPainter(Canvas canvas, Size size) {
    textPaint(canvas, size, labelFontSize, label, size.width * labelPlacement, size.height * labelPlacement, true);
    String vu = value == 0 ? '--' : ('$value $unit');
    textPaint(canvas, size, unitFontSize, vu, size.width * labelPlacement, size.height * valuePlacement, false);
  }
}
