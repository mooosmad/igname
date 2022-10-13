import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("À propos de nous"),
      ),
      body: Container(
        color: Get.isDarkMode ? Colors.black26 : Colors.grey.shade200,
        height: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: const [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text("Prumad",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18)),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text("These are the most important society",
                        style: TextStyle(fontSize: 14)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
