import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';

import '../../constants/chi_styles.dart';

class MyLoadingDelegate extends LoadMoreDelegate {
  @override
  Widget buildChild(LoadMoreStatus status, {LoadMoreTextBuilder builder = DefaultLoadMoreTextBuilder.english}) {
    @override
    String text = builder(status);
    if (status == LoadMoreStatus.fail) {
      return Text(text);
    }
    if (status == LoadMoreStatus.idle) {
      return Text(text);
    }
    if (status == LoadMoreStatus.loading) {
      return Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text),
            ),
            SizedBox(
              width: 100.0,
              child: LinearProgressIndicator(color: CHIStyles.primaryColor, backgroundColor: Colors.grey[200]),
            ),
          ],
        ),
      );
    }
    if (status == LoadMoreStatus.nomore) {
      return Text(text);
    }

    return Text(text);
  }
}
