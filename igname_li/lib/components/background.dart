import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Positioned(
          //   top: 50,
          //   right: 30,
          //   child: Image.asset("assets/images/deliwa.JPG",
          //       width: size.width * 0.4),
          // ),
          Positioned(
            // top: 10,
            // bottom: 20,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/3.png",
              // width: size.width,
              fit: BoxFit.fill,
            ),
          ),
          BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: child)
        ],
      ),
    );
  }
}
