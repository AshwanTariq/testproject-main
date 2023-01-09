import 'package:flutter/material.dart';

import '../../utils/colors.dart';

InputDecoration getInputDecoration(String value){
  return InputDecoration(
    labelText: value,
    border: const OutlineInputBorder(),
  );
}
void showSnackBar(BuildContext context,Widget value){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: value));
}
BoxDecoration decoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    color: whiteColor,
    boxShadow: [
      BoxShadow(
        color: primaryColor.withOpacity(0.6),
        offset: Offset(0, 4),
        spreadRadius: 2,
        blurRadius: 5,
      )
    ]);