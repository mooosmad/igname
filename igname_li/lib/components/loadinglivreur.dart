import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class Loadinglivreur extends StatelessWidget {
  const Loadinglivreur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/lotties/livreur.json",
                width: 300,
                height: 300,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Shimmer.fromColors(
                  baseColor: Get.isDarkMode ? Colors.white : Colors.black,
                  highlightColor:
                      Get.isDarkMode ? Colors.grey.shade700 : Colors.grey,
                  child: Text(
                    "Recherche de livreur dans votre zone",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Lottie.asset(
                "assets/lotties/loader.json",
                width: 300,
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
