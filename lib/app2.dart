import 'package:flutter/material.dart';
import 'package:flutter_app/personal_material.dart';

class VisibilityExample extends StatefulWidget {
  @override
  _VisibilityExampleState createState() {
    return _VisibilityExampleState();
  }
}

class _VisibilityExampleState extends State {
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/background/logging.jpg"),
                fit: BoxFit.cover)),
      child: Column(
        children: <Widget>[
          
          const SizedBox(height: 32),
          Image.asset("asset/Logo_Appetee.png"),
          const SizedBox(height: 24),
          PersonalMaterial.rectangleOutsideShadow(50.0, 300.0, 50.0),
          const SizedBox(height: 72),
          PersonalMaterial.rectangleOutsideShadow(300.0, 300.0, 50.0),
        ],
      ),
        ),
    );
  }
}
