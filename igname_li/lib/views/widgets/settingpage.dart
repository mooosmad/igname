import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:igname_li/components/card.dart';
import 'package:igname_li/components/loading.dart';
import 'package:igname_li/controller/controller.dart';
import 'package:igname_li/main.dart';
import 'package:igname_li/services/api_services.dart';
import 'package:igname_li/views/widgets/profile.dart';
import 'package:shimmer/shimmer.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Widget _arrow() {
    return Icon(
      Icons.arrow_forward_ios,
      size: 15.0,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    );
  }

  bool load = false;
  bool isdarkmode = Get.isDarkMode;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetUserDataController>();
    return Obx(() {
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
                    color:
                        Get.isDarkMode ? Colors.black45 : Colors.grey.shade200,
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
                        GestureDetector(
                          onTap: () {
                            Get.to(ProfilePage());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Container(
                                  width: 54,
                                  height: 54,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    size: 40,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    controller.user.value != null
                                        ? Text(
                                            "${controller.user.value!.prenom} ${controller.user.value!.nom}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          )
                                        : Get.isDarkMode
                                            ? Shimmer.fromColors(
                                                baseColor: Colors.grey[800]!,
                                                highlightColor:
                                                    Colors.grey[600]!,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                  ),
                                                  width: 80,
                                                  height: 10,
                                                ),
                                              )
                                            : Shimmer.fromColors(
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[100]!,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                  ),
                                                  width: 80,
                                                  height: 10,
                                                ),
                                              ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Mon profiles",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              color: Colors.blueGrey.shade200,
                                              fontSize: 12),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 180),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15.0,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(thickness: 1),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
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
                          iconWidget: Get.isDarkMode
                              ? Image.asset(
                                  "assets/icons/light/apro.png",
                                  height: 30,
                                  width: 30,
                                )
                              : Image.asset(
                                  "assets/icons/dark/apro.png",
                                  height: 30,
                                  width: 30,
                                ),
                        ),
                        ItemCard(
                          title: 'Contactez nous',
                          color: Get.isDarkMode
                              ? Colors.black26
                              : Colors.grey.shade200,
                          rightWidget: _arrow(),
                          iconWidget: Get.isDarkMode
                              ? Image.asset(
                                  "assets/icons/light/contact.png",
                                  height: 30,
                                  width: 30,
                                )
                              : Image.asset(
                                  "assets/icons/dark/contact.png",
                                  height: 30,
                                  width: 30,
                                ),
                        ),
                        ItemCard(
                          title: 'Aides',
                          color: Get.isDarkMode
                              ? Colors.black26
                              : Colors.grey.shade200,
                          rightWidget: Container(),
                          iconWidget: Get.isDarkMode
                              ? Image.asset(
                                  "assets/icons/light/aide.png",
                                  height: 30,
                                  width: 30,
                                )
                              : Image.asset(
                                  "assets/icons/dark/aide.png",
                                  height: 30,
                                  width: 30,
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
                                Get.isDarkMode
                                    ? ThemeMode.light
                                    : ThemeMode.dark,
                              );
                            },
                          ),
                          iconWidget: Get.isDarkMode
                              ? Image.asset(
                                  "assets/icons/light/light.png",
                                  height: 30,
                                  width: 30,
                                )
                              : Image.asset(
                                  "assets/icons/dark/light.png",
                                  height: 30,
                                  width: 30,
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
                            iconWidget: Get.isDarkMode
                                ? Image.asset(
                                    "assets/icons/light/deco.png",
                                    height: 30,
                                    width: 30,
                                  )
                                : Image.asset(
                                    "assets/icons/dark/deco.png",
                                    height: 30,
                                    width: 30,
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ItemCard(
                          title: 'Version',
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
                          iconWidget: Get.isDarkMode
                              ? Image.asset(
                                  "assets/icons/light/version.png",
                                  height: 30,
                                  width: 30,
                                )
                              : Image.asset(
                                  "assets/icons/dark/version.png",
                                  height: 30,
                                  width: 30,
                                ),
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
    });
  }
}
