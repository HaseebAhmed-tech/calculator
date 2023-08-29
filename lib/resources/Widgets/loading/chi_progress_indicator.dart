import 'package:flutter/material.dart';

import '../../constants/chi_styles.dart';

// class ChiProgressIndicator extends StatelessWidget {
//   const ChiProgressIndicator({Key? key, required this.val}) : super(key: key);
//   final double val;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: ChangeNotifierProvider(
//         create: (context) => ChiProgressIndicatorProvider(),
//         child: Consumer<ChiProgressIndicatorProvider>(
//           builder: (context, provider, child) => LayoutBuilder(
//               builder: (context, constraints) => Container(
//                   color: primaryColor, height: 2, width: constraints.maxWidth * provider.animation.value * val)),
//         ),
//       ),
//     );
//   }
// }

// //
// class ChiProgressIndicatorProvider extends ChangeNotifier {
//   late AnimationController animationController;
//   late Animation animation;

//   TickerProvider tp = MyTickerProvider();
//   ChiProgressIndicatorProvider() {
//     animationController = AnimationController(vsync: tp, duration: const Duration(milliseconds: 300));
//     animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
//       parent: animationController,
//       curve: Curves.easeIn,
//       reverseCurve: Curves.easeOut,
//     ))
//       ..addListener(() {
//         notifyListeners();
//       });
//     animationController.forward();
//   }
//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }
// }
class CHIProgressIndicator extends StatelessWidget {
  const CHIProgressIndicator(this.isBusy, {Key? key, this.color})
      : super(key: key);
  final bool isBusy;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return isBusy
        ? LinearProgressIndicator(
            color: color ?? CHIStyles.primaryColor,
            backgroundColor: Colors.grey[200],
          )
        : const SizedBox(height: 5);
  }
}
