import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igname_li/theme/theme.dart';
import 'package:igname_li/views/onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

late bool isFirst;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  String? theme = prefs.getString('theme') ?? 'dark';
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
      // initialBinding: AllControllerBinding(),
      title: "Iwa",
      // translations: MyTranslation(),
      locale: Get.deviceLocale,
      // fallbackLocale: Locale("fr", "FR"),
      // si la langue du telephone n'est pas definis dans ma classe
      debugShowCheckedModeBanner: false,
      themeMode: getThemeActuel(),
      theme: ThemeIgname.ligthTheme,
      darkTheme: ThemeIgname.darkTheme,
      home: const OnBoarding(),
    );
  }
}
