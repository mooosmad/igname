import 'package:flutter/material.dart';

class Camion extends StatefulWidget {
  const Camion({Key? key}) : super(key: key);

  @override
  State<Camion> createState() => _CamionState();
}

class _CamionState extends State<Camion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Livraison à camion"),
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
