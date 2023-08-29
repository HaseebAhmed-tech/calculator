import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/chi_styles.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.black12,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: CHIStyles.cardBorder,
                boxShadow: CHIStyles.cardShadow,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(color: CHIStyles.primaryLightColor, shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          shimmerLine(100),
                          shimmerLine(70),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          shimmerLine(60),
                          shimmerLine(60),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shimmerLine(110),
                      shimmerLine(130),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget shimmerLine(double width) {
  return Container(
    height: 10,
    margin: const EdgeInsets.symmetric(vertical: 4),
    width: width,
    decoration: const ShapeDecoration(
      shape: StadiumBorder(),
      color: Colors.black,
    ),
  );
}
