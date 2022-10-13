// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:igname_li/controller/controller.dart';
import 'package:igname_li/services/config.dart';
import 'package:location/location.dart';
import 'package:map_picker/map_picker.dart';
import 'package:shimmer/shimmer.dart';

class MyMapRecup extends StatefulWidget {
  const MyMapRecup({Key? key}) : super(key: key);

  @override
  State<MyMapRecup> createState() => _MyMapRecupState();
}

class _MyMapRecupState extends State<MyMapRecup> {
  GoogleMapController? controller;
  MapPickerController mapPickerController = MapPickerController();
  CameraPosition? cameraPositionRecup;
  PermissionStatus? permissionGranted;
  LocationData? myLocation;
  Location location = Location();
  bool? serviceEnabled;
  String lieuRecuperation = "";

  checkPermission() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled!) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled!) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    myLocation = await location.getLocation();
    cameraPositionRecup = CameraPosition(
      zoom: 14,
      target: LatLng(myLocation!.latitude!, myLocation!.longitude!),
    );
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    checkPermission();
    super.initState();
  }

  @override
  void dispose() {
    if (controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maincontroller = Get.put(MainController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "Adresse de recuperation",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.8,
            width: double.infinity,
            child: myLocation != null
                ? Stack(
                    children: [
                      MapPicker(
                        mapPickerController: mapPickerController,
                        iconWidget: Image.asset(
                          "assets/icons/marker2.png",
                          width: 45,
                          height: 50,
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                            return Transform.translate(
                              offset: const Offset(0, 1),
                              child: child,
                            );
                          },
                        ),
                        child: GoogleMap(
                          minMaxZoomPreference: MinMaxZoomPreference(15, 20),
                          zoomControlsEnabled: false,
                          myLocationEnabled: true,
                          onCameraMoveStarted: () {
                            mapPickerController.mapMoving!();
                          },
                          onCameraIdle: () {
                            mapPickerController.mapFinishedMoving!();
                          },
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                                myLocation!.latitude!, myLocation!.longitude!),
                          ),
                          onMapCreated:
                              (GoogleMapController ccontroller) async {
                            String styleDark =
                                await DefaultAssetBundle.of(context).loadString(
                                    'assets/maps/map_style_dark.json');
                            String styleLight =
                                await DefaultAssetBundle.of(context).loadString(
                                    'assets/maps/map_style_light.json');
                            //customize your map style at: https://mapstyle.withgoogle.com/
                            Get.isDarkMode
                                ? ccontroller.setMapStyle(styleDark)
                                : ccontroller.setMapStyle(styleLight);
                            //  Completer<GoogleMapController> _controller = Completer();
                            controller = ccontroller;
                          },
                          onCameraMove: (newcameraPosition) {
                            cameraPositionRecup = newcameraPosition;
                          },
                        ),
                      ),
                      // Center(
                      //   child: Container(
                      //     height: 60,
                      //     width: 45,
                      //     child: Image.asset(
                      //       "assets/appassets/marker.png",
                      //       frameBuilder: (context, child, frame,
                      //           wasSynchronouslyLoaded) {
                      //         return Transform.translate(
                      //           offset: const Offset(0, -17),
                      //           child: child,
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Shimmer.fromColors(
              baseColor: Get.isDarkMode ? Colors.white : Colors.black,
              highlightColor:
                  Get.isDarkMode ? Colors.grey.shade700 : Colors.grey,
              child: Text(
                "Veuillez Glissez le marker sur le point où vous souhaitez être livré",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              "Mettez le marker sur le point bleu pour choisir votre position",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              if (kDebugMode) {
                print(cameraPositionRecup!.target);
              }
              lieuRecuperation = "${await Config().getNameOfQuartier(
                cameraPositionRecup!.target.latitude,
                cameraPositionRecup!.target.longitude,
              )} ${await Config().getNameOfStreet(
                cameraPositionRecup!.target.latitude,
                cameraPositionRecup!.target.longitude,
              )}";
              maincontroller.latRecuperation.value =
                  "${cameraPositionRecup!.target.longitude}";
              maincontroller.longRecuperation.value =
                  "${cameraPositionRecup!.target.latitude}";
              if (kDebugMode) {
                print(lieuRecuperation);
                print(maincontroller.latRecuperation);
                print(maincontroller.longRecuperation);
              }
              Get.back(result: lieuRecuperation);
            },
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xfffdc72f),
              ),
              child: Center(
                child: Text(
                  "Choisir ma position actuelle",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
