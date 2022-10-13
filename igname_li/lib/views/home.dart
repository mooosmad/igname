// ignore_for_file: unused_field, unused_element

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igname_li/components/loading.dart';
import 'package:igname_li/controller/controller.dart';
import 'package:igname_li/views/widgets/homepage.dart';
import 'package:igname_li/views/widgets/mes_commandes.dart';
import 'package:igname_li/views/widgets/settingpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool load = false;
  int _currentIndex = 0;
  int _counter = 0;

  static List<Widget> pages = <Widget>[
    const Homepage(),
    OrderPage(),
    const SettingPage(),
  ];
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
    Get.put(GetUserDataController(), permanent: true);
    final mainController = Get.put(MainController());
    final controller = Get.find<GetUserDataController>();
    return Obx(() {
      print(mainController.load.value);
      return mainController.load.value
          ? const Loading()
          : Scaffold(
              // resizeToAvoidBottomInset: true,
              body: SafeArea(child: pages[_currentIndex]),
              bottomNavigationBar:
                  mainController.load.value && controller.user.value == null
                      ? Container()
                      : BottomNavyBar(
                          selectedIndex: _currentIndex,
                          showElevation: false,
                          itemCornerRadius: 8,
                          curve: Curves.easeIn,
                          onItemSelected: (index) => setState(() {
                            _currentIndex = index;
                            changeTheme(Get.isDarkMode);
                          }),
                          items: <BottomNavyBarItem>[
                            BottomNavyBarItem(
                              icon: Image.asset(
                                "assets/icons/light/home.png",
                                height: 30,
                                width: 30,
                              ),
                              title: const Text('Home'),
                              activeColor: const Color(0xfffdc72f),
                              textAlign: TextAlign.center,
                              inactiveColor: Colors.grey,
                            ),
                            BottomNavyBarItem(
                              icon: Image.asset(
                                "assets/icons/light/order.png",
                                height: 30,
                                width: 30,
                              ),
                              title: const Text('Commandes'),
                              activeColor: const Color(0xfffdc72f),
                              textAlign: TextAlign.center,
                              inactiveColor: Colors.grey,
                            ),
                            // BottomNavyBarItem(
                            //   icon: const Icon(Icons.message),
                            //   title: const Text(
                            //     'Messages test for mes teset test test ',
                            //   ),
                            //   activeColor: Color(0xfffdc72f),
                            //   textAlign: TextAlign.center,
                            // ),
                            BottomNavyBarItem(
                              icon: Image.asset(
                                "assets/icons/light/setting.png",
                                height: 30,
                                width: 30,
                              ),
                              title: const Text('Parametres'),
                              activeColor: const Color(0xfffdc72f),
                              textAlign: TextAlign.center,
                              inactiveColor: Colors.grey,
                            ),
                          ],
                        ),
            );
    });
  }
}
