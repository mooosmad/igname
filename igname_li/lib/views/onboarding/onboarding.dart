// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:onboarding_screen/onboarding_screen.dart';

class Onboarding extends StatelessWidget {
  Onboarding({Key? key}) : super(key: key);

  final PageController _controller = PageController();

  final List<_SliderModel> mySlides = [
    _SliderModel(
      imageAssetPath: Image.asset(
        'assets/images/delivery.png',
        scale: 1,
        fit: BoxFit.cover,
      ),
      title: 'Developer Student Club',
      desc: 'discover people',
      minTitleFontSize: 10,
      descStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    _SliderModel(
      imageAssetPath: Image.asset('assets/images/looking-at-start.png'),
      title: 'Developer Student Club',
      desc: 'discover people',
      descStyle: const TextStyle(),
      titleStyle: const TextStyle(),
    ),
    _SliderModel(
      imageAssetPath: Image.asset('assets/images/security-system.png'),
      title: 'Developer Student Club',
      desc: 'discover people',
      descStyle: const TextStyle(),
      titleStyle: const TextStyle(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen(
      /// This [mySlides] must not be more than 5.
      mySlides: mySlides,
      controller: _controller,
      slideIndex: 0,
      statusBarColor: Colors.red,
      startGradientColor: const Color(0xfffdc72f),
      endGradientColor: Colors.white,
      skipStyle: const TextStyle(color: Colors.white),
      pageIndicatorColorList: const [
        Colors.black,
        Colors.black,
        Colors.black,
      ],
    );
  }
}

class _SliderModel {
  const _SliderModel({
    required this.imageAssetPath,
    this.title = "title",
    this.desc = "title",
    // ignore: unused_element
    this.miniDescFontSize = 12.0,
    this.minTitleFontSize = 15.0,
    required this.descStyle,
    required this.titleStyle,
  });

  final Image imageAssetPath;
  final String title;
  final TextStyle titleStyle;
  final double minTitleFontSize;
  final String desc;
  final TextStyle descStyle;
  final double miniDescFontSize;
}
