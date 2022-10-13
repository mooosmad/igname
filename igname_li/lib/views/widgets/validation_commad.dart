// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igname_li/components/loadinglivreur.dart';
import 'package:igname_li/controller/controller.dart';
import 'package:igname_li/services/api_services.dart';
import 'package:igname_li/utils/constant.dart';

import 'package:shimmer/shimmer.dart';

class ValidationPage extends StatefulWidget {
  final String? lieuxRecuperation;
  final String? lieuxLivraison;
  final String? moyentPayement;
  final String? numerodureceveur;
  final String? prixdelivraison;

  const ValidationPage({
    Key? key,
    this.lieuxLivraison,
    this.moyentPayement,
    this.numerodureceveur,
    this.prixdelivraison,
    this.lieuxRecuperation,
  }) : super(key: key);

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  bool load = false;

  @override
  Widget build(BuildContext context) {
    final maincontroller = Get.find<MainController>();
    return load
        ? WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Loadinglivreur())
        : Obx(
            () => Scaffold(
              appBar: AppBar(
                // backgroundColor: Color(0xfffdc72f),
                elevation: 0,
                title: Text(
                  // "Je valide votre commande",
                  "Confirmation",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              body: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Get.isDarkMode
                            ? Colors.grey.shade800
                            : Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Lieux de recuperation.",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/partirdou.png",
                                    height: 25,
                                    width: 25,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    widget.lieuxRecuperation!,
                                    style:
                                        Theme.of(context).textTheme.bodyText2!,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Get.isDarkMode
                            ? Colors.grey.shade800
                            : Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Lieux de livraison.",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/partirdou.png",
                                    height: 25,
                                    width: 25,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    widget.lieuxLivraison!,
                                    style:
                                        Theme.of(context).textTheme.bodyText2!,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      width: double.infinity,
                      height: 120,
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
                                  "Prix de la livraison",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  maincontroller.prix.value,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Get.isDarkMode
                            ? Colors.grey.shade800
                            : Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Numero du receveur.",
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Icon(Icons.phone, color: maincolor),
                                  SizedBox(width: 10),
                                  Text(
                                    widget.numerodureceveur!,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Get.isDarkMode
                            ? Colors.grey.shade800
                            : Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/payement.png",
                              height: 25,
                              width: 25,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Moyen de payement : ${widget.moyentPayement!}",
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Shimmer.fromColors(
                      baseColor: Get.isDarkMode ? Colors.white : Colors.black,
                      highlightColor:
                          Get.isDarkMode ? Colors.grey.shade700 : Colors.grey,
                      child: Text(
                        "Lisez bien avant de confirmer votre commande",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  myButton(),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
  }

  Widget myButton() {
    return Center(
      child: InkWell(
        onTap: () async {
          setState(() {
            load = true;
            Apiservices().addOrder(
                "details",
                "${widget.lieuxRecuperation}",
                "${widget.lieuxLivraison}",
                "${widget.numerodureceveur}",
                "${widget.moyentPayement}");
          });
          // test api create commande ok
          // final r = await APIservices().createCommande(
          //   customer!.nom!,
          //   widget.lieuxLivraison!,
          //   customer.ville!,
          //   customer.email!,
          //   customer.phone!,
          //   products,
          //   int.parse(widget.idUser!),
          // );
          // if (r![0] == true) {
          //   controller.cart.clear();
          //   Fluttertoast.showToast(msg: "Commande effectué");
          //   Get.offAll(
          //     RemercimentPage(
          //       idUser: widget.idUser!,
          //       order: r[1],
          //     ),
          //   );
          // } else {
          //   setState(() {
          //     load = false;
          //   });
          // }
        },
        child: Container(
          height: 50,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: maincolor,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Je confirme ma commande",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
