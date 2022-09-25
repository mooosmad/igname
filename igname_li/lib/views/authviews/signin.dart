// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igname_li/components/background.dart';
import 'package:igname_li/components/loading.dart';
import 'package:igname_li/services/api_services.dart';
import 'package:igname_li/views/authviews/signup.dart';
import 'package:igname_li/views/home.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController contact = TextEditingController();
  TextEditingController password = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  bool load = false;
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return load
        ? const Loading()
        : Scaffold(
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
              child: SingleChildScrollView(
                child: Background(
                  child: Form(
                    key: formGlobalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: TextFormField(
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                            controller: contact,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Champ vide";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Get.isDarkMode
                                  ? Colors.black38
                                  : Colors.white54,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              hintText: 'Numero de telephone',
                              hintStyle: Theme.of(context).textTheme.bodyText2,
                            ),
                            cursorColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: TextFormField(
                            controller: password,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Champ vide";
                              }
                              return null;
                            },
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              fillColor: Get.isDarkMode
                                  ? Colors.black38
                                  : Colors.white54,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              hintText: 'Mot de passe',
                              hintStyle: Theme.of(context).textTheme.bodyText2,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _toggle();
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off_sharp,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            cursorColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: size.height * 0.05),
                        OutlinedButton(
                          onPressed: () {
                            if (formGlobalKey.currentState!.validate()) {
                              setState(() {
                                load = true;
                              });
                              // User usermodel = User(
                              //   nom: nom.text,
                              //   prenom: prenom.text,
                              //   contact: contact.text,
                              //   password: password.text,
                              // );
                              APIservices()
                                  .loginUser(contact.text, password.text)
                                  .then((check) {
                                setState(() {
                                  load = false;
                                });
                                if (check![0]) {
                                  Fluttertoast.showToast(
                                      msg: "Vous êtes connecté");
                                  Get.to(const Home());
                                } else {
                                  Fluttertoast.showToast(msg: "${check[1]}");
                                  Get.to(const Signin());
                                }
                              });
                            } else {
                              print("non valide");
                            }
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
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Get.isDarkMode
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.08),
                        Container(
                          alignment: Alignment.bottomRight,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(const Signup());
                            },
                            child: Text(
                              "Je n'ai pas de compte, Je m'inscris",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
