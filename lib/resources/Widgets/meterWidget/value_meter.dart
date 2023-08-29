import 'package:flutter/material.dart';

import 'dial_meter_holder.dart';
import 'linear_meter_holder.dart';


// ignore: must_be_immutable
class MeterWidget extends StatelessWidget {
  Color color;
  String label;
  List<double> ranges;
  num value;
  String unit;
  bool isMeterRound;

  MeterWidget(
      {Key? key, required this.color,
      required this.label,
      required this.ranges,
      required this.value,
      required this.unit,
      required this.isMeterRound}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LayoutBuilder layout = LayoutBuilder(builder: (context, constraints) {
      // debugPrint('Max Height : ${constraints.maxHeight}');
      // debugPrint('Max Width : ${constraints.maxWidth}');

      return Container(
        color: color,
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        child: isMeterRound
            ? Center(
                child: DialMeterHolder(
                  ranges: ranges,
                  bgColor: Colors.transparent,
                  // Color(0xFFdddddd),
                  label: label,
                  value: value,
                  unit: unit,
                ),
              )
            : Center(
                child: LinearMeterHolder(
                  ranges: ranges,
                  bgColor: Color(0xFFdddddd),
                  label: label,
                  value: value,
                  unit: unit,
                ),
              ),
      );
    });

    return layout;
  }
}

