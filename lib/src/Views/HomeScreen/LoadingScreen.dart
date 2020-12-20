import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/Style.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/background/home_screen.jpg"),
                fit: BoxFit.cover)),
        child: _buildBody(context),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            margin:
            const EdgeInsets.only(top: 48, left: 48, right: 48, bottom: 48),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset("asset/test.png"),
                  const SizedBox(height: 48.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Un plat selon \n vos envies',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 28,
                            color: Colors.redAccent,
                            decoration: TextDecoration.none,
                            height: 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 72),
                  ElevatedButton(
                    child: Text(
                      'Commencer',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            height: 1),
                      ),
                    ),
                    style: CustomButtonTheme.redButton(),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoadingScreen()
                        ),
                      );
                    },
                  ),
                  //ElevatedButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}