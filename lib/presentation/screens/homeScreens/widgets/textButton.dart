import 'package:flutter/material.dart';
import 'package:shutdownhelper/constants/colors.dart';

Widget textButton(String text, Function function) {
  return TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        text,
        style: TextStyle(color: fontColor),
      ));
}
