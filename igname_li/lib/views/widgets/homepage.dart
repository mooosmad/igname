// ignore_for_file: must_be_immutable

import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:igname_li/controller/controller.dart';
import 'package:igname_li/utils/shimmer.dart';
import 'package:igname_li/views/widgets/camion.dart';
import 'package:igname_li/views/widgets/car.dart';
import 'package:igname_li/views/widgets/moto.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Image> images = [
    Image.asset(
      "assets/icons/home/moto.png",
      height: 100,
      width: 100,
    ),
    Image.asset(
      "assets/icons/home/car.png",
      height: 100,
      width: 100,
    ),
    Image.asset(
      "assets/icons/home/bus.png",
      height: 100,
      width: 100,
    )
  ];
  final List<Widget> view = [Moto(), Car(), Camion()];
  final List<String> titles = ["Moto", "Voiture", "Camion"];
  final options = const LiveOptions(
    // Start animation after (default zero)
    delay: Duration(seconds: 0),

    // Show each item through (default 250)
    showItemInterval: Duration(milliseconds: 500),

    // Animation duration (default 250)
    showItemDuration: Duration(seconds: 1),

    visibleFraction: 0.01,

    reAnimateOnVisibility: false,
  );
  // final controller = Get.find<GetUserDataController>();
  // print("mon print perso ${controller.user.value}");

  @override
  Widget build(BuildContext context) {
    Get.put(GetUserDataController());
    //
    final controller = Get.find<GetUserDataController>();
    print("mon print perso ${controller.user.value}");
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 1,
      ),
      body: Obx(() {
        return controller.user.value != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Bienvenue ${controller.user.value!.nom}",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Choisissez le type d'engins pour votre livraison",
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.blueGrey.shade300),
                      ),
                    ),
                    LiveList.options(
                      options: options,
                      itemBuilder: buildAnimatedItem,
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      shrinkWrap: true,
                    ),
                  ],
                ),
              )
            : const Shimmerload();
      }),
    );
  }

  // Build animated item (helper for all examples)
  Widget buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      // And slide transition
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, -0.1),
          end: Offset.zero,
        ).animate(animation),
        // Paste you Widget
        child: GestureDetector(
          onTap: () {
            Get.to(view[index]);
          },
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: const Color(0xfffdc72f).withOpacity(0.8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${titles[index]}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    images[index],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
