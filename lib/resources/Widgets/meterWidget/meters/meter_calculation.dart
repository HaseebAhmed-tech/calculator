// mL, mR: Left and right margins    (in fraction)
// uL, uR: Left and right ultra critical (in fraction)
//
// w = wHITE
// D = Dark red
// R = Red
// O = Orange
//                     fracRange = 1 - mL - mR - uL - uR - 6 * d
//              i.e. the range 30-80 will map linearly to [0,fracRange]
//               |----------------------- Range --------------------|
//  The following numbering [0-6], i.e. 7 segments will be drawn
//
//   W   D        R          O          G          0        R        D   W
//      |  |   |      |   |      |   |    |   |      |   |      |   |  |    |
// Delta|  | 1 |      | 2 |      | 3 |    | 4 |      | 5 |      | 6 |  |    |
// SGMTS| 0|   |   1  |   |  2   |   | 3  |   |   4  |   |   5  |   | 6|    |
//      |  |   |      |   |      |   |    |   |      |   |      |   |  |    |
// | mL |uL| d |--v1--| d |--v2--| d |-v3-| d |--v4--| d |--v5--| d |ur|-mR-|
//      |  |   |      |   |      |   |    |   |      |   |      |   |  |    |
//      |  |   |      |   |      |   |    |   |      |   |      |   |  |    |
//        30   30    40   40    50   50  55   55    70   70    80   80
//             y1 = .1 + .1 + .01 = .21
// - Number of segments to be drawn = 7  (0..6)
// - 6 limits will be passed in e.g. = [30, 40, 50, 55, 70, 80];
// - 7 colors will be passed in for the seven segments
// - mL, mR, uL, uR, and d are in fractions, e.g. .1,.1,.1,.1,.01
//     fracRange = 1.0 - 0.1 - 0.1 - 0.1 - 0.1 - 0.06 = 0.54
//   a range of 80-30 = 50 is mapped to .54
//
// DRAWING THE MARKER ON THE SCALE
// - Find the section in which we need to draw

void main() {
  List<double> limits = [30, 40, 55, 60, 70, 80];

  MeterCalculation mcalc = MeterCalculation(limits: limits);
  mcalc.printDesc();
}

class MeterCalculation {
  List<double> limits;
  late double currentValPos;
  // late int N; //segments
  late double mL, mR, uL, uR, d;

  List<List<double>> outputRanges = [];
  late double m, x1, y1, x2;

  MeterCalculation(
      {required this.limits,
      this.mL = 0.1,
      this.mR = 0.1,
      this.uL = 0.05,
      this.uR = 0.05,
      this.d = 0.004}) {
    int N = limits.length;
    double fracRange = 1.0 - mL - mR - uL - uR - N * d; //.54;
    // double currentValue = 45;

    x1 = limits[0]; //30 - start of Red (critical), below this ultra critical
    x2 = limits[5]; //80 - end of Red (critical), below this ultra critical
    y1 = mL + uL + d; // .1 + .1 + .01 = 0.21
    m = fracRange / (x2 - x1); // .54 / 50 = 0.0108

    outputRanges.add([mL, mL + uL]);
    for (int i = 0; i < N - 1; i += 1) {
      double v1 = limits[i];
      double v2 = limits[i + 1];
      double v1a = tranformX2Y(v1, i + 1);
      double v2a = tranformX2Y(v2, i + 1);
      outputRanges.add([v1a, v2a]);
    }
    double lastVal = outputRanges.last[1];
    outputRanges.add([lastVal + d, lastVal + d + uL]);

    // for (int i = 0; i < outputRanges.length; i += 1) {}
  }

  double tranformX2Y(double x, int n) {
    double ya = y1 + m * (x - x1); // .21 + .0108 * (80-30) = 0.75
    double yb = ya + (n - 1) * d; // 0.79   ---- x = 80, n = 5

    return (yb * 1000).roundToDouble() / 1000;
  }

  void printDesc() {
    // for (int i = 0; i < outputRanges.length; i++) {
    //   debugPrint('${outputRanges[i][0]} ------  ${outputRanges[i][1]}');
    // }
  }
}
