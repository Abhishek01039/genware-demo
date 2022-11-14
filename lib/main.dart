import 'package:flutter/material.dart';
import 'package:genware/src/constant/constants.dart';
import 'package:genware/src/feature/onboarding/view/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: Constants.rubik,
      ),
      home: const OnboardingScreen(),
    );
  }
}
