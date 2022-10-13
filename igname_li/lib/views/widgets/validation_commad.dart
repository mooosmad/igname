// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igname_li/components/loadinglivreur.dart';
import 'package:igname_li/services/api_services.dart';
import 'package:igname_li/utils/constant.dart';

import 'package:shimmer/shimmer.dart';

class ValidationPage extends StatefulWidget {
  final String? lieuxLivraison;
  final String? lieuxLivraison2;
  final String? moyentPayement;
  final String? numerodureceveur;

  const ValidationPage({
    Key? key,
    this.lieuxLivraison,
    this.moyentPayement,
    this.lieuxLivraison2,
    this.numerodureceveur,
  }) : super(key: key);

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  bool load = false;

  @override
  Widget build(BuildContext context) {
    return load
        ? WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Loadinglivreur())
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xfffdc72f),
              elevation: 0,
              title: Text(
                // "Je valide votre commande",
                "Confirmation",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            body: ListView(
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
                                  widget.lieuxLivraison!,
                                  style: Theme.of(context).textTheme.bodyText2!,
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
                                  widget.lieuxLivraison2!,
                                  style: Theme.of(context).textTheme.bodyText2!,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                myrecap(),
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
                                  style: Theme.of(context).textTheme.bodyText2,
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
                SizedBox(
                  height: 30,
                ),
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
              ],
            ),
          );
  }

  Widget myrecap() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          color: Get.isDarkMode ? Colors.grey.shade800 : Colors.grey[200],
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
                    "1000 FCFA",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              )
            ],
          ),
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
                "${widget.lieuxLivraison}",
                "${widget.lieuxLivraison2}",
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
