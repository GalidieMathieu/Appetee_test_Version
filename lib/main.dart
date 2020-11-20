import 'package:flutter/material.dart';
import 'package:flutter_app/src/Logging/View/SignIn.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyApp5(),
    );
  }
}