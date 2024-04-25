import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shutdownhelper/presentation/provider/counterProvider.dart';
import 'package:shutdownhelper/presentation/screens/homeScreens/homeScreenUI.dart';

void main() async {
  runApp(const ShutDown());
  doWhenWindowReady(() {
    const initialSize = Size(600, 450);
    const maxSize = Size(600, 450);
    appWindow.minSize = initialSize;
    appWindow.maxSize = maxSize;
    // appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class ShutDown extends StatelessWidget {
  const ShutDown({super.key});

  @override

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: HomeScreen()),
      ),
    );
  }
}
