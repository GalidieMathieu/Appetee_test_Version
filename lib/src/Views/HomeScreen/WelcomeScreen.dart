import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/enum.dart';
import 'package:flutter_app/src/Views/CreationProfil/FoodIssue.dart';
import 'package:flutter_app/src/Views/CreationProfil/HatedFood.dart';
import 'package:flutter_app/src/Views/Logging/SignIn.dart';
import 'package:flutter_app/src/Views/HomeScreen/LoadingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return HomeScreen();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
          return (_firebaseAuth.currentUser != null)
              ? FoodIssue(foodSelected : TypeSelection.DIET)//LoadingScreen()
              : SignIn();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return HomeScreen();
      },
    );
  }
}

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/background/home_screen.jpg"),
                fit: BoxFit.cover)),
        child: Center(
            child: Image.asset("asset/test.png")),
      ),
    );
  }
}
