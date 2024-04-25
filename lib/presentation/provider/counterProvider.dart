import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shutdownhelper/presentation/screens/homeScreens/functions/shutDown.dart';

class CounterProvider extends ChangeNotifier {
  Timer? counterTimer;
  int count = 0;
  String status = 'Set Time';
  bool isStarted = false;

  void setTimerTime(int minutes) {
    count = minutes * 60;
    notifyListeners();
  }

  void countDecrementStart() {
    if (count > 0 && counterTimer == null) {
      isStarted = true;
      counterTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        count -= 1;
        if (count == 0) {
          counterTimer!.cancel();
          isStarted = false;
          shutDown();
        }
        notifyListeners();
      });
    }
  }

  void countDecrementStop() {
    if (counterTimer != null) {
      counterTimer!.cancel();
      counterTimer = null;
      isStarted = false;
      notifyListeners();
    }
  }
}
