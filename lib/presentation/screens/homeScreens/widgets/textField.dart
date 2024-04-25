import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shutdownhelper/constants/colors.dart';
import 'package:shutdownhelper/presentation/provider/counterProvider.dart';

Widget textField(BuildContext context, TextEditingController controller) {
  return TextField(
    style: TextStyle(color: fontColor),
    cursorColor: fontColor,
    decoration: context.watch<CounterProvider>().isStarted
        ? InputDecoration(hintText: '')
        : InputDecoration(
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: fontColor)),
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: fontColor)),
            hintText: 'Enter in minutes',
            hintStyle: TextStyle(color: fontColor)),
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    ],
    controller: controller,
  );
}
