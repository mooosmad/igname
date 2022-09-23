import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:igname_li/components/card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Widget _arrow() {
    return Icon(
      Icons.arrow_forward_ios,
      size: 20.0,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    );
  }

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
      appBar: AppBar(
        title: const Text(
          'Parametres',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        systemOverlayStyle: Get.isDarkMode
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
      ),
      body: Container(
        // color: Get.isDarkMode ? Colors.black12 : Colors.grey.shade200,
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 20),
              color: Get.isDarkMode ? Colors.black45 : Colors.grey.shade200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Profiles',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xfffdc72f).withOpacity(0.8),
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.person,
                            size: 40,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mo Smad",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Text(
                              "Voir Profiles",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Autres',
                      style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xfffdc72f).withOpacity(0.8)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // ItemCard(
                  //   title: 'Settings Item 02',
                  //   color: Get.isDarkMode
                  //       ? Colors.black26
                  //       : Colors.grey.shade200,
                  //   rightWidget: _arrow(),
                  //   iconWidget: Container(),
                  // ),
                  ItemCard(
                    title: 'À propos de nous',
                    color:
                        Get.isDarkMode ? Colors.black26 : Colors.grey.shade200,
                    rightWidget: _arrow(),
                    iconWidget: Container(),
                  ),
                  ItemCard(
                    title: 'Contactez nous',
                    color:
                        Get.isDarkMode ? Colors.black26 : Colors.grey.shade200,
                    rightWidget: _arrow(),
                    iconWidget: Icon(
                      Icons.call,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  ItemCard(
                    title: 'Aides',
                    color:
                        Get.isDarkMode ? Colors.black26 : Colors.grey.shade200,
                    rightWidget: Container(),
                    iconWidget: Icon(
                      Icons.help,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  ItemCard(
                    title: 'Mode Sombre',
                    color:
                        Get.isDarkMode ? Colors.black26 : Colors.grey.shade200,
                    rightWidget: CupertinoSwitch(
                      activeColor: const Color(0xfffdc72f),
                      value: isdarkmode,
                      onChanged: (v) async {
                        setState(() {
                          isdarkmode = v;
                        });
                        Get.changeThemeMode(
                          Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
                        );
                        changeTheme(Get.isDarkMode);
                      },
                    ),
                    iconWidget: Icon(
                      Icons.dark_mode,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  ItemCard(
                    title: 'Deconnexion',
                    color:
                        Get.isDarkMode ? Colors.black26 : Colors.grey.shade200,
                    rightWidget: Container(),
                    iconWidget: Icon(
                      Icons.logout,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ItemCard(
                    title: 'version',
                    color:
                        Get.isDarkMode ? Colors.black26 : Colors.grey.shade200,
                    rightWidget: const Center(
                      child: Text('1.0.0',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          )),
                    ),
                    iconWidget: Container(),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
