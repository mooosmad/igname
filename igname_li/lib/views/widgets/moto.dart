import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:igname_li/components/loading.dart';
import 'package:igname_li/components/map_recuperation.dart';
import 'package:igname_li/components/map_livraison.dart';
import 'package:igname_li/utils/utils.dart';

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
                  const Icon(Icons.location_city),
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
            myMap(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Lieu de recuperation $adresseDeLivraison",
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
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            myMap2(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Lieu de livraison $adresseDeLivraison2",
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
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                // controller: contact,
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
                      color:
                          Get.isDarkMode ? Colors.white : Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          Get.isDarkMode ? Colors.white : Colors.grey.shade500,
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
            myrecap(),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget myMap() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
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
    const _controller = StaticMapController(
      googleApiKey: keymap,
      width: 400,
      height: 100,
      zoom: 10,
      center: Location(-3.1178833, -60.0029284),
    );

    /// Get map image provider from controller.
    /// You can also get image url by accessing
    /// `_controller.url` property.
    ImageProvider<Object> image = _controller.image;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
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
            child: adresseDeLivraison2 == null
                ? const Loading()
                : Image.asset(
                    "assets/images/illustration.jpg",
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }

  Widget myrecap() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: Colors.grey[200],
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
                  "1000 FCFA",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
