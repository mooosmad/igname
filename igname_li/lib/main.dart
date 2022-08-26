import 'package:flutter/material.dart';
import 'package:igname_li/views/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iwa',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Onboarding(),
    );
  }
}
