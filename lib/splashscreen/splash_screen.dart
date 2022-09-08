import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_strings.dart';

import '../landing_screen.dart';
import '../utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    //start the countdown
    navigateToHomeScreen();

    return Container(
      color: AppColors.blueColor,
      child: Center(
        child: Image.asset(AppStrings.splashImage),
      ),
    );
  }

  void navigateToHomeScreen() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const LandingScreen())));
  }
}
