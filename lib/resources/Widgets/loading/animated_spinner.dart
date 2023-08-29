// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// import '../../constants/constants.dart';

// class AnimatedSpinner extends StatelessWidget {
//   final Widget child;
//   final bool visible;
//   const AnimatedSpinner({Key? key, required this.child, required this.visible}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         child,
//         visible
//             ? Container(
//                 width: double.maxFinite,
//                 height: double.maxFinite,
//                 color: primaryLightColor.withOpacity(0.5),
//                 child: Center(
//                     child: SpinKitThreeBounce(
//                   itemBuilder: (context, index) => DecoratedBox(
//                     decoration: BoxDecoration(
//                       color: primaryColor,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                   size: 40,
//                 )),
//               )
//             : const SizedBox.shrink(),
//       ],
//     );
//   }
// }
