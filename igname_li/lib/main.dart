// ignore_for_file: library_private_types_in_public_api

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:igname_li/themes/theme.dart';
import 'package:igname_li/views/authviews/authentication.dart';
import 'package:igname_li/views/home.dart';
import 'package:igname_li/views/onboarding/onboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

late bool isFirst;
late Box box;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  String? theme = prefs.getString('theme') ?? 'light';
  isFirst = prefs.getBool('isFirst') ?? true;
  // hive initialisation
  // final document = await getApplicationDocumentsDirectory();
  // await Hive.initFlutter(document.path);
  // Hive.registerAdapter(UserAdapter());
  // box = await Hive.openBox<User>('userBox');

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
      nextScreen: const CheckAuth(),
      //  isFirst ? const OnBoarding() : const AuthenticationPage(),
      splashTransition: SplashTransition.slideTransition,
    );
  }
}

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

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
      child = const Home();
    } else {
      if (isFirst) {
        child = const OnboardingPageSimple();
      } else {
        child = const AuthenticationPage();
      }
    }
    return Scaffold(
      body: child,
    );
  }
}
