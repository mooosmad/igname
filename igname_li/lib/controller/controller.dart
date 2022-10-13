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
  RxDouble distance = 0.0.obs;
  RxDouble longLivraison = 0.0.obs;
  RxDouble latLivraison = 0.0.obs;
  RxDouble longRecuperation = 0.0.obs;
  RxDouble latRecuperation = 0.0.obs;
  RxString prix = "".obs;
  @override
  void onInit() {
    super.onInit();
  }
}
