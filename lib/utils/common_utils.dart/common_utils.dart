import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class CommonUtils {
  ///-------------- Get Snack Bar------------
  static getSnackBar(BuildContext context, String mesage, bool status) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mesage.toString()),
        backgroundColor: status ? Colors.green : Colors.red,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 100,
            right: 5,
            left: 5),
      ),
    );
  }

  ///-------------- Get FocusNode ------------
  static getFocusNode(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //---------Animated SnackBar----------
  static getAnimatedSnackBar(BuildContext context, String mesage, bool status) {
    AnimatedSnackBar.material(
      mesage,
      type: status ? AnimatedSnackBarType.success : AnimatedSnackBarType.error,
      mobileSnackBarPosition: MobileSnackBarPosition.top,
      desktopSnackBarPosition: DesktopSnackBarPosition.topLeft,
      snackBarStrategy: RemoveSnackBarStrategy(),
      duration: const Duration(seconds: 4)
    ).show(context);
  }
}
