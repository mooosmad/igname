import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:igname_li/components/map.dart';
import 'package:igname_li/components/map2.dart';

class Moto extends StatefulWidget {
  const Moto({Key? key}) : super(key: key);

  @override
  State<Moto> createState() => _MotoState();
}

class _MotoState extends State<Moto> {
  RxString adresseDeLivraison = "".obs;

  RxString adresseDeLivraison2 = "".obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Livraison à moto"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                color: const Color(0xfffdc72f).withOpacity(0.7),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.3),
                //     spreadRadius: 2,
                //     blurRadius: 2,
                //     offset: const Offset(0, 3), // changes position of shadow
                //   ),
                // ],
              ),
              height: 60,
              width: Get.height * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.delivery_dining),
                  Text(
                    "Si votre commande entre dans notre sac à dos,\nOn peut vous livrer. Si non choisissez voiture...",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.location_city),
                  const SizedBox(width: 10),
                  Text(
                    "À partir d'où ?",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            myMap(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Lieu de Recuperation",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.location_city_rounded),
                  const SizedBox(width: 10),
                  Text(
                    "Où ?",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            myMap(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Lieu de Livraison",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myMap() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: InkWell(
          onTap: () async {
            final res = await Get.to(
              const MyMap(),
              transition: Transition.size,
            );
            adresseDeLivraison.value = res ?? "";
            if (res != null) {
              Fluttertoast.showToast(msg: "choix effectué");
            }
          },
          child: IgnorePointer(
            child: Image.asset(
              "assets/images/illustration.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget myMap2() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: InkWell(
          onTap: () async {
            final res = await Get.to(
              const MyMap2(),
              transition: Transition.size,
            );
            adresseDeLivraison2.value = res ?? "";
            if (res != null) {
              Fluttertoast.showToast(msg: "choix effectué");
            }
          },
          child: IgnorePointer(
            child: Image.asset(
              "assets/images/illustration.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
