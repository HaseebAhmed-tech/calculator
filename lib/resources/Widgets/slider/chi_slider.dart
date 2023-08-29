import 'package:flutter/material.dart';

import '../../constants/chi_styles.dart';

class CHISlider extends StatelessWidget {
  final double value;
  final void Function(double)? onChanged;
  const CHISlider({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final List<String> divisions = List.generate(11, (index) => "$index");
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 5,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.green, Colors.red],
              )),
            ),
            SliderTheme(
              data:
                  SliderThemeData(overlayShape: SliderComponentShape.noOverlay),
              child: Slider(
                value: value,
                onChanged: onChanged,
                thumbColor: CHIStyles.primaryColor,
                activeColor: Colors.transparent,
                divisions: divisions.length,
                inactiveColor: Colors.transparent,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: divisions
              .map((d) => Column(
                    children: [
                      const Text("|"),
                      Text(d),
                    ],
                  ))
              .toList(),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
// class MeterWidget extends StatelessWidget {
//   Color color;
//   String label;
//   List<double> ranges;
//   num value;
//   String unit;
//   bool isMeterRound;

//   MeterWidget(
//       {Key? key,
//       required this.color,
//       required this.label,
//       required this.ranges,
//       required this.value,
//       required this.unit,
//       required this.isMeterRound})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     LayoutBuilder layout = LayoutBuilder(builder: (context, constraints) {
//       // debugPrint('Max Height : ${constraints.maxHeight}');
//       // debugPrint('Max Width : ${constraints.maxWidth}');

//       return Container(
//         color: color,
//         height: constraints.maxHeight,
//         width: constraints.maxWidth,
//         child: isMeterRound
//             ? Center(
//                 child: DialMeterHolder(
//                   ranges: ranges,
//                   bgColor: Colors.transparent,
//                   // Color(0xFFdddddd),
//                   label: label,
//                   value: value,
//                   unit: unit,
//                 ),
//               )
//             : Center(
//                 child: LinearMeterHolder(
//                   ranges: ranges,
//                   bgColor: const Color(0xFFdddddd),
//                   label: label,
//                   value: value,
//                   unit: unit,
//                 ),
//               ),
//       );
//     });

//     return layout;
//   }
// }
