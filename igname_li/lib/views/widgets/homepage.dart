// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:igname_li/views/widgets/camion.dart';
import 'package:igname_li/views/widgets/car.dart';
import 'package:igname_li/views/widgets/moto.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // user box
  late Box userBox;

  @override
  void initState() {
    super.initState();
    // get the previously opened user box
    userBox = userBox.get('boxUser');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Hi, $userBox.name",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Choisissez le type d'engins pour votre livraison",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(const Moto());
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    color: const Color(0xfffdc72f).withOpacity(0.8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Moto",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Image.asset("assets/images/motol.png"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Get.to(const Car());
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: const Color(0xfffdc72f).withOpacity(0.8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Car",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Image.asset("assets/images/car.png"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Get.to(const Camion());
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: const Color(0xfffdc72f).withOpacity(0.8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Camion",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Image.asset("assets/images/bus.png"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
