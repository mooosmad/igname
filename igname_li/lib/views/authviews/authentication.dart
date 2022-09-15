import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igname_li/views/authviews/signin.dart';
import 'package:igname_li/views/authviews/signup.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          height: 0,
        ),
      ),
      body: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Center(
                  child: Text(
                    "Bienvenue",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Text(
                  "Iwa",
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: 10),
                Center(
                  // height: 300,
                  child: Image.asset("assets/images/moto.png"),
                ),
              ],
            ),
            Column(
              children: [
                OutlinedButton(
                  onPressed: () {
                    Get.to(const Signup());
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
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () {
                    Get.to(const Signin());
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor:
                        Get.isDarkMode ? Colors.transparent : Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: const BorderSide(color: Colors.red, width: 10.0)),
                    fixedSize: const Size(350, 50),
                  ),
                  child: Text(
                    "Je me connecte",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
