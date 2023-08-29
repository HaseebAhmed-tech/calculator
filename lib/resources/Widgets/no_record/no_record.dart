import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NoRecord extends StatelessWidget {
  const NoRecord(
    this.onRefresh, {
    super.key,
  });

  final AsyncCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: onRefresh ?? () async {},
        child: Center(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/not_found.png',
                  height: 160,
                  width: 160,
                ),
              ],
            ),
          ),
        ));
  }
}
