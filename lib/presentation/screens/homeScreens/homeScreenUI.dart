import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shutdownhelper/presentation/screens/homeScreens/widgets/controlPanel.dart';
import 'package:shutdownhelper/presentation/screens/homeScreens/widgets/windowControlls.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(168, 198, 235, 197),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/backgrund-image.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            windowControlls(),
            controlPanel(600, context),
            SizedBox()
          ],
        ),
      ).animate(effects: [
        FadeEffect(duration: Duration(seconds: 2)),
      ]),
    );
  }
}
