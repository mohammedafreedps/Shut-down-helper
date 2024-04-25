import 'dart:io';

import 'package:flutter/foundation.dart';

void shutDown() async {
  if (defaultTargetPlatform == TargetPlatform.windows) {
    try {
      await Process.run('shutdown', ['/s', '/t', '0']);
      print('it will shtudown');
    } catch (e) {
      print(e);
    }
  }
}
