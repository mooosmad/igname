import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igname_li/views/authviews/authentication.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseThemePage extends StatefulWidget {
  const ChooseThemePage({Key? key}) : super(key: key);

  @override
  State<ChooseThemePage> createState() => _ChooseThemePageState();
}

class _ChooseThemePageState extends State<ChooseThemePage> {
  bool isdarkmode = Get.isDarkMode;
  changeTheme(bool v) async {
    final prefs = await SharedPreferences.getInstance();

    if (v) {
      prefs.setString('theme', "dark");
    } else {
      prefs.setString('theme', "light");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          changeTheme(Get.isDarkMode);

          Get.off(const AuthenticationPage());
        },
        child: const Icon(Icons.arrow_forward_rounded),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Lottie.asset(
                "assets/lotties/darkmode.json",
                frameBuilder: ((context, child, composition) {
                  return composition != null
                      ? child
                      : Container(
                          height: MediaQuery.of(context).size.height / 2,
                        );
                }),
                reverse: true,
              ),
            ),
            Text(
              "Mode Sombre",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 10),
            Text(
              "Choisissez le theme qui vous combien le mieux",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 70,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(
                  5,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: const [
                        Icon(
                          Icons.dark_mode,
                          color: Color(0xfffdc72f),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Mode Sombre",
                        ),
                      ],
                    ),
                  ),
                  CupertinoSwitch(
                    activeColor: const Color(0xfffdc72f),
                    value: isdarkmode,
                    onChanged: (v) {
                      setState(() {
                        isdarkmode = v;
                      });
                      Get.changeThemeMode(
                        Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
