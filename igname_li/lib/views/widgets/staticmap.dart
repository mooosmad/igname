// ignore_for_file: prefer_final_fields, unused_field, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Staticmap extends StatefulWidget {
  const Staticmap({super.key});

  @override
  State<Staticmap> createState() => StaticmapState();
}

class StaticmapState extends State<Staticmap> {
  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(5.302402020561021, -3.9691663585557824),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(5.302402020561021, -3.9691663585557824),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController ccontroller) async {
            String styleDark = await DefaultAssetBundle.of(context)
                .loadString('assets/maps/map_style_dark.json');
            String styleLight = await DefaultAssetBundle.of(context)
                .loadString('assets/maps/map_style_light.json');
            //customize your map style at: https://mapstyle.withgoogle.com/
            Get.isDarkMode
                ? ccontroller.setMapStyle(styleDark)
                : ccontroller.setMapStyle(styleLight);
            //  Completer<GoogleMapController> _controller = Completer();
            _controller.complete(ccontroller);
          },
        ),
      ),
    );
  }
}
