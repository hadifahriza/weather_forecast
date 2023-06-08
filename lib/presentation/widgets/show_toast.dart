import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message, ToastType? type) {
  Color getBgColor() {
    switch (type) {
      case ToastType.success:
        return Colors.orange;
      case ToastType.error:
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: getBgColor(),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastType { success, error, regular }
