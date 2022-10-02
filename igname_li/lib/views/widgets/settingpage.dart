import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:igname_li/components/card.dart';
import 'package:igname_li/components/loading.dart';
import 'package:igname_li/main.dart';
import 'package:igname_li/models/user.dart';
import 'package:igname_li/services/api_services.dart';

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

  User? user;

  getData() async {
    user = await Apiservices().getDataUser();
  }

  bool load = false;
  bool isdarkmode = Get.isDarkMode;

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return load
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text(
                'Parametres',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: ListView(
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
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xfffdc72f),
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(
                                Icons.person,
                                size: 40,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${user!.prenom} ${user!.nom}",
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
                        child: const Text(
                          'Autres',
                          style: TextStyle(
                              fontFamily: 'NotoSansJP',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xfffdc72f)),
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
                        color: Get.isDarkMode
                            ? Colors.black26
                            : Colors.grey.shade200,
                        rightWidget: _arrow(),
                        iconWidget: Container(),
                      ),
                      ItemCard(
                        title: 'Contactez nous',
                        color: Get.isDarkMode
                            ? Colors.black26
                            : Colors.grey.shade200,
                        rightWidget: _arrow(),
                        iconWidget: Icon(
                          Icons.call,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      ItemCard(
                        title: 'Aides',
                        color: Get.isDarkMode
                            ? Colors.black26
                            : Colors.grey.shade200,
                        rightWidget: Container(),
                        iconWidget: Icon(
                          Icons.help,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      ItemCard(
                        title: 'Mode Sombre',
                        color: Get.isDarkMode
                            ? Colors.black26
                            : Colors.grey.shade200,
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
                          },
                        ),
                        iconWidget: Icon(
                          Icons.dark_mode,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            load = true;
                          });
                          Apiservices().logout().then((check) {
                            setState(() {
                              load = false;
                            });
                            if (check![0]) {
                              const Loading();
                              Fluttertoast.showToast(
                                  msg: "Deconnexion effectué");
                              Get.to(const CheckAuth());
                            }
                          });
                        },
                        child: ItemCard(
                          title: 'Deconnexion',
                          color: Get.isDarkMode
                              ? Colors.black26
                              : Colors.grey.shade200,
                          rightWidget: Container(),
                          iconWidget: Icon(
                            Icons.logout,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ItemCard(
                        title: 'version',
                        color: Get.isDarkMode
                            ? Colors.black26
                            : Colors.grey.shade200,
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
          );
  }
}
