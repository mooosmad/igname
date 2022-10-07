import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'camion.dart';
import 'car.dart';
import 'moto.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  /// The global key to access the animated list.

  final List<Image> images = [
    Image.asset(
      "assets/icons/home/moto.png",
      height: 100,
      width: 100,
    ),
    Image.asset(
      "assets/icons/home/car.png",
      height: 100,
      width: 100,
    ),
    Image.asset(
      "assets/icons/home/bus.png",
      height: 100,
      width: 100,
    )
  ];
  final List<String> titles = ["Moto", "Car", "Bus"];
  final options = const LiveOptions(
    // Start animation after (default zero)
    delay: Duration(seconds: 1),

    // Show each item through (default 250)
    showItemInterval: Duration(milliseconds: 500),

    // Animation duration (default 250)
    showItemDuration: Duration(seconds: 1),

    visibleFraction: 0.05,

    reAnimateOnVisibility: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example')),
      body: // With predefined options
          LiveList.options(
        options: options,

        // Like ListView.builder, but also includes animation property
        itemBuilder: buildAnimatedItem,

        // Other properties correspond to the
        // `ListView.builder` / `ListView.separated` widget
        scrollDirection: Axis.vertical,
        itemCount: 3,
      ),
    );
  }

  // Build animated item (helper for all examples)
  Widget buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        // And slide transition
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          // Paste you Widget
          child: GestureDetector(
            onTap: () {
              Get.to(const Car());
            },
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: const Color(0xfffdc72f).withOpacity(0.8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "${titles[index]}",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      images[index],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
