import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(text)));
  }
  static void showBanner(BuildContext context, String text) {
    ScaffoldMessenger.of(context)..removeCurrentMaterialBanner()
    ..showMaterialBanner(MaterialBanner(content: Text(text), actions: const []));
  }
}