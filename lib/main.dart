import 'package:flutter/material.dart';
import 'package:flutter_app/src/Views/CreationProfil/HatedFood.dart';
import 'package:flutter_app/src/Views/HomeScreen/WelcomeScreen.dart';
import 'package:flutter_app/src/Views/Logging/SignIn.dart';

import 'old/allergieChoix.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
