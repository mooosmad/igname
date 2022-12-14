// ignore_for_file: unrelated_type_equality_checks, avoid_print, use_build_context_synchronously

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:igname_li/components/map_recuperation.dart';
import 'package:igname_li/components/map_livraison.dart';
import 'package:igname_li/controller/controller.dart';
import 'package:igname_li/utils/constant.dart';
import 'package:igname_li/views/widgets/validation_commad.dart';

class Moto extends StatefulWidget {
  const Moto({Key? key}) : super(key: key);

  @override
  State<Moto> createState() => _MotoState();
}

class _MotoState extends State<Moto> {
  final Completer<GoogleMapController> _controllerMapRecuperation = Completer();
  final Completer<GoogleMapController> _controllerMapLivraison = Completer();

  TextEditingController contactRecepteur = TextEditingController();
  TextEditingController natureDucolis = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  changePositionOnMap(
      Completer<GoogleMapController> controllerMap, LatLng newPosition) async {
    final GoogleMapController controller = await controllerMap.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: newPosition,
          zoom: 14.4746,
        ),
      ),
    );
  }

  bool getIfPlaceIsEmpty(MainController maincontroller) {
    return maincontroller.latLivraison.value == 0 &&
            maincontroller.longLivraison.value == 0 ||
        maincontroller.latRecuperation.value == 0 &&
            maincontroller.longRecuperation.value == 0;
  }

  String getPriceSwitchDistance(MainController maincontroller) {
    return maincontroller.distance.value <= 0.0
        ? maincontroller.prix.value = "0"
        : maincontroller.distance.value <= 4.0
            ? maincontroller.prix.value = "1000"
            : maincontroller.distance.value > 4.0 &&
                    maincontroller.distance.value <= 10.0
                ? maincontroller.prix.value = "1500"
                : maincontroller.distance.value > 10.0 &&
                        maincontroller.distance.value <= 17.0
                    ? maincontroller.prix.value = "2000"
                    : maincontroller.distance.value > 17.0 &&
                            maincontroller.distance.value <= 40.0
                        ? maincontroller.prix.value = "2500"
                        : maincontroller.prix.value = "3000";
  }

  @override
  Widget build(BuildContext context) {
    final motoController = Get.put(MotoController());
    // final maincontroller = Get.put(MainController());

    final maincontroller = Get.find<MainController>();
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: const Text("Livraison ?? moto")),
        body: Form(
          key: formGlobalKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
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
                        "Si votre commande entre dans notre sac ?? dos,\nOn peut vous livrer. Si non choisissez voiture...",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Qu'est-ce qu'on vous apportes ?",
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  // margin: const EdgeInsets.symmetric(horizontal: 18),
                  child: TextFormField(
                    controller: natureDucolis,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Dites nous quelques choses";
                      }
                      return null;
                    },
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    decoration: InputDecoration(
                      fillColor: Get.isDarkMode
                          ? Colors.grey.shade800
                          : Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      hintText: "Dites nous ce qui entrera dans notre sac...",
                      hintStyle: Theme.of(context).textTheme.bodyText2!,
                    ),
                    autofocus: false,
                    maxLines: null,
                    cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  "Votre commande",
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/partirdou.png",
                        height: 25,
                        width: 25,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "?? partir d'o?? ?",
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: InkWell(
                      onTap: () async {
                        final res = await Get.to(
                          const MyMapRecup(),
                          transition: Transition.size,
                        );
                        motoController.adresseDeRecuperation.value = res ?? "";
                        if (res != null) {
                          Fluttertoast.showToast(msg: "choix effectu??");
                          changePositionOnMap(
                            _controllerMapRecuperation,
                            LatLng(maincontroller.latRecuperation.value,
                                maincontroller.longRecuperation.value),
                          );
                          maincontroller.distance.value = calculateDistance(
                              maincontroller.latLivraison.value,
                              maincontroller.longLivraison.value,
                              maincontroller.latRecuperation.value,
                              maincontroller.longRecuperation.value);
                        }
                      },
                      child: IgnorePointer(
                        child: SizedBox(
                            height: 100,
                            child: GoogleMap(
                              mapType: MapType.normal,
                              initialCameraPosition: const CameraPosition(
                                target: LatLng(0, 0),
                                zoom: 14.4746,
                              ),
                              onMapCreated:
                                  (GoogleMapController controller) async {
                                String styleDark =
                                    await DefaultAssetBundle.of(context)
                                        .loadString(
                                            'assets/maps/map_style_dark.json');
                                String styleLight =
                                    await DefaultAssetBundle.of(context)
                                        .loadString(
                                            'assets/maps/map_style_light.json');
                                //customize your map style at: https://mapstyle.withgoogle.com/
                                Get.isDarkMode
                                    ? controller.setMapStyle(styleDark)
                                    : controller.setMapStyle(styleLight);
                                //  Completer<GoogleMapController> _controller = Completer();
                                _controllerMapRecuperation.complete(controller);
                              },
                            )),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Lieu de recuperation : ${motoController.adresseDeRecuperation}",
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
                      Image.asset(
                        "assets/icons/partirdou.png",
                        height: 25,
                        width: 25,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "O?? ?",
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: InkWell(
                      onTap: () async {
                        final res = await Get.to(
                          const MyMapLivraison(),
                          transition: Transition.size,
                        );
                        motoController.adresseDeLivraison.value = res ?? "";
                        if (res != null) {
                          Fluttertoast.showToast(msg: "choix effectu??");
                          changePositionOnMap(
                            _controllerMapLivraison,
                            LatLng(maincontroller.latLivraison.value,
                                maincontroller.longLivraison.value),
                          );

                          maincontroller.distance.value = calculateDistance(
                              maincontroller.latLivraison.value,
                              maincontroller.longLivraison.value,
                              maincontroller.latRecuperation.value,
                              maincontroller.longRecuperation.value);
                        }
                      },
                      child: IgnorePointer(
                        child: SizedBox(
                          height: 100,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: const CameraPosition(
                              target: LatLng(0, 0),
                              zoom: 14.4746,
                            ),
                            onMapCreated:
                                (GoogleMapController controller) async {
                              String styleDark =
                                  await DefaultAssetBundle.of(context)
                                      .loadString(
                                          'assets/maps/map_style_dark.json');
                              String styleLight =
                                  await DefaultAssetBundle.of(context)
                                      .loadString(
                                          'assets/maps/map_style_light.json');
                              //customize your map style at: https://mapstyle.withgoogle.com/
                              Get.isDarkMode
                                  ? controller.setMapStyle(styleDark)
                                  : controller.setMapStyle(styleLight);
                              //  Completer<GoogleMapController> _controller = Completer();
                              _controllerMapLivraison.complete(controller);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Lieu de livraison : ${motoController.adresseDeLivraison}",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Numero",
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  // margin: const EdgeInsets.symmetric(horizontal: 0),
                  child: TextFormField(
                    controller: contactRecepteur,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Ajoutez un numero de telephone s'il vous plait";
                      }
                      return null;
                    },
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      fillColor: Get.isDarkMode
                          ? Colors.grey.shade800
                          : Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      hintText: 'Ajoutez le numero de telephone du recepteur',
                      hintStyle: Theme.of(context).textTheme.bodyText2,
                    ),
                    cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: Get.isDarkMode
                        ? Colors.grey.shade800
                        : Colors.grey[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Recapitulatif.",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Prix de la livraison estim??",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Text(
                              getIfPlaceIsEmpty(maincontroller)
                                  ? "0 FCFA"
                                  : getPriceSwitchDistance(maincontroller),
                              style: Theme.of(context).textTheme.bodyText2,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  "Moyen de paiement",
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 25),
                DropdownButtonFormField<String>(
                  value: "espece",
                  items: const [
                    DropdownMenuItem(
                      value: "espece",
                      child: Text(
                        "Je paye en esp??ce",
                      ),
                    ),
                  ],
                  hint: const Text("Esp??ce"),
                  style: Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(
                    fillColor: Get.isDarkMode
                        ? Colors.grey.shade800
                        : Colors.grey[200],
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange,
                      ),
                    ),
                    hintStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  focusColor: Colors.red,
                  onChanged: (choice) {
                    motoController.value.value = choice!;
                  },
                ),
                const SizedBox(height: 25),
                OutlinedButton(
                  onPressed: () {
                    if (formGlobalKey.currentState!.validate()) {
                      if (motoController.adresseDeRecuperation.isNotEmpty &&
                          motoController.adresseDeLivraison.isNotEmpty) {
                        Get.to(
                          ValidationPage(
                            lieuxRecuperation:
                                motoController.adresseDeRecuperation.value,
                            lieuxLivraison:
                                motoController.adresseDeLivraison.value,
                            moyentPayement: motoController.value.value,
                            numerodureceveur: contactRecepteur.text,
                            prixdelivraison: maincontroller.prix.value,
                            natureDucolis: natureDucolis.text,
                          ),
                          transition: Transition.rightToLeft,
                          popGesture: true,
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg:
                              "Veuillez choisir un lieu de livraison avant de commander.",
                          backgroundColor: maincolor,
                          gravity: ToastGravity.TOP,
                        );
                      }
                    } else {
                      Fluttertoast.showToast(
                        msg:
                            "Veuillez choisir un lieu de livraison avant de commander.",
                        backgroundColor: maincolor,
                        gravity: ToastGravity.TOP,
                      );
                      print("non valid??");
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor:
                        Get.isDarkMode ? Colors.white : Colors.black,
                    elevation: 1,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(5.0),
                    // ),
                    fixedSize: const Size(370, 50),
                  ),
                  child: Text(
                    "Je confirme ma commande",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                        ),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}

class MotoController extends GetxController {
  final adresseDeRecuperation = "".obs;
  final maincontroller = Get.find<MainController>();

  final adresseDeLivraison = "".obs;

  final value = "espece".obs;

  @override
  void onClose() {
    maincontroller.deleteLatLngValue();
    super.onClose();
  }
}
