// ignore_for_file: unused_field, unused_element

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:igname_li/components/loading.dart';
import 'package:igname_li/views/widgets/homepage.dart';
import 'package:igname_li/views/widgets/settingpage.dart';

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
    Container(),
    const SettingPage(),
  ];
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return load
        ? const Loading()
        : Scaffold(
            // appBar: AppBar(
            //   systemOverlayStyle: SystemUiOverlayStyle(
            //     statusBarBrightness:
            //         Get.isDarkMode ? Brightness.light : Brightness.dark,
            //     statusBarColor: Get.isDarkMode ? Colors.white : Colors.black,
            //     systemNavigationBarColor:
            //         Get.isDarkMode ? Colors.white : Colors.black,
            //   ),
            // ),
            body: SafeArea(child: pages[_currentIndex]),
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: _currentIndex,
              showElevation: true,
              itemCornerRadius: 8,
              curve: Curves.easeIn,
              onItemSelected: (index) => setState(() => _currentIndex = index),
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  icon: const Icon(Icons.apps),
                  title: const Text('Home'),
                  activeColor: const Color(0xfffdc72f),
                  textAlign: TextAlign.center,
                  inactiveColor: Colors.grey,
                ),
                BottomNavyBarItem(
                  icon: const Icon(Icons.list_alt_outlined),
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
                  icon: const Icon(Icons.settings),
                  title: const Text('Parametres'),
                  activeColor: const Color(0xfffdc72f),
                  textAlign: TextAlign.center,
                  inactiveColor: Colors.grey,
                ),
              ],
            ),
          );
  }
}
