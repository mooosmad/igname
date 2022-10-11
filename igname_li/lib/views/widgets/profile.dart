import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igname_li/components/loading.dart';
import 'package:igname_li/controller/controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool load = false;
  Widget _arrow() {
    return Icon(
      Icons.mode,
      size: 15.0,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetUserDataController>();
    return Obx(() {
      return load
          ? const Loading()
          : Scaffold(
              appBar: AppBar(
                title: const Text("Modifier le profiles",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              body: Container(
                color: Get.isDarkMode ? Colors.black26 : Colors.grey.shade200,
                height: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: controller.user.value != null
                    //       ? Text(
                    //           "${controller.user.value!.prenom} ${controller.user.value!.nom}",
                    //           style: Theme.of(context).textTheme.bodyText1,
                    //           textAlign: TextAlign.center,
                    //         )
                    //       : Get.isDarkMode
                    //           ? Shimmer.fromColors(
                    //               baseColor: Colors.grey[800]!,
                    //               highlightColor: Colors.grey[600]!,
                    //               child: Container(
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(10),
                    //                   color: Colors.white,
                    //                 ),
                    //                 width: 80,
                    //                 height: 10,
                    //               ),
                    //             )
                    //           : Shimmer.fromColors(
                    //               baseColor: Colors.grey[300]!,
                    //               highlightColor: Colors.grey[100]!,
                    //               child: Container(
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(10),
                    //                   color: Colors.white,
                    //                 ),
                    //                 width: 80,
                    //                 height: 10,
                    //               ),
                    //             ),
                    // ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Nom',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xfffdc72f),
                            ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    ItemCardPro(
                      title: controller.user.value!.nom,
                      color: Get.isDarkMode
                          ? Colors.black26
                          : Colors.grey.shade200,
                      rightWidget: _arrow(),
                    ),
                    const Divider(thickness: 2, endIndent: 10, indent: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Prenom',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xfffdc72f),
                            ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    ItemCardPro(
                      title: controller.user.value!.prenom,
                      color: Get.isDarkMode
                          ? Colors.black26
                          : Colors.grey.shade200,
                      rightWidget: _arrow(),
                    ),
                    const Divider(thickness: 2, endIndent: 10, indent: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Numero',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xfffdc72f),
                            ),
                      ),
                    ),
                    ItemCardPro(
                      title: controller.user.value!.contact,
                      color: Get.isDarkMode
                          ? Colors.black26
                          : Colors.grey.shade200,
                      rightWidget: _arrow(),
                    ),
                    const Divider(thickness: 2, endIndent: 10, indent: 10),
                  ],
                ),
              ),
            );
    });
  }
}

class ItemCardPro extends StatelessWidget {
  const ItemCardPro({
    super.key,
    required this.title,
    required this.color,
    required this.rightWidget,
  });

  final Color color;
  final String title;
  final Widget rightWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 24),
            child: rightWidget,
          )
        ],
      ),
    );
  }
}
