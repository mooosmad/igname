import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igname_li/components/loading.dart';
import 'package:igname_li/themes/theme.dart';
import 'package:igname_li/views/authviews/authentication.dart';
import 'package:igname_li/views/home.dart';
import 'package:igname_li/views/onboarding/onboarding.dart';

import 'package:shared_preferences/shared_preferences.dart';

late bool isFirst;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  String? theme = prefs.getString('theme') ?? 'light';
  isFirst = prefs.getBool('isFirst') ?? true;

  runApp(MyApp(
    theme: theme,
  ));
}

class MyApp extends StatelessWidget {
  final String? theme;
  const MyApp({Key? key, required this.theme}) : super(key: key);
  ThemeMode getThemeActuel() {
    switch (theme) {
      case "dark":
        return ThemeMode.dark;
      case "light":
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Iwa",
      locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false,
      themeMode: getThemeActuel(),
      theme: ThemeIgname.ligthTheme,
      darkTheme: ThemeIgname.darkTheme,
      home: const MySplashScreen(),
    );
  }
}

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/logo.png',
      splashIconSize: 250,
      backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      nextScreen: CheckAuth(),
      //  isFirst ? const OnBoarding() : const AuthenticationPage(),
      splashTransition: SplashTransition.slideTransition,
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;

  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('access_token');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = Home();
    } else {
      if (isFirst) {
        child = const OnBoarding();
      } else {
        child = const AuthenticationPage();
      }
    }
    return Scaffold(
      body: child,
    );
  }
}
