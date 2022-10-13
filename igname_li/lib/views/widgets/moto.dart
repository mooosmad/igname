// ignore_for_file: unrelated_type_equality_checks, avoid_print, use_build_context_synchronously

import 'dart:async';

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
  final Completer<GoogleMapController> _controller = Completer();

  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(5.302402020561021, -3.9691663585557824),
  //   zoom: 14.4746,
  // );

  // static const CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(5.302402020561021, -3.9691663585557824),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  RxString adresseDeLivraison = "".obs;

  RxString adresseDeLivraison2 = "".obs;

  RxString value = "espece".obs;

  TextEditingController contactRecepteur = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final maincontroller = Get.put(MainController(), permanent: true);
    print(maincontroller.latLivraison);
    return Obx((() {
      return Scaffold(
        appBar: AppBar(title: const Text("Livraison à moto")),
        body: Padding(
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
                      "Si votre commande entre dans notre sac à dos,\nOn peut vous livrer. Si non choisissez voiture...",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                    ),
                  ],
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
                      "À partir d'où ?",
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
                      adresseDeLivraison.value = res ?? "";
                      if (res != null) {
                        Fluttertoast.showToast(msg: "choix effectué");
                      }
                    },
                    child: IgnorePointer(
                      child: SizedBox(
                        height: 100,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                                double.parse(
                                    maincontroller.latRecuperation.value),
                                double.parse(
                                    maincontroller.longRecuperation.value)),
                            zoom: 14.4746,
                          ),
                          onMapCreated:
                              (GoogleMapController ccontroller) async {
                            String styleDark =
                                await DefaultAssetBundle.of(context).loadString(
                                    'assets/maps/map_style_dark.json');
                            String styleLight =
                                await DefaultAssetBundle.of(context).loadString(
                                    'assets/maps/map_style_light.json');
                            //customize your map style at: https://mapstyle.withgoogle.com/
                            Get.isDarkMode
                                ? ccontroller.setMapStyle(styleDark)
                                : ccontroller.setMapStyle(styleLight);
                            //  Completer<GoogleMapController> _controller = Completer();
                            _controller.complete(ccontroller);
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
                  "Lieu de recuperation : $adresseDeLivraison",
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
                      "Où ?",
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
                      adresseDeLivraison2.value = res ?? "";
                      if (res != null) {
                        Fluttertoast.showToast(msg: "choix effectué");
                      }
                    },
                    child: IgnorePointer(
                      child: SizedBox(
                        height: 100,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                                double.parse(maincontroller.latLivraison.value),
                                double.parse(
                                    maincontroller.longLivraison.value)),
                            zoom: 14.4746,
                          ),
                          onMapCreated:
                              (GoogleMapController ccontroller) async {
                            String styleDark =
                                await DefaultAssetBundle.of(context).loadString(
                                    'assets/maps/map_style_dark.json');
                            String styleLight =
                                await DefaultAssetBundle.of(context).loadString(
                                    'assets/maps/map_style_light.json');
                            //customize your map style at: https://mapstyle.withgoogle.com/
                            Get.isDarkMode
                                ? ccontroller.setMapStyle(styleDark)
                                : ccontroller.setMapStyle(styleLight);
                            //  Completer<GoogleMapController> _controller = Completer();
                            _controller.complete(ccontroller);
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
                  "Lieu de livraison : $adresseDeLivraison2",
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  key: formGlobalKey,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  controller: contactRecepteur,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Champ vide";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    // fillColor: Get.isDarkMode
                    //     ? Colors.grey.shade100
                    //     : Colors.grey.shade200,
                    filled: false,
                    // border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(8),
                    //     borderSide: BorderSide.none),
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(
                    //     color: Get.isDarkMode ? Colors.white : Colors.black,
                    //   ),
                    // ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Get.isDarkMode
                            ? Colors.white
                            : Colors.grey.shade300,
                      ),
                    ),

                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Get.isDarkMode
                            ? Colors.white
                            : Colors.grey.shade500,
                      ),
                    ),
                    // border: UnderlineInputBorder(
                    //   borderSide: BorderSide(
                    //     color: Get.isDarkMode ? Colors.white : Colors.black,
                    //   ),
                    // ),
                    hintText: 'Ajoutez le numero de telephone du recepteur ',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.grey.shade400),
                    prefixIcon: const Icon(Icons.phone_android_rounded),
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
                  color:
                      Get.isDarkMode ? Colors.grey.shade800 : Colors.grey[200],
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
                            "Prix de la livraison estimé",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            "1000 FCFA  ",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
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
              payementDrop(),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  if (adresseDeLivraison.isEmpty &&
                      adresseDeLivraison2.isEmpty) {
                    Fluttertoast.showToast(
                      msg:
                          "Veuillez choisir un lieu de livraison avant de commander.",
                      backgroundColor: maincolor,
                      gravity: ToastGravity.TOP,
                    );
                  } else {
                    Get.to(
                      ValidationPage(
                        lieuxLivraison: adresseDeLivraison.value,
                        lieuxLivraison2: adresseDeLivraison2.value,
                        moyentPayement: value.value,
                        numerodureceveur: contactRecepteur.text,
                      ),
                      transition: Transition.rightToLeft,
                      popGesture: true,
                    );
                  }
                },
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xfffdc72f),
                  ),
                  child: Center(
                    child: Text(
                      "Je valide ma commande",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }));
  }

  Widget payementDrop() {
    return DropdownButtonFormField<String>(
      value: "espece",
      items: const [
        DropdownMenuItem(
          value: "espece",
          child: Text(
            "Je paye en espèce",
          ),
        ),
        // DropdownMenuItem(
        //   value: "OrangeMoney",
        //   child: Text(
        //     "OrangeMoney(0769418743)",
        //   ),
        // ),
      ],
      hint: const Text("Espèce"),
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
        fillColor: Get.isDarkMode ? Colors.grey.shade800 : Colors.grey[200],
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
        value = choice!.obs;
        print(value);
      },
    );
  }
}
