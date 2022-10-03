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

  bool select = false;

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
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('isFirst', false);
          changeTheme(Get.isDarkMode);
          Get.off(const AuthenticationPage());
        },
        child: const Icon(Icons.arrow_forward_rounded),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
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
              "Selectionnez le theme qui vous convient le mieux",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.blueGrey.shade400,
                  ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                color: Get.isDarkMode ? Colors.black26 : Colors.grey.shade200,
              ),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          maximumSize: const Size(120, 150),
                          backgroundColor: const Color(0xffe5e5e5),
                        ),
                        onPressed: () {
                          Get.changeThemeMode(ThemeMode.light);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            top: 10,
                          ),
                          padding: const EdgeInsets.all(8),
                          // color: Colors.white,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            border: Border.all(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                          ),
                          height: 80,
                          width: 70,
                          child: Text("Aa",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: Colors.black)),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          maximumSize: const Size(120, 150),
                          backgroundColor: const Color(0xff626262),
                        ),
                        onPressed: () {
                          Get.changeThemeMode(ThemeMode.dark);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            top: 10,
                          ),
                          padding: const EdgeInsets.all(8),
                          // color: Colors.white,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            border: Border.all(
                              color: Colors.grey.shade500,
                              width: 1,
                            ),
                          ),
                          height: 80,
                          width: 70,
                          child: Text(
                            "Aa",
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Clair",
                          style: Theme.of(context).textTheme.bodyText1),
                      Text("Sombre",
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  )
                ],
              ),
            ),
            // Switch(
            //   activeColor: const Color(0xfffdc72f),
            //   value: isdarkmode,
            //   onChanged: (v) async {
            //     final prefs = await SharedPreferences.getInstance();
            // prefs.setBool('isFisrt', false);
            // setState(() {
            //   isdarkmode = v;
            // });
            //     Get.changeThemeMode(
            //       Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
