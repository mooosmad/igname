import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igname_li/components/background.dart';

class Signin extends StatelessWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CONNEXION",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        leading: const SizedBox(width: 0),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Background(
          child: Form(
            // key: formGlobalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  child: TextFormField(
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor:
                          Get.isDarkMode ? Colors.black38 : Colors.white54,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xfffdc72f),
                        ),
                      ),
                      hintText: 'Numero de telephone',
                      hintStyle: Theme.of(context).textTheme.bodyText2,
                    ),
                    cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  child: TextFormField(
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor:
                          Get.isDarkMode ? Colors.black38 : Colors.white54,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xfffdc72f),
                        ),
                      ),
                      hintText: 'Mot de passe',
                      hintStyle: Theme.of(context).textTheme.bodyText2,
                    ),
                    cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                OutlinedButton(
                  onPressed: () {
                    // Get.to(const Signup());
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor:
                        Get.isDarkMode ? Colors.white : Colors.black,
                    elevation: 1,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(5.0),
                    // ),
                    fixedSize: const Size(350, 50),
                  ),
                  child: Text(
                    "Je me connecte",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                        ),
                  ),
                ),
                SizedBox(height: size.height * 0.08),
                Container(
                  alignment: Alignment.bottomRight,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      // Get.off(

                      //   transition: Transition.downToUp,
                      // );
                    },
                    child: Text(
                      "Je n'ai pas de compte Je m'inscris",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
