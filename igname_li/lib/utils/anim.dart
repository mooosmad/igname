// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class BoxAnim extends StatefulWidget {
  const BoxAnim({Key? key}) : super(key: key);

  @override
  _BoxAnimState createState() => _BoxAnimState();
}

class _BoxAnimState extends State<BoxAnim> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double width = 50;
  double height = 50;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _controller.addListener(() {
      setState(() {
        if (_controller.value <= 0.1) {
          width = 180;
          height = 170;
        } else if (_controller.value <= 0.3) {
          width = 50;
          height = 50;
        } else if (_controller.value <= 0.5) {
          width = 180;
          height = 170;
        } else if (_controller.value <= 0.7) {
          width = 150;
          height = 50;
        } else if (_controller.value <= 1) {
          width = 50;
          height = 50;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: <Widget>[
          RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              width: width,
              height: height,
              color: Colors.orangeAccent,
            ),
          ),
          const SizedBox(height: 50),
          OutlinedButton(
            child: const Text("go"),
            onPressed: () => _controller.forward(),
          ),
          OutlinedButton(
            child: const Text("stop"),
            onPressed: () => _controller.reset(),
          ),
        ],
      ),
    );
  }
}
