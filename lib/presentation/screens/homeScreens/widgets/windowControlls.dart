import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

Widget windowControlls() {
  return WindowTitleBarBox(
    child: Row(
      children: [
        Expanded(child: MoveWindow()),
        MinimizeWindowButton(),
        CloseWindowButton(),
      ],
    ),
  );
}
