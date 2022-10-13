import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igname_li/models/user.dart';
import 'package:igname_li/services/api_services.dart';

class GetUserDataController extends GetxController {
  final user = Rx<User?>(null);
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      user.value = await Apiservices().getDataUser();
    });
    super.onInit();
  }
}

class MainController extends GetxController {
  final load = false.obs;
  final distance = 0.0.obs;
  final longLivraison = 0.0.obs;
  final latLivraison = 0.0.obs;
  final longRecuperation = 0.0.obs;
  final latRecuperation = 0.0.obs;
  final prix = "".obs;
  @override
  void onInit() {
    super.onInit();
    print("***************MAIN CONTROLLER****************");
    print(longLivraison.value);
    print(latLivraison.value);
    print(longRecuperation.value);
    print(latRecuperation.value);
  }

  deleteLatLngValue() {
    distance.value = 0.0;
    longLivraison.value = 0.0;
    latLivraison.value = 0.0;
    longRecuperation.value = 0.0;
    latRecuperation.value = 0.0;
    prix.value = "";
  }
}
