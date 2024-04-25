import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:shutdownhelper/constants/colors.dart';
import 'package:shutdownhelper/presentation/provider/counterProvider.dart';
import 'package:shutdownhelper/presentation/screens/homeScreens/widgets/textButton.dart';
import 'package:shutdownhelper/presentation/screens/homeScreens/widgets/textField.dart';

Widget controlPanel(double screenWidth, BuildContext context) {
  TextEditingController timeSetController = TextEditingController();
  return Container(
    padding: EdgeInsets.all(screenWidth * 0.04),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
        color: Color.fromARGB(255, 198, 235, 197),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 92, 92, 92).withOpacity(0.9),
              spreadRadius: 5,
              blurRadius: 19,
              offset: Offset(0, 3))
        ]),
    width: screenWidth * 0.6,
    height: screenWidth * 0.5,
    child: Column(
      children: [
        context.watch<CounterProvider>().isStarted
            ? Text(
                context.watch<CounterProvider>().count.toString() +
                    ' Seconds left',
                style: TextStyle(color: fontColor),
              ).animate(effects: [FadeEffect()])
            : Text(
                'Set ' +
                    context.watch<CounterProvider>().count.toString() +
                    ' Seconds',
                style: TextStyle(color: fontColor),
              ).animate(effects: [FadeEffect()]),
        Row(
          children: [
            SizedBox(
                width: screenWidth * 0.43,
                child: textField(context, timeSetController)),
            IconButton(
                onPressed: () {
                  if (timeSetController.text.isNotEmpty) {
                    context.read<CounterProvider>().setTimerTime(int.parse(
                          timeSetController.text,
                        ));
                  }
                },
                icon: Icon(
                  Icons.check,
                  color: fontColor,
                ))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            context.watch<CounterProvider>().isStarted
                ? textButton('Stop', () {
                    context.read<CounterProvider>().countDecrementStop();
                  })
                : textButton('Start', () {
                    context.read<CounterProvider>().countDecrementStart();
                  })
          ],
        ),
        SizedBox(
          height: 50,
        ),
        if (context.read<CounterProvider>().isStarted &&
            context.read<CounterProvider>().count > 10)
          Text(
            'Computer will be shut down in ' +
                context.watch<CounterProvider>().count.toString(),
            style: TextStyle(color: fontColor, fontWeight: FontWeight.bold),
          ).animate(effects: [FadeEffect()]),
        if (context.read<CounterProvider>().isStarted &&
            context.read<CounterProvider>().count <= 10)
          Text(
            'Computer will be shut down in ' +
                context.watch<CounterProvider>().count.toString(),
            style: TextStyle(color: warningColor, fontWeight: FontWeight.bold),
          ).animate(effects: [FadeEffect()])
        else
          Text('')
      ],
    ),
  ).animate(effects: [
    FadeEffect(duration: Duration(seconds: 3)),
    SlideEffect(duration: Duration(seconds: 4), curve: Curves.decelerate)
  ]);
}
