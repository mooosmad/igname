import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Bonjour, Mo",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  color: Get.isDarkMode ? Colors.black38 : Colors.grey.shade200,
                ),
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Moto",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Image.asset("assets/images/motol.png"),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: Get.isDarkMode ? Colors.black26 : Colors.grey.shade200,
                ),
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Car",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Image.asset("assets/images/car.png"),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: Get.isDarkMode ? Colors.black26 : Colors.grey.shade200,
                ),
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Hola",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Image.asset("assets/images/bus.png"),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
