import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(
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
                  onPressed: () {},
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
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor:
                        Get.isDarkMode ? Colors.transparent : Colors.black,
                    elevation: 1,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(5.0),
                    // ),
                    fixedSize: const Size(350, 50),
                  ),
                  child: Text(
                    "Je connecte",
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
