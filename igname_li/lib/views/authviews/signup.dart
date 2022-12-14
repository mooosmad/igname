// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igname_li/components/background.dart';
import 'package:igname_li/components/loading.dart';
import 'package:igname_li/services/api_services.dart';
import 'package:igname_li/views/authviews/signin.dart';
import 'package:igname_li/views/home.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController retapassword = TextEditingController();
  bool _obscureText = true;
  bool _obscureRText = true;
  bool load = false;
  final formGlobalKey = GlobalKey<FormState>();
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggler() {
    setState(() {
      _obscureRText = !_obscureRText;
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
                "INSCRIPTION",
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
                            controller: nom,
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
                              hintText: 'Nom',
                              hintStyle: Theme.of(context).textTheme.bodyText2!,
                            ),
                            cursorColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: TextFormField(
                            controller: prenom,
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
                              hintText: 'Prenom',
                              hintStyle: Theme.of(context).textTheme.bodyText2!,
                            ),
                            cursorColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: TextFormField(
                            controller: contact,
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
                              hintStyle: Theme.of(context).textTheme.bodyText2!,
                            ),
                            cursorColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: TextFormField(
                            controller: password,
                            validator: ((value) {
                              if (value!.length < 6) {
                                return "Mot de passe trop court";
                              } else if (value.isEmpty) {
                                return "Champ vide";
                              }
                              return null;
                            }),
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
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
                              hintStyle: Theme.of(context).textTheme.bodyText2!,
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
                        SizedBox(height: size.height * 0.01),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: TextFormField(
                            controller: retapassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Champ vide";
                              } else if (value != password.text) {
                                return "mot de passe different";
                              }
                              return null;
                            },
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                            obscureText: _obscureRText,
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
                              hintText: 'Confirmez votre mot de passe',
                              hintStyle: Theme.of(context).textTheme.bodyText2!,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _toggler();
                                },
                                child: Icon(
                                  _obscureRText
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

                              // User user = User(
                              //     nom: nom.text,
                              //     prenom: prenom.text,
                              //     contact: contact.text,
                              //     password: password.text);

                              Apiservices()
                                  .registerUser(nom.text, prenom.text,
                                      contact.text, password.text)
                                  .then((check) {
                                setState(() {
                                  load = false;
                                });
                                if (check![0]) {
                                  Fluttertoast.showToast(
                                      msg: "Inscription effectu?? avec succ??s");
                                  Get.offAll(const Home());
                                } else {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Vous avez d??ja un compte, veuillez vous connecter");
                                  Get.off(const Signin());
                                }
                              });
                            } else {
                              print("non valide");
                            }
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
                            "Je m'inscris",
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
                              Get.off(const Signin(),
                                  transition: Transition.leftToRight);
                            },
                            child: Text(
                              "J'ai d??j?? un compte? Je me connecte",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.08),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
