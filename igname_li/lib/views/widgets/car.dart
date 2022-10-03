import 'package:flutter/material.dart';

class Car extends StatefulWidget {
  const Car({Key? key}) : super(key: key);

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Livraison à voiture"),
      ),
      body: Center(
        child: Text(
          "En cours de maintenance",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
