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
