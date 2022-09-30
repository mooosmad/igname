// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igname_li/components/loading.dart';

import 'package:shimmer/shimmer.dart';

class ValidationPage extends StatefulWidget {
  final String? lieuxLivraison;
  final String? lieuxLivraison2;
  final String? moyentPayement;

  const ValidationPage({
    Key? key,
    this.lieuxLivraison,
    this.moyentPayement,
    this.lieuxLivraison2,
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
            child: Loading())
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xfffdc72f),
              elevation: 0,
              title: Text(
                // "Je valide votre commande",
                "Validation",
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
                myrecap(),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: Color(0xfffdc72f),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: FittedBox(
                          child: Text(
                            widget.lieuxLivraison!,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.monetization_on_sharp,
                        color: Color(0xfffdc72f),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: FittedBox(
                          child: Text(
                            "Moyen de payement : ${widget.moyentPayement!}",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Shimmer.fromColors(
                    baseColor: Colors.black,
                    highlightColor: Colors.grey,
                    child: Text(
                      "Veuillez Bien lire avant de valider votre commande",
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      width: double.infinity,
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Recap.",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Livraison",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  "1000 FCFA",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget myButton() {
    return Center(
      child: InkWell(
        onTap: () async {
          setState(() {
            load = true;
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
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Colors.yellow,
          ),
          child: Center(
            child: Text(
              "Je valide ma commande",
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
    );
  }
}
