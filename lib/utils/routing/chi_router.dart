import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CHIRouter {
  static Future push(BuildContext context, Widget nextPage) {
    return Navigator.push(
      context,
      Platform.isAndroid
          ? MaterialPageRoute(builder: (context) => nextPage)
          : CupertinoPageRoute(builder: (context) => nextPage),
    );
  }

  static Future pushReplacement(BuildContext context, Widget nextPage) {
    return Navigator.pushReplacement(
      context,
      Platform.isAndroid
          ? MaterialPageRoute(builder: (context) => nextPage)
          : CupertinoPageRoute(builder: (context) => nextPage),
    );
  }

  static popUntilHomeRoute(BuildContext context, Widget nextPage) {
    Navigator.of(context).pushAndRemoveUntil(
      Platform.isAndroid
          ? MaterialPageRoute(builder: (context) => nextPage)
          : CupertinoPageRoute(builder: (context) => nextPage),
      (route) => route.isFirst,
    );
  }

  static Future<void> exitApp({bool? animated}) async {
    await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', animated);
  }
}
