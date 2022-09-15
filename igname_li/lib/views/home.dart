import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:igname_li/components/loading.dart';
import 'package:igname_li/main.dart';
import 'package:igname_li/services/api_services.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool load = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Center(
            child: Text("Bienvenue"),
          ),
          TextButton(
            onPressed: () {
              APIservices().logout().then((check) {
                // if ret[0] is true reussi
                if (check![0]) {
                  // setState(() {
                  //   load == true;
                  // });
                  const Loading();
                  Fluttertoast.showToast(msg: "Deconnexion effectué");
                  Get.to(CheckAuth());
                }
              });
            },
            child: const Text("Deconnexion"),
          ),
        ]),
      ),
    );
  }
}
