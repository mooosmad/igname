import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Center(
          child: Lottie.asset(
            "assets/lotties/loader.json",
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}
