import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mes commandes",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: const Center(
        child: Text("Aucune commandes pour l'instant"),
      ),
    );
  }
}
