import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igname_li/main.dart';
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
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('isFisrt', false);
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
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   isdarkmode = v;
                        // });

                        Get.changeThemeMode(
                          Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        // padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            border: Border.all(
                              color: Colors.white,
                              width: 8,
                            )),
                        height: 180,
                        width: 80,
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: Colors.grey,
                              ),
                            ),
                            Container(color: Colors.white, height: 5),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.grey,
                              ),
                              height: 50,
                            ),
                            Container(
                              height: 10,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16),
                      height: 180,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          border: Border.all(
                            color: Colors.black38,
                            width: 8,
                          )),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            color: Colors.black,
                          ),
                          Container(color: Colors.grey, height: 5),
                          Container(
                            height: 50,
                            color: Colors.black,
                          ),
                          Container(
                            height: 5,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
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
        ));
  }
}
