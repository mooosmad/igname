import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igname_li/main.dart';
import 'package:igname_li/views/authviews/authentication.dart';
import 'package:igname_li/views/onboarding/onboard.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/logo.png',
      splashIconSize: 250,
      backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      nextScreen:
          isFirst ? const OnboardingPageSimple() : const AuthenticationPage(),
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
